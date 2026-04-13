using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Ret : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (support.Stack.StackDepth > 0)
        {
            string retVal = support.Stack.Pop();
            if (retVal != "D0")
                support.AsmWriter.WriteLine($"    MOVE.L {retVal},D0  ; Move return value to D0");
        }
        else
        {
            support.AsmWriter.WriteLine("    CLR.L D0            ; Clear return value (void)");
        }
    }
}