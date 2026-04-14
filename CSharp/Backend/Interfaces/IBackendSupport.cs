using JumpCS.Backend.SystemTypes;
using JumpCS.Core;
using System.Reflection;

namespace JumpCS.Backend.Interfaces
{
    public interface IBackendSupport
    {
        StreamWriter AsmWriter { get; }
        ISystemDecimalHandler DecimalHandler { get; }
        Dictionary<int, double> DoubleConstants { get; }
        ISystemDoubleHandler DoubleHandler { get; }
        HashSet<int> DoubleLocals { get; }
        Dictionary<int, float> FloatConstants { get; }
        ISystemFloatHandler FloatHandler { get; }
        ISystemIntegerHandler IntegerHandler { get; }
        MsilIterator Iterator { get; }
        IBackendLabelMapper Labels { get; }
        ISystemMathHandler MathHandler { get; }
        MethodMetadata Method { get; }
        IBackendStackSimulator Stack { get; }
        ISystemObjectHandler ObjectHandler { get; }

        MethodMetadata? ResolveMethodToken(ClassMetadata callingClass, int methodToken);
        MethodBase? TryResolveFrameworkMethod(ClassMetadata callingClass, int methodToken);

        void Emit(string line);
        void EmitComment(string comment);
        void EmitLabel(string label);
        void EmitBlank();
        string EmitAssign(string expr, bool isWide = false);
        void EmitReassign(string varName, string expr);
    }
}