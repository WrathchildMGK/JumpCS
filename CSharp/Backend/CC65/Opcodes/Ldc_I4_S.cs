using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldc.i4.s — push short-form integer constant (signed byte, sign-extended)</summary>
public class Ldc_I4_S : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        if (operand is int val)
        {
            // ldc.i4.s operand is a signed byte (-128..127) sign-extended to int32
            int signExtended = (sbyte)(val & 0xFF);
            string temp = s.Stack.AllocateDataRegister();
            s.Emit($"{temp} = {signExtended};");
            s.Stack.Push(temp);
        }
    }
}