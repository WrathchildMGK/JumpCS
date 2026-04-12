using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Stloc_0 : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        if (support.Stack.StackDepth >= 2 && support.Stack.IsTopDoubleWord)
        {
            string lo = support.Stack.Pop(); string hi = support.Stack.Pop();
            support.AsmWriter.WriteLine($"    MOVE.L {hi},-4(A6)    ; Store to local 0 (high)");
            support.AsmWriter.WriteLine($"    MOVE.L {lo},-8(A6)    ; Store to local 0 (low)");
            support.Stack.ReleaseDataRegister(hi); support.Stack.ReleaseDataRegister(lo);
            support.DoubleLocals.Add(0);
        }
        else if (support.Stack.StackDepth > 0)
        {
            string v = support.Stack.Pop();
            support.AsmWriter.WriteLine($"    MOVE.L {v},-4(A6)   ; Store to local 0");
            support.Stack.ReleaseDataRegister(v);
        }
        else { support.AsmWriter.WriteLine($"    ; WARNING: Stloc_0 with empty stack"); }
    }
}