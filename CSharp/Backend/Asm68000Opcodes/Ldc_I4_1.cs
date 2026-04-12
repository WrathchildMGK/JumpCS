using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Ldc_I4_1 : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        string targetReg = support.Stack.AllocateDataRegister();
        support.AsmWriter.WriteLine($"    MOVE.L #1,{targetReg}         ; Load 1");
        support.Stack.Push(targetReg);
    }
}