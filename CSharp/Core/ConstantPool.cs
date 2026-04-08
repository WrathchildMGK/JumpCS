using System.Reflection.Metadata;

namespace JumpCS.Core
{
    /// <summary>
    /// Represents the metadata constant pool for a class.
    /// For MSIL, this is mapped to metadata tokens and signatures.
    /// </summary>
    public class ConstantPool
    {
        private Dictionary<int, object?> _constants = new();
        private MetadataReader? _metadataReader;
        private Dictionary<string, int> _stringCache = new();

        public ConstantPool(MetadataReader? reader = null)
        {
            _metadataReader = reader;
        }

        /// <summary>Get the type signature of a constant at the given index</summary>
        public string? GetSignature(int index)
        {
            if (!_constants.TryGetValue(index, out var value))
                return null;

            return value switch
            {
                string s => "Ljava/lang/String;",
                int => "I",
                float => "F",
                long => "J",
                double => "D",
                _ => null
            };
        }

        /// <summary>Get integer constant value</summary>
        public int GetInteger(int index)
        {
            if (_constants.TryGetValue(index, out var value) && value is int i)
                return i;
            throw new InvalidOperationException($"No integer constant at index {index}");
        }

        /// <summary>Get float constant value</summary>
        public float GetFloat(int index)
        {
            if (_constants.TryGetValue(index, out var value) && value is float f)
                return f;
            throw new InvalidOperationException($"No float constant at index {index}");
        }

        /// <summary>Get long constant value</summary>
        public long GetLong(int index)
        {
            if (_constants.TryGetValue(index, out var value) && value is long l)
                return l;
            throw new InvalidOperationException($"No long constant at index {index}");
        }

        /// <summary>Get double constant value</summary>
        public double GetDouble(int index)
        {
            if (_constants.TryGetValue(index, out var value) && value is double d)
                return d;
            throw new InvalidOperationException($"No double constant at index {index}");
        }

        /// <summary>Get string constant</summary>
        public string GetString(int index)
        {
            if (_constants.TryGetValue(index, out var value) && value is string s)
                return s;
            throw new InvalidOperationException($"No string constant at index {index}");
        }

        /// <summary>Check if entry is a String</summary>
        public bool IsString(int index)
        {
            return _constants.TryGetValue(index, out var value) && value is string;
        }

        /// <summary>Add constant to pool</summary>
        public void AddConstant(int index, object value)
        {
            _constants[index] = value;
        }

        /// <summary>Find the constant pool index of a string</summary>
        public int FindString(string str)
        {
            if (_stringCache.TryGetValue(str, out var index))
                return index;
            return -1;
        }

        /// <summary>Get class name from class reference</summary>
        public string? GetClassName(int index)
        {
            return _constants.TryGetValue(index, out var value) ? value?.ToString() : null;
        }
    }
}