using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Dup : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        string val = support.Stack.Peek();
        support.AsmWriter.WriteLine($"    ; Duplicate {val}");
        support.Stack.Push(val);
    }
}