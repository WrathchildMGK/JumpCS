using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Xor : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        string right = support.Stack.Pop();
        string left = support.Stack.Pop();
        string resultReg = support.Stack.AllocateDataRegister();
        support.AsmWriter.WriteLine($"    MOVE.L {left},{resultReg}");
        support.AsmWriter.WriteLine($"    EOR.L {right},{resultReg}");
        support.Stack.ReleaseDataRegister(left);
        support.Stack.ReleaseDataRegister(right);
        support.Stack.Push(resultReg);
    }
}