using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Ldc_I8 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
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