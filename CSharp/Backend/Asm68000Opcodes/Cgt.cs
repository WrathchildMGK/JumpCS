using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Cgt : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        if (support.Stack.StackDepth >= 4 && support.Stack.IsTopDoubleWord)
        {
            string right_lo = support.Stack.Pop();
            string right_hi = support.Stack.Pop();
            string left_lo = support.Stack.Pop();
            string left_hi = support.Stack.Pop();
            support.AsmWriter.WriteLine($"    MOVE.L {left_hi},D0");
            support.AsmWriter.WriteLine($"    MOVE.L {left_lo},D1");
            support.AsmWriter.WriteLine($"    MOVE.L {right_hi},D2");
            support.AsmWriter.WriteLine($"    MOVE.L {right_lo},D3");
            support.AsmWriter.WriteLine($"    JSR __gtdf2           ; IEEE 754 double greater-than");
            support.Stack.ReleaseDataRegister(left_hi);
            support.Stack.ReleaseDataRegister(left_lo);
            support.Stack.ReleaseDataRegister(right_hi);
            support.Stack.ReleaseDataRegister(right_lo);
            support.Stack.Push("D0");
        }
        else
        {
            string right = support.Stack.Pop();
            string left = support.Stack.Pop();
            string resultReg = support.Stack.AllocateDataRegister();
            string label = support.Labels.GetUniqueLabel();
            support.AsmWriter.WriteLine($"    CMP.L {right},{left}");
            support.AsmWriter.WriteLine($"    BGT {label}_gt");
            support.AsmWriter.WriteLine($"    CLR.L {resultReg}");
            support.AsmWriter.WriteLine($"    BRA {label}_end");
            support.AsmWriter.WriteLine($"{label}_gt:");
            support.AsmWriter.WriteLine($"    MOVE.L #1,{resultReg}");
            support.AsmWriter.WriteLine($"{label}_end:");
            support.Stack.ReleaseDataRegister(left);
            support.Stack.ReleaseDataRegister(right);
            support.Stack.Push(resultReg);
        }
    }
}