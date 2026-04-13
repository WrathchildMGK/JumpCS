using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Unbox_Any : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is int typeToken)
        {
            string objRef = support.Stack.Pop();
            support.AsmWriter.WriteLine($"    ; Unbox.Any type token {typeToken:X8}");
            support.AsmWriter.WriteLine($"    MOVE.L {objRef},D0     ; Unboxed value");
            support.Stack.ReleaseDataRegister(objRef);
            support.Stack.Push("D0");
        }
    }
}