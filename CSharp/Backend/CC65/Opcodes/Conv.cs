using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>conv.i4, conv.u1, conv.i8 — type conversion via C cast</summary>
public class Conv(string targetType) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        string value = s.Stack.Pop();
        string temp = s.Stack.AllocateDataRegister();
        s.Emit($"{CC65TypeMapper.StackType} {temp} = ({targetType}){value};");
        s.Stack.Push(temp);
    }
}