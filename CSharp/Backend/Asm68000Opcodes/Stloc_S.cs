using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Stloc_S : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        if (operand is int localIdx)
        {
            int offset = -4 - (localIdx * 4);
            if (support.Stack.StackDepth >= 2 && support.Stack.IsTopDoubleWord)
            {
                string lo = support.Stack.Pop(); string hi = support.Stack.Pop();
                support.AsmWriter.WriteLine($"    MOVE.L {hi},{offset}(A6)      ; Store to local {localIdx} (high)");
                support.AsmWriter.WriteLine($"    MOVE.L {lo},{offset - 4}(A6)  ; Store to local {localIdx} (low)");
                support.Stack.ReleaseDataRegister(hi); support.Stack.ReleaseDataRegister(lo);
                support.DoubleLocals.Add(localIdx);
            }
            else if (support.Stack.StackDepth > 0)
            {
                string src = support.Stack.Pop();
                support.AsmWriter.WriteLine($"    MOVE.L {src},{offset}(A6)  ; Store to local {localIdx}");
                support.Stack.ReleaseDataRegister(src);
            }
            else { support.AsmWriter.WriteLine($"    ; WARNING: Stloc_S with empty stack"); }
        }
    }
}