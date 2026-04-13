using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Br : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string label = support.Labels.GetOrCreateLabel(support.Iterator.NextIndex + (int)(operand ?? 0));
        support.AsmWriter.WriteLine($"    BRA {label}  ; Unconditional branch");
        support.Stack.Clear();
    }
}