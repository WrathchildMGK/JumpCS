using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Conv_U1 : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        if (support.Stack.StackDepth > 0)
        {
            string value = support.Stack.Pop();
            string resultReg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L {value},{resultReg}");
            support.AsmWriter.WriteLine($"    ANDI.L #$FF,{resultReg}   ; Conv_U1: mask to unsigned byte");
            support.Stack.ReleaseDataRegister(value);
            support.Stack.Push(resultReg);
        }
        else { support.AsmWriter.WriteLine($"    ; WARNING: Conv_U1 with empty stack"); }
    }
}