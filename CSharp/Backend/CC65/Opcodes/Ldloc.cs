using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldloc — push local variable by index operand</summary>
public class Ldloc : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is int idx) support.Stack.Push($"local_{idx}");
        else if (operand is ushort uidx) support.Stack.Push($"local_{uidx}");
    }
}