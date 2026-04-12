using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Conv_R4 : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        if (support.Stack.StackDepth > 0)
        {
            string value = support.Stack.Pop();
            string resultReg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L {value},{resultReg}  ; Convert to R4");
            support.Stack.ReleaseDataRegister(value);
            support.Stack.Push(resultReg);
        }
        else { support.AsmWriter.WriteLine($"    ; WARNING: Conv_R4 with empty stack"); }
    }
}