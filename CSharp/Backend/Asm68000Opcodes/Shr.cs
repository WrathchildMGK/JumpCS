using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Shr : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        string shiftAmount = support.Stack.Pop();
        string value = support.Stack.Pop();
        string resultReg = support.Stack.AllocateDataRegister();
        support.AsmWriter.WriteLine($"    MOVE.L {value},{resultReg}");
        support.AsmWriter.WriteLine($"    MOVE.L {shiftAmount},D0");
        support.AsmWriter.WriteLine($"    ASR.L D0,{resultReg}  ; Shift right (arithmetic)");
        support.Stack.ReleaseDataRegister(value);
        support.Stack.ReleaseDataRegister(shiftAmount);
        support.Stack.Push(resultReg);
    }
}