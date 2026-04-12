using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Ldloc_1 : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        int frameOffset = -12;
        if (support.DoubleLocals.Contains(1))
        {
            string r1 = support.Stack.AllocateDataRegister(); string r2 = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L {frameOffset}(A6),{r1}      ; Load local.1 (high)");
            support.AsmWriter.WriteLine($"    MOVE.L {frameOffset + 4}(A6),{r2}  ; Load local.1 (low)");
            support.Stack.Push(r1, isDoubleWord: true); support.Stack.Push(r2, isDoubleWord: true);
        }
        else
        {
            string r = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L {frameOffset}(A6),{r}  ; Load local.1");
            support.Stack.Push(r);
        }
    }
}