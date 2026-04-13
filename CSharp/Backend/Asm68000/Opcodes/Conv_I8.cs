using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
public class Conv_I8 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (support.Stack.StackDepth > 0)
        {
            string value = support.Stack.Pop();
            string resultHi = support.Stack.AllocateDataRegister();
            string resultLo = support.Stack.AllocateDataRegister();
            support.AsmWriter.WriteLine($"    MOVE.L {value},{resultLo}  ; Conv_I8: low word = original value");
            support.AsmWriter.WriteLine($"    MOVE.L {value},{resultHi}  ; Conv_I8: copy for sign extension");
            support.AsmWriter.WriteLine($"    ASR.L #8,{resultHi}");
            support.AsmWriter.WriteLine($"    ASR.L #8,{resultHi}");
            support.AsmWriter.WriteLine($"    ASR.L #8,{resultHi}");
            support.AsmWriter.WriteLine($"    ASR.L #7,{resultHi}       ; Sign-extend to 32 bits (high word)");
            support.Stack.ReleaseDataRegister(value);
            support.Stack.Push(resultHi);
            support.Stack.Push(resultLo);
        }
        else { support.AsmWriter.WriteLine($"    ; WARNING: Conv_I8 with empty stack"); }
    }
}