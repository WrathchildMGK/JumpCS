using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Rem : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (support.Stack.StackDepth >= 4)
        {
            support.DoubleHandler.HandleRemainder(support.Stack);
        }
        else
        {
            string right = support.Stack.Pop();
            string left = support.Stack.Pop();
            support.AsmWriter.WriteLine($"    MOVE.L {left},D0");
            support.AsmWriter.WriteLine($"    DIVSL.L {right},D1:D0  ; Quotient in D0, remainder in D1");
            string resultReg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L D1,{resultReg}  ; Remainder");
            support.Stack.ReleaseDataRegister(left);
            support.Stack.ReleaseDataRegister(right);
            support.Stack.Push(resultReg);
        }
    }
}