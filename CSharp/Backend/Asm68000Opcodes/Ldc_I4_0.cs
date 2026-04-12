using JumpCS.Backend;

namespace CSharp.Backend.Asm68000Opcodes
{
    public class Ldc_I4_0 : IOpcodeTranslation
    {
        public void Translate(object? operand, Asm68000StackSimulator stack, StreamWriter asmWriter)
        {
            string targetReg = stack.AllocateDataRegister();
            asmWriter.WriteLine($"    CLR.L {targetReg}             ; Load 0");
            stack.Push(targetReg);
        }
    }
}
