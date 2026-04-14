using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>dup — duplicate top of stack</summary>
public class Dup : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string top = support.Stack.Peek();
        string temp = support.Stack.AllocateDataRegister();
        support.Emit($"{temp} = {top};");
        support.Stack.Push(temp);
    }
}