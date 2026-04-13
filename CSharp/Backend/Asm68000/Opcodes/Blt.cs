using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Blt : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (support.Stack.StackDepth >= 4 && support.Stack.IsTopDoubleWord)
        {
            string val2_lo = support.Stack.Pop(); string val2_hi = support.Stack.Pop();
            string val1_lo = support.Stack.Pop(); string val1_hi = support.Stack.Pop();
            string label = support.Labels.GetOrCreateLabel(support.Iterator.NextIndex + (int)(operand ?? 0));
            support.AsmWriter.WriteLine($"    MOVE.L {val1_hi},D0");
            support.AsmWriter.WriteLine($"    MOVE.L {val1_lo},D1");
            support.AsmWriter.WriteLine($"    MOVE.L {val2_hi},D2");
            support.AsmWriter.WriteLine($"    MOVE.L {val2_lo},D3");
            support.AsmWriter.WriteLine($"    JSR __ltdf2           ; IEEE 754 double less-than");
            support.AsmWriter.WriteLine($"    TST.L D0");
            support.AsmWriter.WriteLine($"    BNE {label}  ; Branch if < (double, signed)");
            support.Stack.ReleaseDataRegister(val1_hi); support.Stack.ReleaseDataRegister(val1_lo);
            support.Stack.ReleaseDataRegister(val2_hi); support.Stack.ReleaseDataRegister(val2_lo);
        }
        else if (support.Stack.StackDepth >= 2)
        {
            string val2 = support.Stack.Pop(); string val1 = support.Stack.Pop();
            string label = support.Labels.GetOrCreateLabel(support.Iterator.NextIndex + (int)(operand ?? 0));
            support.AsmWriter.WriteLine($"    CMP.L {val2},{val1}");
            support.AsmWriter.WriteLine($"    BLT {label}  ; Branch if < (signed)");
        }
        else { support.AsmWriter.WriteLine($"    ; WARNING: Blt with insufficient stack depth ({support.Stack.StackDepth})"); }
    }
}