using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.Asm68000.Opcodes
{
    public class Ldc_I4_0 : IOpcodeTranslation
    {
        public void Translate(object? operand, IBackendSupport support)
        {
            string targetReg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    CLR.L {targetReg}             ; Load 0");
            support.Stack.Push(targetReg);
        }
    }
}
