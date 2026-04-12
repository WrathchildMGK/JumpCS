using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Ldarg_0 : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        string targetReg = support.Stack.AllocateDataRegister();
        support.AsmWriter.WriteLine($"    MOVE.L 8(A6),{targetReg}  ; Load arg.0 (this/first param)");
        support.Stack.Push(targetReg);
    }
}