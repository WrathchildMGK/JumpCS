using JumpCS.Backend.Base;
using JumpCS.Backend.CC65.SystemTypes;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;
using System.Reflection;

namespace JumpCS.Backend.CC65;

/// <summary>Shared context for CC65 opcode translation</summary>
public class CC65Support : SupportBase
{
    private readonly CC65MethodBank _methodBank;
    private readonly Dictionary<int, float> _floatConstants;
    private readonly Dictionary<int, double> _doubleConstants;
    private readonly HashSet<int> _doubleLocals = new();

    private readonly SystemDecimalHandler _decimalHandler;
    private readonly SystemMathHandler _mathHandler;
    private readonly SystemDoubleHandler _doubleHandler;
    private readonly SystemFloatHandler _floatHandler;
    private readonly SystemIntegerHandler _integerHandler;
    private readonly SystemObjectHandler _objectHandler;
    private readonly SystemConsoleHandler _consoleHandler;

    public CC65Support(
        MsilIterator iterator,
        MethodMetadata method,
        CC65StackSimulator stack,
        CC65LabelMapper labels,
        StreamWriter writer,
        CC65MethodBank methodBank,
        Dictionary<int, float> floatConstants,
        Dictionary<int, double> doubleConstants,
        Func<ClassMetadata, int, MethodMetadata?> resolveMethodToken,
        Func<ClassMetadata, int, MethodBase?> tryResolveFrameworkMethod) :
        base(iterator, method, stack, labels, writer, resolveMethodToken, tryResolveFrameworkMethod)
    {
        _methodBank = methodBank;
        _floatConstants = floatConstants;
        _doubleConstants = doubleConstants;

        _mathHandler = new SystemMathHandler(
            writer,
            (stack) => stack.AllocateDataRegister(),
            () => labels.GetUniqueLabel()
        );

        _decimalHandler = new SystemDecimalHandler(
            writer,
            (stack) => stack.AllocateDataRegister(),
            () => labels.GetUniqueLabel()
        );

        _doubleHandler = new SystemDoubleHandler(
            writer,
            (stack) => stack.AllocateDataRegister(),
            () => labels.GetUniqueLabel()
        );

        _floatHandler = new SystemFloatHandler(
            writer,
            (stack) => stack.AllocateDataRegister(),
            () => labels.GetUniqueLabel()
        );

        _integerHandler = new SystemIntegerHandler(
            writer,
            (stack) => stack.AllocateDataRegister(),
            () => labels.GetUniqueLabel()
        );

        _objectHandler = new SystemObjectHandler(
            writer,
            (stack) => stack.AllocateDataRegister(),
            () => GetUniqueLabel()
        );

        _consoleHandler = new SystemConsoleHandler(
            writer,
            (stack) => stack.AllocateDataRegister()
        );

        _doubleLocals.Clear();
    }

    // --- Public accessors (consistent naming with Asm68000Support) ---

    public CC65MethodBank MethodBank => _methodBank;

    public override Dictionary<int, float> FloatConstants => _floatConstants;
    public override Dictionary<int, double> DoubleConstants => _doubleConstants;
    public override HashSet<int> DoubleLocals => _doubleLocals;

    public override ISystemDecimalHandler DecimalHandler => _decimalHandler;
    public override ISystemMathHandler MathHandler => _mathHandler;
    public override ISystemDoubleHandler DoubleHandler => _doubleHandler;
    public override ISystemFloatHandler FloatHandler => _floatHandler;
    public override ISystemIntegerHandler IntegerHandler => _integerHandler;
    public override ISystemObjectHandler ObjectHandler => _objectHandler;
    public override ISystemConsoleHandler ConsoleHandler => _consoleHandler;

    // --- Label generation ---

    public string GetUniqueLabel() => Labels.GetUniqueLabel();

    // --- Code emission helpers ---

    public override void Emit(string line) => AsmWriter.WriteLine($"    {line}");

    public override void EmitComment(string comment) => Emit($"/* {comment} */");

    public override void EmitLabel(string label) => AsmWriter.WriteLine($"  {label}:");

    public override void EmitBlank() => AsmWriter.WriteLine();

    /// <summary>Emit: type temp = expr; and push temp onto eval stack</summary>
    public override string EmitAssign(string expr, bool isWide = false)
    {
        string temp = Stack.AllocateDataRegister();
        Emit($"{CC65TypeMapper.StackType} {temp} = ({CC65TypeMapper.StackType})({expr});");
        Stack.Push(temp, isWide);
        return temp;
    }

    /// <summary>Emit: temp = expr; reusing an existing variable, push onto stack</summary>
    public override void EmitReassign(string varName, string expr)
    {
        Emit($"{varName} = ({CC65TypeMapper.StackType})({expr});");
    }
}