using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Box : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        if (operand is int typeToken)
        {
            string valueReg = support.Stack.Pop();
            support.AsmWriter.WriteLine($"    ; Box type token {typeToken:X8}");
            support.AsmWriter.WriteLine($"    MOVE.L {valueReg},D0     ; Boxed value");
            support.Stack.ReleaseDataRegister(valueReg);
            support.Stack.Push("D0");
        }
    }
}