using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldc.i4.0 through ldc.i4.8 and ldc.i4.m1 — push integer constant</summary>
public class Ldc_I4_N(int value) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        string temp = s.Stack.AllocateDataRegister();
        s.Emit($"{CC65TypeMapper.StackType} {temp} = {value};");
        s.Stack.Push(temp);
    }
}