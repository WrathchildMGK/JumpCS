using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Leave : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        int targetOffset = support.Iterator.NextIndex + (int)(operand ?? 0);
        string label = support.Labels.GetOrCreateLabel(targetOffset);
        support.AsmWriter.WriteLine($"    BRA {label}  ; leave - exit exception handler");
        support.Stack.Clear();
    }
}