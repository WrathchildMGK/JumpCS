namespace JumpCS.Core
{
    /// <summary>Represents a generic method definition</summary>
    public class GenericMethod
    {
        public string Name { get; set; }
        public int GenericParameterCount { get; set; }

        public GenericMethod(string name, int paramCount = 0)
        {
            Name = name;
            GenericParameterCount = paramCount;
        }
    }
}