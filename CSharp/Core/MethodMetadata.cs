using System.Reflection;

namespace JumpCS.Core
{
    /// <summary>Metadata and state for a class method</summary>
    public class MethodMetadata : CSharpElement
    {
        public ClassMetadata OwningClass { get; }
        public string Name { get; }
        public string Signature { get; }
        public MethodInfo? ReflectionMethod { get; }
        public ConstantPool? ConstantPool { get; }

        public int AccessFlags { get; set; }
        public AttributeTable? Attributes { get; set; }
        public byte[]? Code { get; set; }
        public int CodeLength { get; set; }
        public int MaxStack { get; set; }
        public int MaxLocals { get; set; }

        /// <summary>Reference to native implementation, if any</summary>
        public object? NativeRef { get; set; }

        /// <summary>Dependencies used by native methods</summary>
        public List<CSharpElement> NativeDependencies { get; } = new();

        /// <summary>Generic method this belongs to</summary>
        public GenericMethod? GenericMethod { get; set; }

        /// <summary>Effective method for virtual invocations</summary>
        public MethodMetadata? EffectiveMethod { get; set; }

        private bool _effectiveMethodComputed = false;

        /// <summary>Index in virtual function tables</summary>
        public int VtableIndex { get; set; } = -1;

        /// <summary>Global index of this needed method</summary>
        public int MethodIndex { get; set; } = -1;

        /// <summary>Whether this method is virtual</summary>
        public bool IsVirtual => (AccessFlags & (int)MethodAttributes.Virtual) != 0;

        /// <summary>Whether this method is static</summary>
        public bool IsStatic => (AccessFlags & (int)MethodAttributes.Static) != 0;

        /// <summary>Whether this method is abstract</summary>
        public bool IsAbstract => (AccessFlags & (int)MethodAttributes.Abstract) != 0;

        /// <summary>Whether this is the static constructor</summary>
        public bool IsStaticConstructor => Name == "<clinit>" || Name == ".cctor";

        /// <summary>Whether this is instance constructor</summary>
        public bool IsConstructor => Name == "<init>" || Name == ".ctor";

        /// <summary>Whether this is a finalizer</summary>
        public bool IsFinalizer => Name == "finalize" && Signature == "()V";

        public MethodMetadata(ClassMetadata owningClass, string name, string signature, MethodInfo? reflectionMethod = null)
        {
            OwningClass = owningClass;
            Name = name;
            Signature = signature;
            ReflectionMethod = reflectionMethod;
        }

        public MethodMetadata(ClassMetadata owningClass, ConstantPool pool, string name, string signature, 
            int accessFlags, byte[]? code = null, int maxStack = 0, int maxLocals = 0)
        {
            OwningClass = owningClass;
            ConstantPool = pool;
            Name = name;
            Signature = signature;
            AccessFlags = accessFlags;
            Code = code;
            MaxStack = maxStack;
            MaxLocals = maxLocals;
            CodeLength = code?.Length ?? 0;
        }

        /// <summary>Compute effective method for virtual calls</summary>
        public MethodMetadata ComputeEffectiveMethod()
        {
            if (_effectiveMethodComputed)
                return EffectiveMethod ?? this;

            _effectiveMethodComputed = true;

            // If no subclass overrides this method, use it directly
            var subclasses = OwningClass.GetSubclasses();
            bool overridden = false;

            foreach (var subclass in subclasses)
            {
                var overridingMethod = subclass.FindMethod(Name, Signature);
                if (overridingMethod != null && overridingMethod != this)
                {
                    overridden = true;
                    break;
                }
            }

            if (!overridden)
                EffectiveMethod = this;

            return EffectiveMethod ?? this;
        }

        public override void UpdateDependencies()
        {
            if (!IsNeeded)
                return;

            // Determine the appropriate class status based on method status
            int classStatus = needStatus switch
            {
                NEEDED_VIRTUALLY => INSTANCE_NEEDED,  // Virtual calls need instances
                INSTANCE_NEEDED => INSTANCE_NEEDED,
                EXACT_INSTANCE_NEEDED => EXACT_INSTANCE_NEEDED,
                _ => NEEDED
            };

            // Mark owning class as needed with appropriate status
            OwningClass.MarkNeeded($"Method {Name}{Signature} is needed", classStatus);

            // If this is a virtual method, mark all overrides in subclasses as needed
            if (IsVirtual && !IsAbstract)
            {
                MarkVirtualOverrides();
            }

            // Mark native dependencies as needed
            foreach (var dep in NativeDependencies)
            {
                dep.MarkNeeded($"Native dependency of {Name}{Signature}", classStatus);
            }
        }

        /// <summary>Mark virtual method overrides in all subclasses as needed</summary>
        private void MarkVirtualOverrides()
        {
            foreach (var subclass in OwningClass.GetSubclasses())
            {
                if (!subclass.IsNeeded)
                    continue;

                var overridingMethod = subclass.FindMethod(Name, Signature);
                if (overridingMethod != null && overridingMethod != this)
                {
                    overridingMethod.MarkNeeded(
                        $"Overrides {OwningClass.FullName}.{Name}{Signature}", 
                        needStatus);
                }
            }
        }

        protected override void OnMarkedNeeded()
        {
            // Mark owning class as needed when method is first marked needed
            int classStatus = needStatus == NEEDED_VIRTUALLY ? INSTANCE_NEEDED : NEEDED;
            OwningClass.MarkNeeded($"Method {Name} is needed", classStatus);
        }

        public override string ToString()
        {
            return $"{OwningClass.FullName}.{Name}{Signature}";
        }
    }
}