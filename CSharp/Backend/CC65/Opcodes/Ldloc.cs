using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldloc — push local variable by index operand</summary>
public class Ldloc : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        if (operand is int idx) s.Stack.Push($"local_{idx}");
        else if (operand is ushort uidx) s.Stack.Push($"local_{uidx}");
    }
}