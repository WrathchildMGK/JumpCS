using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Neg : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        string value = support.Stack.Pop();
        string resultReg = support.Stack.AllocateDataRegister();
        support.AsmWriter.WriteLine($"    CLR.L {resultReg}");
        support.AsmWriter.WriteLine($"    SUB.L {value},{resultReg}");
        support.Stack.ReleaseDataRegister(value);
        support.Stack.Push(resultReg);
    }
}