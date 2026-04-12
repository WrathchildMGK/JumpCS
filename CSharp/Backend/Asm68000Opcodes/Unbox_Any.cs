using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Unbox_Any : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
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