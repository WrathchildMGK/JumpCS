using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Stloc_1 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (support.Stack.StackDepth >= 2 && support.Stack.IsTopDoubleWord)
        {
            string lo = support.Stack.Pop(); string hi = support.Stack.Pop();
            support.AsmWriter.WriteLine($"    MOVE.L {hi},-8(A6)    ; Store to local 1 (high)");
            support.AsmWriter.WriteLine($"    MOVE.L {lo},-12(A6)   ; Store to local 1 (low)");
            support.Stack.ReleaseDataRegister(hi); support.Stack.ReleaseDataRegister(lo);
            support.DoubleLocals.Add(1);
        }
        else if (support.Stack.StackDepth > 0)
        {
            string v = support.Stack.Pop();
            support.AsmWriter.WriteLine($"    MOVE.L {v},-8(A6)   ; Store to local 1");
            support.Stack.ReleaseDataRegister(v);
        }
        else { support.AsmWriter.WriteLine($"    ; WARNING: Stloc_1 with empty stack"); }
    }
}