using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldc.i4 — push 32-bit integer constant from operand</summary>
public class Ldc_I4 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        if (operand is int val)
        {
            string temp = s.Stack.AllocateDataRegister();
            s.Emit($"{temp} = {val}L;");
            s.Stack.Push(temp);
        }
    }
}