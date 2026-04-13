using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Ldloc : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is ushort localIdx)
        {
            int frameOffset = -(localIdx + 1) * 4 - 4;
            if (support.DoubleLocals.Contains(localIdx))
            {
                string r1 = support.Stack.AllocateDataRegister(); string r2 = support.Stack.AllocateDataRegister();
                support.AsmWriter.WriteLine($"    MOVE.L {frameOffset}(A6),{r1}      ; Load local.{localIdx} (high)");
                support.AsmWriter.WriteLine($"    MOVE.L {frameOffset + 4}(A6),{r2}  ; Load local.{localIdx} (low)");
                support.Stack.Push(r1, isDoubleWord: true); support.Stack.Push(r2, isDoubleWord: true);
            }
            else
            {
                string r = support.Stack.AllocateDataRegister();
                support.AsmWriter.WriteLine($"    MOVE.L {frameOffset}(A6),{r}  ; Load local.{localIdx}");
                support.Stack.Push(r);
            }
        }
    }
}