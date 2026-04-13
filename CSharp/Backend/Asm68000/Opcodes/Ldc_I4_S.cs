using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Ldc_I4_S : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is int shortIntVal)
        {
            string targetReg = support.Stack.AllocateDataRegister();
            int signExtended = (sbyte)(shortIntVal & 0xFF);
            support.AsmWriter.WriteLine($"    MOVE.L #{signExtended},{targetReg}  ; Load short constant");
            support.Stack.Push(targetReg);
        }
    }
}