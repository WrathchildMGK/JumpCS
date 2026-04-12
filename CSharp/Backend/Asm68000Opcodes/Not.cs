using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Not : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        string value = support.Stack.Pop();
        string resultReg = support.Stack.AllocateDataRegister();
        support.AsmWriter.WriteLine($"    MOVE.L {value},{resultReg}");
        support.AsmWriter.WriteLine($"    NOT.L {resultReg}");
        support.Stack.ReleaseDataRegister(value);
        support.Stack.Push(resultReg);
    }
}