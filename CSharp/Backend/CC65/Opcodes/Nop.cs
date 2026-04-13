using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>nop — no operation</summary>
public class Nop : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support) { }
}