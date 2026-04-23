using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.Asm68000.Opcodes
{
    public class Ldarg_1 : IOpcodeTranslation
    {
        public void Translate(object? operand, IBackendSupport support)
        {
            string targetReg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L 12(A6),{targetReg}  ; Load arg.1 (second param)");
            support.Stack.Push(targetReg);
        }
    }
}