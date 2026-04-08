namespace JumpCS.Core
{
    /// <summary>Container for class/method/field attributes from metadata</summary>
    public class AttributeTable
    {
        private Dictionary<string, AttributeInfo> _attributes = new();

        public AttributeTable()
        {
        }

        public void AddAttribute(string name, AttributeInfo info)
        {
            _attributes[name] = info;
        }

        public AttributeInfo? GetAttribute(string name)
        {
            _attributes.TryGetValue(name, out var attr);
            return attr;
        }

        public bool HasAttribute(string name)
        {
            return _attributes.ContainsKey(name);
        }

        public IEnumerable<AttributeInfo> GetAllAttributes()
        {
            return _attributes.Values;
        }
    }

    /// <summary>Base class for attribute information</summary>
    public class AttributeInfo
    {
        public string Name { get; set; }
        public byte[]? Data { get; set; }

        public AttributeInfo(string name, byte[]? data = null)
        {
            Name = name;
            Data = data;
        }
    }

    /// <summary>Code attribute containing method bytecode</summary>
    public class CodeAttribute : AttributeInfo
    {
        public int MaxStack { get; set; }
        public int MaxLocals { get; set; }
        public byte[]? Code { get; set; }

        public CodeAttribute(int maxStack, int maxLocals, byte[] code)
            : base("Code", code)
        {
            MaxStack = maxStack;
            MaxLocals = maxLocals;
            Code = code;
        }
    }

    /// <summary>Exceptions attribute</summary>
    public class ExceptionsAttribute : AttributeInfo
    {
        public List<string> ExceptionClassNames { get; } = new();

        public ExceptionsAttribute(List<string> exceptions)
            : base("Exceptions")
        {
            ExceptionClassNames = exceptions;
        }
    }
}