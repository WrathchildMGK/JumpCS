using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Mul : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        if (support.Stack.StackDepth >= 4)
        {
            support.DoubleHandler.HandleMultiply(support.Stack);
        }
        else
        {
            string right = support.Stack.Pop();
            string left = support.Stack.Pop();
            string resultReg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L {left},{resultReg}");
            support.AsmWriter.WriteLine($"    MULS.L {right},{resultReg}");
            support.Stack.ReleaseDataRegister(left);
            support.Stack.ReleaseDataRegister(right);
            support.Stack.Push(resultReg);
        }
    }
}