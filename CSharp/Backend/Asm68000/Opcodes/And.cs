using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class And : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string right = support.Stack.Pop();
        string left = support.Stack.Pop();
        string resultReg = support.Stack.AllocateDataRegister();
        support.AsmWriter.WriteLine($"    MOVE.L {left},{resultReg}");
        support.AsmWriter.WriteLine($"    AND.L {right},{resultReg}");
        support.Stack.ReleaseDataRegister(left);
        support.Stack.ReleaseDataRegister(right);
        support.Stack.Push(resultReg);
    }
}