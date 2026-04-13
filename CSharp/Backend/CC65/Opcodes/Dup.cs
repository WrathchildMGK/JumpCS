using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>dup — duplicate top of stack</summary>
public class Dup : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        string top = s.Stack.Peek();
        string temp = s.Stack.AllocateDataRegister();
        s.Emit($"{temp} = {top};");
        s.Stack.Push(temp);
    }
}