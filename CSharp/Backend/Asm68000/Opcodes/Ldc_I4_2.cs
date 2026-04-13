using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Ldc_I4_2 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string targetReg = support.Stack.AllocateDataRegister();
        support.AsmWriter.WriteLine($"    MOVE.L #2,{targetReg}         ; Load 2");
        support.Stack.Push(targetReg);
    }
}