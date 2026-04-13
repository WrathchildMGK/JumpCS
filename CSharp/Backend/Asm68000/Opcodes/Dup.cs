using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Dup : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string val = support.Stack.Peek();
        support.AsmWriter.WriteLine($"    ; Duplicate {val}");
        support.Stack.Push(val);
    }
}