using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldc.i4.s — push short-form integer constant (signed byte, sign-extended)</summary>
public class Ldc_I4_S : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is int val)
        {
            // ldc.i4.s operand is a signed byte (-128..127) sign-extended to int32
            int signExtended = (sbyte)(val & 0xFF);
            string temp = support.Stack.AllocateDataRegister();
            support.Emit($"{temp} = {signExtended};");
            support.Stack.Push(temp);
        }
    }
}