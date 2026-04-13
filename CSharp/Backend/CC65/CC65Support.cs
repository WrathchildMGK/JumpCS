using JumpCS.Backend.CC65.SystemTypes;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;
using System.Reflection;

namespace JumpCS.Backend.CC65;

/// <summary>Shared context for CC65 opcode translation</summary>
public class CC65Support : IBackendSupport
{
    private readonly MsilIterator _iterator;
    private readonly MethodMetadata _method;
    private readonly StreamWriter _writer;
    private readonly CC65MethodBank _methodBank;
    private readonly CC65LabelMapper _labels;
    private readonly IBackendStackSimulator _stack;
    private readonly ISystemObjectHandler _objectHandler;
    private readonly Func<ClassMetadata, int, MethodMetadata?> _resolveMethodToken;
    private readonly Func<ClassMetadata, int, MethodBase?> _tryResolveFrameworkMethod;

    private int _labelCounter = 0;

    public CC65Support(
        MsilIterator iterator,
        MethodMetadata method,
        CC65StackSimulator stack,
        StreamWriter writer,
        CC65MethodBank methodBank,
        Func<ClassMetadata, int, MethodMetadata?> resolveMethodToken,
        Func<ClassMetadata, int, MethodBase?> tryResolveFrameworkMethod)
    {
        _iterator = iterator;
        _method = method;
        _stack = stack;
        _writer = writer;
        _methodBank = methodBank;
        _resolveMethodToken = resolveMethodToken;
        _tryResolveFrameworkMethod = tryResolveFrameworkMethod;

        _objectHandler = new SystemObjectHandler(
            writer,
            (stack) => stack.AllocateDataRegister(),
            () => GetUniqueLabel()
        );
    }

    // --- Public accessors (consistent naming with Asm68000Support) ---

    public MsilIterator Iterator => _iterator;
    public MethodMetadata Method => _method;
    public StreamWriter AsmWriter => _writer;
    public CC65MethodBank MethodBank => _methodBank;
    public IBackendStackSimulator Stack => _stack;
    public IBackendLabelMapper Labels { get { return _labels; } }

    public ISystemDecimalHandler DecimalHandler => throw new NotImplementedException();

    public Dictionary<int, double> DoubleConstants => throw new NotImplementedException();

    public ISystemDoubleHandler DoubleHandler => throw new NotImplementedException();

    public HashSet<int> DoubleLocals => throw new NotImplementedException();

    public Dictionary<int, float> FloatConstants => throw new NotImplementedException();

    public ISystemFloatHandler FloatHandler => throw new NotImplementedException();

    public ISystemIntegerHandler IntegerHandler => throw new NotImplementedException();

    public ISystemMathHandler MathHandler => throw new NotImplementedException();

    public ISystemObjectHandler ObjectHandler => _objectHandler;

    // --- Method resolution ---

    public MethodMetadata? ResolveMethodToken(ClassMetadata callingClass, int methodToken)
        => _resolveMethodToken(callingClass, methodToken);

    public MethodBase? TryResolveFrameworkMethod(ClassMetadata callingClass, int methodToken)
        => _tryResolveFrameworkMethod(callingClass, methodToken);

    // --- Label generation ---

    public string GetUniqueLabel() => $"L_{_labelCounter++}";

    // --- Code emission helpers ---

    public void Emit(string line) => _writer.WriteLine($"    {line}");

    public void EmitComment(string comment) => Emit($"/* {comment} */");

    public void EmitLabel(string label) => _writer.WriteLine($"  {label}:");

    public void EmitBlank() => _writer.WriteLine();

    /// <summary>Emit: type temp = expr; and push temp onto eval stack</summary>
    public string EmitAssign(string expr, bool isWide = false)
    {
        string temp = _stack.AllocateDataRegister();
        Emit($"{CC65TypeMapper.StackType} {temp} = ({CC65TypeMapper.StackType})({expr});");
        _stack.Push(temp, isWide);
        return temp;
    }

    /// <summary>Emit: temp = expr; reusing an existing variable, push onto stack</summary>
    public void EmitReassign(string varName, string expr)
    {
        Emit($"{varName} = ({CC65TypeMapper.StackType})({expr});");
    }
}