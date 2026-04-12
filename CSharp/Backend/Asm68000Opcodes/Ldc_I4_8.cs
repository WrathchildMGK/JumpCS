using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Ldc_I4_8 : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        string targetReg = support.Stack.AllocateDataRegister();
        support.AsmWriter.WriteLine($"    MOVE.L #8,{targetReg}         ; Load 8");
        support.Stack.Push(targetReg);
    }
}