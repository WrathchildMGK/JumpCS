using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldc.i8 — load 64-bit integer constant</summary>
public class Ldc_I8 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is not long value) return;
        string temp = support.Stack.AllocateDataRegister();
        support.Emit($"{temp} = {value}L; /* ldc.i8 */");
        support.Stack.Push(temp);
    }
}