using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>shr.un — unsigned (logical) right shift</summary>
public class Shr_Un : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        string amount = s.Stack.Pop();
        string value = s.Stack.Pop();
        string temp = s.Stack.AllocateDataRegister();
        s.Emit($"{temp} = (uint32_t){value} >> {amount};");
        s.Stack.Push(temp);
    }
}