using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>Binary operation: add, sub, mul, div, rem, and, or, xor, shl, shr</summary>
public class BinaryOp(string op) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        string right = s.Stack.Pop();
        string left = s.Stack.Pop();
        string temp = s.Stack.AllocateDataRegister();
        s.Emit($"{CC65TypeMapper.StackType} {temp} = {left} {op} {right};");
        s.Stack.Push(temp);
    }
}