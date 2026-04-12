using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Ldc_I4_S : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        if (operand is int shortIntVal)
        {
            string targetReg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L #{shortIntVal},{targetReg}  ; Load short constant");
            support.Stack.Push(targetReg);
        }
    }
}