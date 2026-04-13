using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Box : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
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