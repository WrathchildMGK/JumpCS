using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
// BUILD ERROR: needs _doubleLocals — will be resolved later
public class Ldloc_0 : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        int frameOffset = -8; // -(0 + 1) * 4 - 4
        if (support.DoubleLocals.Contains(0))
        {
            string r1 = support.Stack.AllocateDataRegister(); string r2 = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L {frameOffset}(A6),{r1}      ; Load local.0 (high)");
            support.AsmWriter.WriteLine($"    MOVE.L {frameOffset + 4}(A6),{r2}  ; Load local.0 (low)");
            support.Stack.Push(r1, isDoubleWord: true); support.Stack.Push(r2, isDoubleWord: true);
        }
        else
        {
            string r = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L {frameOffset}(A6),{r}  ; Load local.0");
            support.Stack.Push(r);
        }
    }
}