using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
namespace JumpCS.Backend.Asm68000.Opcodes;
// BUILD ERROR: needs _doubleHandler — will be resolved later
public class Add : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (support.Stack.StackDepth >= 4)
        {
            support.DoubleHandler.HandleAddition(support.Stack);
        }
        else
        {
            string right = support.Stack.Pop();
            string left = support.Stack.Pop();
            string resultReg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L {left},{resultReg}");
            support.AsmWriter.WriteLine($"    ADD.L {right},{resultReg}");
            support.Stack.ReleaseDataRegister(left);
            support.Stack.ReleaseDataRegister(right);
            support.Stack.Push(resultReg);
        }
    }
}