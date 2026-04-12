using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Ldc_I4 : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        if (operand is int intVal)
        {
            string targetReg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L #{intVal},{targetReg}  ; Load constant");
            support.Stack.Push(targetReg);
        }
    }
}