using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Unbox : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string objRef = support.Stack.Pop();
        support.AsmWriter.WriteLine($"    ; Unbox");
        support.AsmWriter.WriteLine($"    MOVE.L {objRef},D0     ; Unboxed value");
        support.Stack.ReleaseDataRegister(objRef);
        support.Stack.Push("D0");
    }
}