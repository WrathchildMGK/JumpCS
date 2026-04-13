using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
// BUILD ERROR: needs _floatConstants, _iterator — will be resolved later
public class Ldc_R4 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        float fVal = 0f;
        bool handled = false;
        if (operand is float f) { fVal = f; handled = true; }
        else if (operand is double d) { fVal = (float)d; handled = true; }
        else if (operand is int intBits) { fVal = BitConverter.Int32BitsToSingle(intBits); handled = true; }

        if (handled)
        {
            int constantIndex = support.Iterator.CurrentIndex;
            support.FloatConstants[constantIndex] = fVal;
            string targetReg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    LEA FLOAT_CONST_{constantIndex:X4}(PC),A0");
            support.AsmWriter.WriteLine($"    MOVE.L (A0),{targetReg}");
            support.Stack.Push(targetReg);
        }
        else
        {
            support.AsmWriter.WriteLine($"    ; WARNING: ldc.r4 operand type: {operand?.GetType().Name ?? "null"} value: {operand}");
            string targetReg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    CLR.L {targetReg}  ; TODO: Load float constant");
            support.Stack.Push(targetReg);
        }
    }
}