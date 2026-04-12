using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Pop : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        if (support.Stack.StackDepth > 0) { support.Stack.Pop(); support.AsmWriter.WriteLine("    ; Pop"); }
        else { support.AsmWriter.WriteLine("    ; WARNING: Pop on empty stack"); }
    }
}