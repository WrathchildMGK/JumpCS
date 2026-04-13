using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Div : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (support.Stack.StackDepth >= 4)
        {
            support.DoubleHandler.HandleDivision(support.Stack);
        }
        else
        {
            string right = support.Stack.Pop();
            string left = support.Stack.Pop();
            string resultReg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L {left},{resultReg}");
            support.AsmWriter.WriteLine($"    DIVS.L {right},{resultReg}");
            support.Stack.ReleaseDataRegister(left);
            support.Stack.ReleaseDataRegister(right);
            support.Stack.Push(resultReg);
        }
    }
}