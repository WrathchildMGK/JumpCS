using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.Asm68000.Opcodes
{
    public class Ldarg : IOpcodeTranslation
    {
        public void Translate(object? operand, IBackendSupport support)
        {
            if (operand is not int argIndex)
            {
                support.AsmWriter.WriteLine($"    ; ERROR: Invalid operand for ldarg");
                return;
            }

            string targetReg = support.Stack.AllocateDataRegister();
            int offset = 8 + (argIndex * 4);  // First arg at 8(A6), then 12(A6), 16(A6), etc.
            support.AsmWriter.WriteLine($"    MOVE.L {offset}(A6),{targetReg}  ; Load arg.{argIndex}");
            support.Stack.Push(targetReg);
        }
    }
}