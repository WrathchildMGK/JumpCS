using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Leave : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        int targetOffset = support.Iterator.NextIndex + (int)(operand ?? 0);
        string label = support.Labels.GetOrCreateLabel(targetOffset);
        support.AsmWriter.WriteLine($"    BRA {label}  ; leave - exit exception handler");
        support.Stack.Clear();
    }
}