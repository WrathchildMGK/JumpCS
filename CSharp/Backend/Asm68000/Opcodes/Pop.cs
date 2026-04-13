using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Pop : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (support.Stack.StackDepth > 0) { support.Stack.Pop(); support.AsmWriter.WriteLine("    ; Pop"); }
        else { support.AsmWriter.WriteLine("    ; WARNING: Pop on empty stack"); }
    }
}