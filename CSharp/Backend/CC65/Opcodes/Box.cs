using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>box — passthrough for value types (no heap boxing on 6502)</summary>
public class Box : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        ((CC65Support)support).Emit("/* box — passthrough (no heap allocation) */");
    }
}