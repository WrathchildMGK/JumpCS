using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.Asm68000.Opcodes
{
    public class Ldarg_3 : IOpcodeTranslation
    {
        public void Translate(object? operand, IBackendSupport support)
        {
            string targetReg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L 20(A6),{targetReg}  ; Load arg.3 (fourth param)");
            support.Stack.Push(targetReg);
        }
    }
}