using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Ldc_I4_3 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string targetReg = support.Stack.AllocateDataRegister();
        support.AsmWriter.WriteLine($"    MOVE.L #3,{targetReg}         ; Load 3");
        support.Stack.Push(targetReg);
    }
}