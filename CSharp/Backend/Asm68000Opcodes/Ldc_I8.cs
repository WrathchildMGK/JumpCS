using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Ldc_I8 : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        if (operand is long longVal)
        {
            string targetReg1 = support.Stack.AllocateDataRegister();
            string targetReg2 = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L #{(int)(longVal >> 32)},{targetReg1}     ; Load high word");
            support.AsmWriter.WriteLine($"    MOVE.L #{(int)(longVal & 0xFFFFFFFF)},{targetReg2}    ; Load low word");
            support.Stack.Push(targetReg1);
            support.Stack.Push(targetReg2);
        }
    }
}