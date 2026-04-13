using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Shr_Un : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string shiftAmount = support.Stack.Pop();
        string value = support.Stack.Pop();
        string resultReg = support.Stack.AllocateDataRegister();
        support.AsmWriter.WriteLine($"    MOVE.L {value},{resultReg}");
        support.AsmWriter.WriteLine($"    MOVE.L {shiftAmount},D0");
        support.AsmWriter.WriteLine($"    LSR.L D0,{resultReg}  ; Shift right (logical/unsigned)");
        support.Stack.ReleaseDataRegister(value);
        support.Stack.ReleaseDataRegister(shiftAmount);
        support.Stack.Push(resultReg);
    }
}