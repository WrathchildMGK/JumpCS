using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Ldloca_S : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is int localIdx)
        {
            int frameOffset = -(localIdx + 1) * 4;
            string addrReg = support.Stack.AllocateAddressRegister();
            support.AsmWriter.WriteLine($"    LEA {frameOffset}(A6),{addrReg}  ; Load address of local.{localIdx}");
            string dataReg = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L {addrReg},{dataReg}");
            support.Stack.ReleaseAddressRegister(addrReg);
            support.Stack.Push(dataReg);
        }
        else { support.AsmWriter.WriteLine($"    ; ERROR: ldloca.s with invalid operand type: {operand?.GetType().Name}"); }
    }
}