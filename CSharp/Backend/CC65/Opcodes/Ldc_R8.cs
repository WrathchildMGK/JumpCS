using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldc.r8 — load 64-bit float constant</summary>
public class Ldc_R8 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is not double value) return;
        string temp = support.Stack.AllocateDataRegister();
        support.Emit($"{temp} = {value}; /* ldc.r8 */");
        support.Stack.Push(temp);
    }
}