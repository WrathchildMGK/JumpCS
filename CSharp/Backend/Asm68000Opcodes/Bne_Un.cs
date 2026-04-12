using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
// BUILD ERROR: needs _labels, _iterator — will be resolved later
public class Bne_Un : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
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
            support.AsmWriter.WriteLine($"    JSR __eqdf2           ; IEEE 754 double equality");
            support.AsmWriter.WriteLine($"    TST.L D0");
            support.AsmWriter.WriteLine($"    BEQ {label}  ; Branch if not equal (double)");
            support.Stack.ReleaseDataRegister(val1_hi); support.Stack.ReleaseDataRegister(val1_lo);
            support.Stack.ReleaseDataRegister(val2_hi); support.Stack.ReleaseDataRegister(val2_lo);
        }
        else if (support.Stack.StackDepth >= 2)
        {
            string val2 = support.Stack.Pop(); string val1 = support.Stack.Pop();
            string label = support.Labels.GetOrCreateLabel(support.Iterator.NextIndex + (int)(operand ?? 0));
            support.AsmWriter.WriteLine($"    CMP.L {val2},{val1}");
            support.AsmWriter.WriteLine($"    BNE {label}  ; Branch if not equal (unsigned)");
        }
        else
        {
            support.AsmWriter.WriteLine($"    ; WARNING: Bne_Un with insufficient stack depth ({support.Stack.StackDepth})");
        }
    }
}