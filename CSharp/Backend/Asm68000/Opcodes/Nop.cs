using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Nop : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        support.AsmWriter.WriteLine("    ; NOP");
    }
}