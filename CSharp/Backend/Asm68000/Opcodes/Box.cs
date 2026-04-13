using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Box : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (Asm68000Support)support;
        s.AsmWriter.WriteLine($"    ; Box (passthrough — value stays in register)");
    }
}