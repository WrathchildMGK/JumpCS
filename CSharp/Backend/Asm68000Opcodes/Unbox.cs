using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Unbox : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        string objRef = support.Stack.Pop();
        support.AsmWriter.WriteLine($"    ; Unbox");
        support.AsmWriter.WriteLine($"    MOVE.L {objRef},D0     ; Unboxed value");
        support.Stack.ReleaseDataRegister(objRef);
        support.Stack.Push("D0");
    }
}