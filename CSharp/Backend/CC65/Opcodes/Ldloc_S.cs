using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldloc.s — push local variable by index operand</summary>
public class Ldloc_S : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is int idx)
            support.Stack.Push($"local_{idx}");
    }
}