using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>stloc.0 through stloc.3 — store to local variable</summary>
public class Stloc_N(int index) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string value = support.Stack.Pop();
        support.Emit($"local_{index} = {value};");
    }
}