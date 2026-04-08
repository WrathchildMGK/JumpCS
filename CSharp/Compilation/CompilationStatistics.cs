using JumpCS.Core;

namespace JumpCS
{
    public class CompilationStatistics
    {
        private int classCount = 0;
        private int methodCount = 0;
        private int fieldCount = 0;

        public void AddClass(ClassMetadata cls)
        {
            classCount++;
            fieldCount += cls.Fields.Count;
        }

        public void AddMethod(MethodMetadata method)
        {
            methodCount++;
        }

        public void Report()
        {
            Console.WriteLine("\n=== Compilation Statistics ===");
            Console.WriteLine($"Classes:  {classCount}");
            Console.WriteLine($"Methods:  {methodCount}");
            Console.WriteLine($"Fields:   {fieldCount}");
            Console.WriteLine("==============================\n");
        }
    }
}