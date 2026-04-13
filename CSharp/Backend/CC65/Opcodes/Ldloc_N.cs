using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldloc.0 through ldloc.3 — push local variable</summary>
public class Ldloc_N(int index) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        ((CC65Support)support).Stack.Push($"local_{index}");
    }
}