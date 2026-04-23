using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.Asm68000.Opcodes
{
    public class Brfalse_S : IOpcodeTranslation
    {
        public void Translate(object? operand, IBackendSupport support)
        {
            if (operand is not int offset)
            {
                support.AsmWriter.WriteLine($"    ; ERROR: Invalid operand for brfalse.s");
                return;
            }

            string condition = support.Stack.Pop();
            int targetOffset = support.Iterator.NextIndex + (sbyte)(offset & 0xFF);

            support.AsmWriter.WriteLine($"    TST.L {condition}           ; Test value");
            support.AsmWriter.WriteLine($"    BEQ L_{targetOffset:X4}      ; Branch if false (zero)");
        }
    }
}