using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Ldc_I4_1 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string targetReg = support.Stack.AllocateDataRegister();
        support.AsmWriter.WriteLine($"    MOVE.L #1,{targetReg}         ; Load 1");
        support.Stack.Push(targetReg);
    }
}