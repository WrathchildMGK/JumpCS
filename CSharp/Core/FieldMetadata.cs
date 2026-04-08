using System.Reflection;

namespace JumpCS.Core
{
    /// <summary>Metadata and state for a class field</summary>
    public class FieldMetadata : JavaElement
    {
        public ClassMetadata OwningClass { get; }
        public string Name { get; }
        public string Signature { get; }
        public FieldInfo? ReflectionField { get; }
        public ConstantPool? ConstantPool { get; }

        public int AccessFlags { get; set; }
        public AttributeTable? Attributes { get; set; }

        /// <summary>Global index of this needed static field</summary>
        public int FieldIndex { get; set; } = -1;

        /// <summary>Offset of this field in instance layout</summary>
        public int Offset { get; set; }

        /// <summary>Size of this field in bytes</summary>
        public int Size { get; private set; }

        /// <summary>Whether this field is static</summary>
        public bool IsStatic => (AccessFlags & (int)FieldAttributes.Static) != 0;

        /// <summary>Whether this field is private</summary>
        public bool IsPrivate => (AccessFlags & (int)FieldAttributes.Private) != 0;

        public FieldMetadata(ClassMetadata owningClass, string name, string signature, FieldInfo? reflectionField = null)
        {
            OwningClass = owningClass;
            Name = name;
            Signature = signature;
            ReflectionField = reflectionField;
            Size = ComputeSize(signature);
        }

        public FieldMetadata(ClassMetadata owningClass, ConstantPool pool, string name, string signature, int accessFlags)
        {
            OwningClass = owningClass;
            ConstantPool = pool;
            Name = name;
            Signature = signature;
            AccessFlags = accessFlags;
            Size = ComputeSize(signature);
        }

        /// <summary>Compute byte size of this field based on signature</summary>
        private int ComputeSize(string signature)
        {
            return signature switch
            {
                "Z" or "B" or "C" => 1,  // boolean, byte, char
                "S" => 2,                 // short
                "I" or "F" => 4,          // int, float
                "J" or "D" => 8,          // long, double
                _ when signature.StartsWith("L") || signature.StartsWith("[") => 4,  // reference type
                _ => 4
            };
        }

        /// <summary>Check if this field's type is a reference type</summary>
        private bool IsReferenceType()
        {
            return Signature.StartsWith("L") || Signature.StartsWith("[");
        }

        /// <summary>Get the class name from a field signature (for reference types)</summary>
        private string? GetReferencedClassName()
        {
            if (Signature.StartsWith("L"))
            {
                // Format: Ljava/lang/String; -> java.lang.String
                var className = Signature[1..^1].Replace("/", ".");
                return className;
            }
            else if (Signature.StartsWith("["))
            {
                // Array type - extract element type
                if (Signature.Length > 1 && Signature[1] == 'L')
                {
                    var className = Signature[2..^1].Replace("/", ".");
                    return className;
                }
            }
            return null;
        }

        public override void UpdateDependencies()
        {
            if (!IsNeeded)
                return;

            // Determine the appropriate class status based on field usage
            int classStatus = needStatus switch
            {
                INSTANCE_NEEDED => INSTANCE_NEEDED,
                EXACT_INSTANCE_NEEDED => EXACT_INSTANCE_NEEDED,
                _ => NEEDED
            };

            // Mark owning class as needed
            OwningClass.MarkNeeded($"Field {Name} is needed", classStatus);

            // For static fields, ensure the class's static initializer is marked if needed
            if (IsStatic)
            {
                var staticCtor = OwningClass.FindMethod("<clinit>") ?? OwningClass.FindMethod(".cctor");
                if (staticCtor != null)
                {
                    staticCtor.MarkNeeded($"Static field {Name} requires static initialization", NEEDED);
                }
            }

            // Mark referenced class types as needed (for reference and array fields)
            if (IsReferenceType())
            {
                var referencedClass = GetReferencedClassName();
                if (!string.IsNullOrEmpty(referencedClass))
                {
                    var refClassMetadata = ClassMetadata.ForName(referencedClass);
                    if (refClassMetadata != null)
                    {
                        refClassMetadata.MarkNeeded($"Referenced by field {OwningClass.FullName}.{Name}", NEEDED);
                    }
                }
            }
        }

        protected override void OnMarkedNeeded()
        {
            // Mark owning class as needed when field is first marked needed
            int classStatus = needStatus == INSTANCE_NEEDED ? INSTANCE_NEEDED : NEEDED;
            OwningClass.MarkNeeded($"Field {Name} is needed", classStatus);
        }

        public override string ToString()
        {
            return $"{OwningClass.FullName}.{Name}:{Signature}";
        }
    }
}