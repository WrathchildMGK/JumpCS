using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>shr.un — unsigned (logical) right shift</summary>
public class Shr_Un : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string amount = support.Stack.Pop();
        string value = support.Stack.Pop();
        string temp = support.Stack.AllocateDataRegister();
        support.Emit($"{temp} = (uint32_t){value} >> {amount};");
        support.Stack.Push(temp);
    }
}