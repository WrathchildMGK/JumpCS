using System.Reflection;

namespace JumpCS.Core
{
    /// <summary>Metadata and state for a class</summary>
    public class ClassMetadata : JavaElement
    {
        private static List<ClassMetadata> _allClasses = new();
        private static Dictionary<string, ClassMetadata> _classCache = new();

        /// <summary>Class info type: normal class</summary>
        public const int CLASSINFO_OBJECT = 0x0000;

        /// <summary>Class info type: scalar array</summary>
        public const int CLASSINFO_ARRAY = 0x0001;

        /// <summary>Class info type: object array</summary>
        public const int CLASSINFO_ARRAYOFOBJECTS = 0x0002;

        public string FullName { get; }
        public Type? ReflectionType { get; }
        public ConstantPool? ConstantPool { get; }

        public int AccessFlags { get; set; }
        public int ClassInfoType { get; set; } = CLASSINFO_OBJECT;

        /// <summary>Index of this class in class structures</summary>
        public int ClassIndex { get; set; } = -1;

        /// <summary>Index for instanceof checks</summary>
        public int InstanceofClassIndex { get; set; } = -1;

        /// <summary>Index for clinit checks</summary>
        public int ClinitClassIndex { get; set; } = -1;

        /// <summary>Whether this class has early initialization</summary>
        public bool HasEarlyInit { get; set; }

        /// <summary>Whether properties say this class has instances</summary>
        public bool PropertySaysHasInstance { get; set; }

        /// <summary>Data size of instance fields</summary>
        public int DataSize { get; set; } = -1;

        /// <summary>Size of virtual function table</summary>
        public int FullVtableSize { get; set; } = -1;

        public ClassMetadata? BaseClass { get; set; }
        public List<ClassMetadata> Interfaces { get; } = new();
        public List<FieldMetadata> Fields { get; } = new();
        public List<MethodMetadata> Methods { get; } = new();
        public List<ClassMetadata> Subclasses { get; } = new();

        public AttributeTable? Attributes { get; set; }

        /// <summary>Virtual function table</summary>
        public List<MethodMetadata> Vtable { get; } = new();

        /// <summary>Instanceof compatibility array</summary>
        public bool[]? Itable { get; set; }

        private int _magicNumber;
        private int _minorVersion;
        private int _majorVersion;

        private ClassMetadata(string fullName, Type? type = null)
        {
            FullName = fullName;
            ReflectionType = type;
            _classCache[fullName] = this;
            _allClasses.Add(this);
        }

        /// <summary>Create from reflection type</summary>
        public static ClassMetadata FromType(Type type)
        {
            return FromType(type.FullName!, type);
        }

        /// <summary>Create from reflection type with name override</summary>
        public static ClassMetadata FromType(string fullName, Type type)
        {
            if (_classCache.TryGetValue(fullName, out var existing))
                return existing;

            var metadata = new ClassMetadata(fullName, type);
            metadata.LoadFromReflection(type);
            return metadata;
        }

        /// <summary>Create synthetic class (not from reflection)</summary>
        public static ClassMetadata CreateSynthetic(string fullName)
        {
            if (_classCache.TryGetValue(fullName, out var existing))
                return existing;

            return new ClassMetadata(fullName);
        }

        /// <summary>Load metadata from reflection</summary>
        private void LoadFromReflection(Type type)
        {
            // Load base class
            if (type.BaseType != null && type.BaseType != typeof(object))
            {
                BaseClass = FromType(type.BaseType);
            }

            // Load interfaces
            foreach (var iface in type.GetInterfaces())
            {
                Interfaces.Add(FromType(iface));
            }

            // Load fields
            foreach (var field in type.GetFields(
                BindingFlags.Public | BindingFlags.NonPublic |
                BindingFlags.Static | BindingFlags.Instance))
            {
                var fieldType = field.FieldType.IsArray ?
                    $"[{GetTypeSignature(field.FieldType.GetElementType()!)}" :
                    GetTypeSignature(field.FieldType);

                var fieldMetadata = new FieldMetadata(this, field.Name, fieldType, field)
                {
                    AccessFlags = (int)field.Attributes
                };
                Fields.Add(fieldMetadata);
            }

            // Load methods
            foreach (var method in type.GetMethods(
                BindingFlags.Public | BindingFlags.NonPublic |
                BindingFlags.Static | BindingFlags.Instance))
            {
                if (method.IsSpecialName && !method.Name.StartsWith("<"))
                    continue;

                var signature = GetMethodSignature(method);
                var methodMetadata = new MethodMetadata(this, method.Name, signature, method)
                {
                    AccessFlags = (int)method.Attributes
                };
                
                // Extract IL bytecode from metadata
                ExtractMethodIL(method, methodMetadata);
                
                Methods.Add(methodMetadata);
            }

            // Remove finalizers from Object class for compatibility
            if (FullName == "System.Object")
            {
                Methods.RemoveAll(m => m.IsFinalizer);
            }
        }

        /// <summary>Extract IL bytecode from a MethodInfo using metadata reader</summary>
        private void ExtractMethodIL(MethodInfo method, MethodMetadata methodMetadata)
        {
            try
            {
                // Get the method body containing IL bytecode
                var methodBody = method.GetMethodBody();
                if (methodBody != null)
                {
                    methodMetadata.Code = methodBody.GetILAsByteArray();
                    methodMetadata.CodeLength = methodMetadata.Code?.Length ?? 0;
                    methodMetadata.MaxStack = methodBody.MaxStackSize;
                    methodMetadata.MaxLocals = methodBody.LocalVariables.Count;
                    
                    if (Program.CodeOptions?.Verbosity >= 1)
                    {
                        Console.WriteLine($"  Method {method.Name}: CodeLength={methodMetadata.CodeLength}, MaxStack={methodMetadata.MaxStack}, MaxLocals={methodMetadata.MaxLocals}");
                    }
                }
                else
                {
                    // Abstract, interface, or P/Invoke methods have no body
                    methodMetadata.Code = null;
                    methodMetadata.CodeLength = 0;
                    methodMetadata.MaxStack = 0;
                    methodMetadata.MaxLocals = 0;
                    
                    if (Program.CodeOptions?.Verbosity > 1)
                    {
                        Console.WriteLine($"  Method {method.Name}: No body (abstract/P/Invoke/interface)");
                    }
                }
            }
            catch (Exception ex)
            {
                // IL extraction may fail for some methods (e.g., P/Invoke, abstract)
                // This is expected and safe to ignore
                if (Program.CodeOptions?.Verbosity >= 1)
                {
                    Console.WriteLine($"Warning: Could not extract IL for {FullName}.{method.Name}: {ex.Message}");
                }
                
                // Set sensible defaults
                methodMetadata.Code = null;
                methodMetadata.CodeLength = 0;
                methodMetadata.MaxStack = 0;
                methodMetadata.MaxLocals = 0;
            }
        }

        /// <summary>Get JVM type signature for a type</summary>
        private string GetTypeSignature(Type type)
        {
            return type.Name switch
            {
                "Void" => "V",
                "Boolean" => "Z",
                "Byte" => "B",
                "Char" => "C",
                "Short" => "S",
                "Int32" => "I",
                "Int64" => "J",
                "Single" => "F",
                "Double" => "D",
                _ => $"L{type.FullName?.Replace(".", "/")};",
            };
        }

        /// <summary>Get JVM method signature</summary>
        private string GetMethodSignature(MethodInfo method)
        {
            var paramTypes = method.GetParameters()
                .Select(p => GetTypeSignature(p.ParameterType))
                .ToList();

            var returnType = GetTypeSignature(method.ReturnType);
            var paramList = string.Concat(paramTypes);
            return $"({paramList}){returnType}";
        }

        /// <summary>Find method by name and signature</summary>
        public MethodMetadata? FindMethod(string name, string? signature = null)
        {
            return Methods.FirstOrDefault(m =>
                m.Name == name &&
                (signature == null || m.Signature == signature));
        }

        /// <summary>Find field by name</summary>
        public FieldMetadata? FindField(string name)
        {
            return Fields.FirstOrDefault(f => f.Name == name);
        }

        /// <summary>Get all subclasses</summary>
        public IReadOnlyList<ClassMetadata> GetSubclasses()
        {
            return Subclasses.AsReadOnly();
        }

        /// <summary>Add subclass relationship</summary>
        public void AddSubclass(ClassMetadata subclass)
        {
            if (!Subclasses.Contains(subclass))
                Subclasses.Add(subclass);
        }

        /// <summary>Lookup class by name</summary>
        public static ClassMetadata? ForName(string name)
        {
            if (_classCache.TryGetValue(name, out var cached))
                return cached;

            // Try to load from assemblies
            try
            {
                var type = Type.GetType(name) ??
                          AppDomain.CurrentDomain.GetAssemblies()
                              .Select(a => a.GetType(name))
                              .FirstOrDefault(t => t != null);

                if (type != null)
                    return FromType(name, type);
            }
            catch { }

            return null;
        }

        /// <summary>Update all classes' dependencies</summary>
        public static void UpdateAll()
        {
            foreach (var cls in _allClasses)
            {
                cls.UpdateDependencies();
            }
        }

        /// <summary>Assign indices to all classes</summary>
        public static void AssignAllClassIndices()
        {
            var neededClasses = _allClasses.Where(c => c.IsNeeded).ToList();
            for (int i = 0; i < neededClasses.Count; i++)
            {
                neededClasses[i].ClassIndex = i;
            }
        }

        /// <summary>Layout fields in all classes</summary>
        public static void LayoutFieldsAll()
        {
            foreach (var cls in _allClasses)
            {
                cls.LayoutFields();
            }
        }

        /// <summary>Layout virtual tables in all classes</summary>
        public static void LayoutVtableAll()
        {
            foreach (var cls in _allClasses)
            {
                cls.LayoutVtable();
            }
        }

        /// <summary>Layout instance tables in all classes</summary>
        public static void LayoutItableAll()
        {
            foreach (var cls in _allClasses)
            {
                cls.LayoutITable();
            }
        }

        /// <summary>Report statistics for all classes</summary>
        public static void ReportAll()
        {
            Console.WriteLine("\n=== Class Report ===");
            foreach (var cls in _allClasses.Where(c => c.IsNeeded))
            {
                cls.Report();
            }
        }

        /// <summary>Layout this class's fields</summary>
        public void LayoutFields()
        {
            int offset = BaseClass?.DataSize ?? 0;

            foreach (var field in Fields.Where(f => !f.IsStatic))
            {
                field.Offset = offset;
                offset += field.Size;
            }

            DataSize = offset;
        }

        /// <summary>Layout virtual method table</summary>
        public void LayoutVtable()
        {
            Vtable.Clear();

            // Inherit from base class
            if (BaseClass != null)
            {
                Vtable.AddRange(BaseClass.Vtable);
            }

            // Add/override methods
            foreach (var method in Methods.Where(m => !m.IsStatic))
            {
                var index = Vtable.FindIndex(m => m.Name == method.Name && m.Signature == method.Signature);
                if (index >= 0)
                {
                    Vtable[index] = method;
                    method.VtableIndex = index;
                }
                else if (!method.IsAbstract && method.IsNeeded)
                {
                    method.VtableIndex = Vtable.Count;
                    Vtable.Add(method);
                }
            }

            FullVtableSize = Vtable.Count;
        }

        /// <summary>Layout instanceof compatibility table</summary>
        public void LayoutITable()
        {
            if (!IsNeeded)
                return;

            // Build instanceof compatibility array
            var instanceofClasses = _allClasses.Where(c =>
                (c.needStatus & NEEDED_INSTANCEOF) != 0).ToList();

            Itable = new bool[instanceofClasses.Count];

            for (int i = 0; i < instanceofClasses.Count; i++)
            {
                Itable[i] = IsAssignableTo(instanceofClasses[i]);
            }
        }

        /// <summary>Check if this class is assignable to another</summary>
        private bool IsAssignableTo(ClassMetadata other)
        {
            if (this == other)
                return true;

            if (BaseClass?.IsAssignableTo(other) ?? false)
                return true;

            return Interfaces.Any(i => i.IsAssignableTo(other));
        }

        /// <summary>Report statistics for this class</summary>
        public void Report()
        {
            Console.WriteLine($"Class: {FullName} (index={ClassIndex}, dataSize={DataSize})");
            Console.WriteLine($"  Fields: {Fields.Count}, Methods: {Methods.Count}");
        }

        /// <summary>Update dependencies when this class is marked as needed</summary>
        public override void UpdateDependencies()
        {
            if (!IsNeeded)
                return;

            // Mark all needed instance fields as needed
            foreach (var field in Fields.Where(f => f.IsNeeded && !f.IsStatic))
            {
                MarkNeeded($"Instance field {field.Name} is needed", NEEDED);
            }

            // Mark all needed methods as needed
            foreach (var method in Methods.Where(m => m.IsNeeded))
            {
                int methodStatus = needStatus == INSTANCE_NEEDED ? INSTANCE_NEEDED : NEEDED;
                method.MarkNeeded($"Method is needed in {FullName}", methodStatus);
            }

            // For virtual method calls, ensure all overrides in subclasses are marked
            if ((needStatus & NEEDED_VIRTUALLY) != 0)
            {
                foreach (var subclass in Subclasses.Where(s => s.IsNeeded))
                {
                    subclass.UpdateDependencies();
                }
            }

            // Mark static constructor as needed if any static fields/methods are used
            var staticCtor = FindMethod("<clinit>");
            if (staticCtor == null)
                staticCtor = FindMethod(".cctor");
            
            if (staticCtor != null && Methods.OfType<MethodMetadata>()
                .Where(m => m.IsStatic && m.IsNeeded).Any())
            {
                staticCtor.MarkNeeded($"Static constructor needed for {FullName}", NEEDED);
            }
        }

        protected override void OnMarkedNeeded()
        {
            // Mark base class as needed
            if (BaseClass != null)
            {
                BaseClass.MarkNeeded($"Base class of {FullName}", NEEDED);
            }

            // Mark interfaces as needed
            foreach (var iface in Interfaces)
            {
                iface.MarkNeeded($"Interface of {FullName}", NEEDED);
            }
        }

        /// <summary>Get all loaded classes</summary>
        public static IReadOnlyList<ClassMetadata> AllClasses => _allClasses.AsReadOnly();

        public override string ToString() => FullName;
    }
}