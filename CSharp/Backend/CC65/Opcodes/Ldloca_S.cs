using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldloca.s — load local variable address</summary>
public class Ldloca_S : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is not byte index) return;
        support.Stack.Push($"&local_{index}");
    }
}