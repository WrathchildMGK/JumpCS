using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>br, br.s, leave, leave.s — unconditional branch</summary>
public class Br : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        int target = s.Iterator.NextIndex + (int)(operand ?? 0);
        s.Emit($"goto IL_{target:X4};");
        s.Stack.Clear();
    }
}