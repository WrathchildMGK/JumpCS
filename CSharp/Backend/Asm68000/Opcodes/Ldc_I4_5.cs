using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Ldc_I4_5 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string targetReg = support.Stack.AllocateDataRegister();
        support.AsmWriter.WriteLine($"    MOVE.L #5,{targetReg}         ; Load 5");
        support.Stack.Push(targetReg);
    }
}