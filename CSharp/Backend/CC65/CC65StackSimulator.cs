using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65;

/// <summary>
/// Evaluation stack simulator for CC65 C code generation.
/// Tracks MSIL eval stack as C local variable names (s0, s1, s2...).
/// No register allocation — C handles that.
/// Implements IBackendStackSimulator for cross-backend compatibility.
/// </summary>
public class CC65StackSimulator : IBackendStackSimulator
{
    private readonly List<string> _stack = new();
    private readonly List<bool> _stackIsWide = new();
    private readonly int _maxLocals;
    private readonly int _maxStack;
    private int _tempCounter = 0;

    public CC65StackSimulator(int maxLocals, int maxStack)
    {
        _maxLocals = maxLocals;
        _maxStack = maxStack;
    }

    // --- IBackendStackSimulator properties ---

    public int StackDepth => _stack.Count;

    /// <summary>Maps to IsTopDoubleWord — for CC65 this tracks 32-bit wide values</summary>
    public bool IsTopDoubleWord => _stackIsWide.Count > 0 && _stackIsWide[^1];

    /// <summary>Not applicable to C code generation — locals are C variables, not frame offsets</summary>
    public int CurrentFrameOffset =>
        throw new NotSupportedException("CC65 backend uses C local variables, not frame pointer offsets.");

    // --- IBackendStackSimulator: register allocation → temp variable allocation ---

    /// <summary>Allocates a C temp variable name instead of a data register</summary>
    public string AllocateDataRegister() => $"s{_tempCounter++}";

    /// <summary>Returns next available temp variable name</summary>
    public string GetNextDataRegister()
    {
        // Peek at what the next temp name would be without consuming it
        return $"s{_tempCounter}";
    }

    /// <summary>No-op for CC65 — C manages variable lifetime automatically</summary>
    public void ReleaseDataRegister(string register)
    {
        // No-op: C local variables don't need explicit release
    }

    /// <summary>Not applicable to C code generation — no address registers on 6502 via C</summary>
    public string AllocateAddressRegister() =>
        throw new NotSupportedException(
            "CC65 backend does not use address registers. Use C pointer variables instead.");

    /// <summary>Not applicable to C code generation — no address registers on 6502 via C</summary>
    public void ReleaseAddressRegister(string register) =>
        throw new NotSupportedException(
            "CC65 backend does not use address registers. Use C pointer variables instead.");

    // --- IBackendStackSimulator: stack operations ---

    /// <summary>Push a C expression onto the eval stack</summary>
    public void Push(string expr, bool isDoubleWord = false)
    {
        if (_stack.Count >= _maxStack)
        {
            if (Program.CodeOptions?.Verbosity >= 1)
            {
                Console.WriteLine($"[CC65] WARNING: Eval stack overflow at depth {_stack.Count}, max {_maxStack}");
            }
        }

        _stack.Add(expr);
        _stackIsWide.Add(isDoubleWord);

        if (Program.CodeOptions?.Verbosity >= 2)
        {
            Console.WriteLine($"[CC65 PUSH] {expr}{(isDoubleWord ? " (wide)" : "")} | depth: {_stack.Count}");
        }
    }

    /// <summary>Pop a C expression from the eval stack</summary>
    public string Pop()
    {
        if (_stack.Count == 0)
            throw new InvalidOperationException("CC65 evaluation stack underflow");

        string expr = _stack[^1];
        _stack.RemoveAt(_stack.Count - 1);
        _stackIsWide.RemoveAt(_stackIsWide.Count - 1);

        if (Program.CodeOptions?.Verbosity >= 2)
        {
            Console.WriteLine($"[CC65 POP] {expr} | depth: {_stack.Count}");
        }

        return expr;
    }

    /// <summary>Peek at top of stack without popping</summary>
    public string Peek()
    {
        if (_stack.Count == 0)
            throw new InvalidOperationException("CC65 evaluation stack is empty");
        return _stack[^1];
    }

    /// <summary>Clear the stack (e.g., after unconditional branch)</summary>
    public void Clear()
    {
        _stack.Clear();
        _stackIsWide.Clear();

        if (Program.CodeOptions?.Verbosity >= 2)
        {
            Console.WriteLine("[CC65] Stack cleared");
        }
    }
}