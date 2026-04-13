using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Ldloc_3 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        int frameOffset = -16;
        if (support.DoubleLocals.Contains(3))
        {
            string r1 = support.Stack.AllocateDataRegister(); string r2 = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L {frameOffset}(A6),{r1}      ; Load local.3 (high)");
            support.AsmWriter.WriteLine($"    MOVE.L {frameOffset - 4}(A6),{r2}  ; Load local.3 (low)");
            support.Stack.Push(r1, isDoubleWord: true); support.Stack.Push(r2, isDoubleWord: true);
        }
        else
        {
            string r = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L {frameOffset}(A6),{r}  ; Load local.3");
            support.Stack.Push(r);
        }
    }
}   