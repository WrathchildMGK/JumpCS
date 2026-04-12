using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Br : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        string label = support.Labels.GetOrCreateLabel(support.Iterator.NextIndex + (int)(operand ?? 0));
        support.AsmWriter.WriteLine($"    BRA {label}  ; Unconditional branch");
        support.Stack.Clear();
    }
}