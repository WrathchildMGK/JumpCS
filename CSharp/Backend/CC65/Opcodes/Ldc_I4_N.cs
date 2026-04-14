using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldc.i4.0 through ldc.i4.8 and ldc.i4.m1 — push integer constant</summary>
public class Ldc_I4_N(int value) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string temp = support.Stack.AllocateDataRegister();
        support.Emit($"{temp} = {value};");
        support.Stack.Push(temp);
    }
}