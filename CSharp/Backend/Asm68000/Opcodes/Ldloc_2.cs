using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Ldloc_2 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        int frameOffset = -12;
        if (support.DoubleLocals.Contains(2))
        {
            string r1 = support.Stack.AllocateDataRegister(); string r2 = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L {frameOffset}(A6),{r1}      ; Load local.2 (high)");
            support.AsmWriter.WriteLine($"    MOVE.L {frameOffset - 4}(A6),{r2}  ; Load local.2 (low)");
            support.Stack.Push(r1, isDoubleWord: true); support.Stack.Push(r2, isDoubleWord: true);
        }
        else
        {
            string reg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L -12(A6),{reg}  ; Load local.2");
            support.Stack.Push(reg);
        }
    }
}