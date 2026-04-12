using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Conv_R8 : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        if (support.Stack.StackDepth > 0)
        {
            string value = support.Stack.Pop();
            string resultReg1 = support.Stack.AllocateDataRegister();
            string resultReg2 = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L {value},{resultReg1}  ; Convert to R8 (high word)");
            support.AsmWriter.WriteLine($"    CLR.L {resultReg2}          ; Convert to R8 (low word)");
            support.Stack.ReleaseDataRegister(value);
            support.Stack.Push(resultReg1, isDoubleWord: true);
            support.Stack.Push(resultReg2, isDoubleWord: true);
        }
        else { support.AsmWriter.WriteLine($"    ; WARNING: Conv_R8 with empty stack"); }
    }
}