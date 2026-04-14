using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>Binary operation: add, sub, mul, div, rem, and, or, xor, shl, shr</summary>
public class BinaryOp(string op) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string right = support.Stack.Pop();
        string left = support.Stack.Pop();
        string temp = support.Stack.AllocateDataRegister();
        support.Emit($"{temp} = {left} {op} {right};");
        support.Stack.Push(temp);
    }
}