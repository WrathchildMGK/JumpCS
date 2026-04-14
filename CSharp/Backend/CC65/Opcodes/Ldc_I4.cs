using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldc.i4 — push 32-bit integer constant from operand</summary>
public class Ldc_I4 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is int val)
        {
            string temp = support.Stack.AllocateDataRegister();
            support.Emit($"{temp} = {val}L;");
            support.Stack.Push(temp);
        }
    }
}