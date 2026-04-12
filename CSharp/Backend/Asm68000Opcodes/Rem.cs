using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Rem : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
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
            support.AsmWriter.WriteLine($"    DIVS.L {right},D0");
            string resultReg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L D1,{resultReg}  ; Remainder from division");
            support.Stack.ReleaseDataRegister(left);
            support.Stack.ReleaseDataRegister(right);
            support.Stack.Push(resultReg);
        }
    }
}