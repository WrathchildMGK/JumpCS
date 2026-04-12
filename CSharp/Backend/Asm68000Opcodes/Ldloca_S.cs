using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
public class Ldloca_S : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
    {
        if (operand is int localIdx)
        {
            int frameOffset = -(localIdx + 1) * 4 - 4;
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