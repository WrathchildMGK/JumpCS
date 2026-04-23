using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.Asm68000.Opcodes
{
    public class Ldfld : IOpcodeTranslation
    {
        public void Translate(object? operand, IBackendSupport support)
        {
            if (operand is not int fieldToken)
            {
                support.AsmWriter.WriteLine($"    ; ERROR: Invalid operand for ldfld");
                return;
            }

            string objectRef = support.Stack.Pop();
            string targetReg = support.Stack.AllocateDataRegister();

            // Field token typically encodes class and field index
            int fieldOffset = (fieldToken & 0xFF) * 4;  // Assume 4-byte field alignment

            support.AsmWriter.WriteLine($"    MOVE.L ({objectRef}),{targetReg}  ; Load field at offset {fieldOffset}");
            support.Stack.Push(targetReg);
        }
    }
}