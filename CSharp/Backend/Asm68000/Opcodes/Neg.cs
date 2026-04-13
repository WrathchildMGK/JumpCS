using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Neg : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string value = support.Stack.Pop();
        string resultReg = support.Stack.AllocateDataRegister();
        support.AsmWriter.WriteLine($"    CLR.L {resultReg}");
        support.AsmWriter.WriteLine($"    SUB.L {value},{resultReg}");
        support.Stack.ReleaseDataRegister(value);
        support.Stack.Push(resultReg);
    }
}