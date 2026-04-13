using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
// BUILD ERROR: needs _doubleConstants, _iterator — will be resolved later
public class Ldc_R8 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is double dVal)
        {
            int constantIndex = support.Iterator.CurrentIndex;
            support.DoubleConstants[constantIndex] = dVal;
            string addrReg = support.Stack.AllocateAddressRegister();
            string targetReg1 = support.Stack.AllocateDataRegister();
            string targetReg2 = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    LEA DOUBLE_CONST_{constantIndex:X4}(PC),{addrReg}");
            support.AsmWriter.WriteLine($"    MOVE.L ({addrReg}),{targetReg1}     ; Double high word");
            support.AsmWriter.WriteLine($"    MOVE.L 4({addrReg}),{targetReg2}    ; Double low word");
            support.Stack.ReleaseAddressRegister(addrReg);
            support.Stack.Push(targetReg1, isDoubleWord: true);
            support.Stack.Push(targetReg2, isDoubleWord: true);
        }
    }
}