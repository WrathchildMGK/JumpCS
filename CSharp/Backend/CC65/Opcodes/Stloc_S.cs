using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>stloc.s — store to local variable by index operand</summary>
public class Stloc_S : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        if (operand is int idx)
        {
            string value = s.Stack.Pop();
            s.Emit($"local_{idx} = {value};");
        }
    }
}