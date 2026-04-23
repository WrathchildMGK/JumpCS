using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.Asm68000.Opcodes
{
    public class Ldstr : IOpcodeTranslation
    {
        public void Translate(object? operand, IBackendSupport support)
        {
            if (operand is not int stringToken)
            {
                support.AsmWriter.WriteLine($"    ; ERROR: Invalid operand for ldstr");
                return;
            }

            string targetReg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    LEA STRING_{stringToken:X8},A0  ; Load string literal");
            support.AsmWriter.WriteLine($"    MOVE.L A0,{targetReg}");
            support.Stack.Push(targetReg);
        }
    }
}