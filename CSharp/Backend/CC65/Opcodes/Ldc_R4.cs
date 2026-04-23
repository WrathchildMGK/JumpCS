using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldc.r4 — load 32-bit float constant</summary>
public class Ldc_R4 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is not float value) return;
        string temp = support.Stack.AllocateDataRegister();
        support.Emit($"{temp} = {value}f; /* ldc.r4 */");
        support.Stack.Push(temp);
    }
}