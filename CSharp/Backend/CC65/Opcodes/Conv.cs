using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>conv.i4, conv.u1, conv.i8 — type conversion via C cast</summary>
public class Conv(string targetType) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string value = support.Stack.Pop();
        string temp = support.Stack.AllocateDataRegister();
        support.Emit($"{temp} = ({targetType}){value};");
        support.Stack.Push(temp);
    }
}