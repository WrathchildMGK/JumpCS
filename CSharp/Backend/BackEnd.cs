using JumpCS.Core;

namespace JumpCS.Backend
{
    /// <summary>Abstract base class for assembly code generators</summary>
    public abstract class BackEnd
    {
        protected string OutputBaseName { get; }
        protected List<string> GeneratedFiles { get; } = new();

        public BackEnd(string outputBaseName)
        {
            OutputBaseName = outputBaseName;
        }

        /// <summary>Update method - resolve dependencies, calculate code sizes</summary>
        public abstract void UpdateAll();

        /// <summary>Generate target output (assembly code, machine code, etc.)</summary>
        public abstract void Generate();

        /// <summary>Report generation statistics</summary>
        public virtual void Report()
        {
            Console.WriteLine($"Backend: {GetType().Name}");
            Console.WriteLine($"Output files: {string.Join(", ", GeneratedFiles)}");
        }

        /// <summary>Insert native method implementations for a class</summary>
        public virtual void InsertNatives(ClassMetadata cls)
        {
            // Override in subclasses to provide native implementations
        }

        protected void AddGeneratedFile(string path)
        {
            GeneratedFiles.Add(path);
        }
    }
}