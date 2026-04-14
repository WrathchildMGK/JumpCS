using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>Unary operation: neg (-), not (~)</summary>
public class UnaryOp(string op) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string value = support.Stack.Pop();
        string temp = support.Stack.AllocateDataRegister();
        support.Emit($"{temp} = {op}{value};");
        support.Stack.Push(temp);
    }
}