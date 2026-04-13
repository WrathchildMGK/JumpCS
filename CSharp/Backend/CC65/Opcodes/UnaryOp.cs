using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>Unary operation: neg (-), not (~)</summary>
public class UnaryOp(string op) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        string value = s.Stack.Pop();
        string temp = s.Stack.AllocateDataRegister();
        s.Emit($"{temp} = {op}{value};");
        s.Stack.Push(temp);
    }
}