using JumpCS.Backend;

namespace CSharp.Backend.Asm68000Opcodes
{
    public class Ldc_I4_0 : IOpcodeTranslation
    {
        public void Translate(object? operand, Asm68000Support support)
        {
            string targetReg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    CLR.L {targetReg}             ; Load 0");
            support.Stack.Push(targetReg);
        }
    }
}
