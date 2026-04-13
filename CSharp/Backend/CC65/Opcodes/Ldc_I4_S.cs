using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldc.i4.s — push short-form integer constant from operand</summary>
public class Ldc_I4_S : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        if (operand is int val)
        {
            string temp = s.Stack.AllocateDataRegister();
            s.Emit($"{CC65TypeMapper.StackType} {temp} = {val};");
            s.Stack.Push(temp);
        }
    }
}