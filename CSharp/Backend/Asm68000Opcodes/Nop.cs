using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Nop : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        support.AsmWriter.WriteLine("    ; NOP");
    }
}