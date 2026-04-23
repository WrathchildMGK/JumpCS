using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.Asm68000.Opcodes
{
    public class Ldarg_2 : IOpcodeTranslation
    {
        public void Translate(object? operand, IBackendSupport support)
        {
            string targetReg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L 16(A6),{targetReg}  ; Load arg.2 (third param)");
            support.Stack.Push(targetReg);
        }
    }
}