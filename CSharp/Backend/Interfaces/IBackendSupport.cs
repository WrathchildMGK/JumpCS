using JumpCS.Backend.Asm68000;
using JumpCS.Backend.Asm68000.SystemTypes;
using JumpCS.Core;
using System.Reflection;

namespace JumpCS.Backend.Interfaces
{
    public interface IBackendSupport
    {
        StreamWriter AsmWriter { get; }
        SystemDecimalHandler DecimalHandler { get; }
        Dictionary<int, double> DoubleConstants { get; }
        SystemDoubleHandler DoubleHandler { get; }
        HashSet<int> DoubleLocals { get; }
        Dictionary<int, float> FloatConstants { get; }
        SystemFloatHandler FloatHandler { get; }
        SystemIntegerHandler IntegerHandler { get; }
        MsilIterator Iterator { get; }
        IBackendLabelMapper Labels { get; }
        SystemMathHandler MathHandler { get; }
        MethodMetadata Method { get; }
        IBackendStackSimulator Stack { get; }

        MethodMetadata? ResolveMethodToken(ClassMetadata callingClass, int methodToken);
        MethodBase? TryResolveFrameworkMethod(ClassMetadata callingClass, int methodToken);
    }
}