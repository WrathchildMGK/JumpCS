using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ceq, clt, cgt — signed comparison, push 0 or 1</summary>
public class CompareOp(string op) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string right = support.Stack.Pop();
        string left = support.Stack.Pop();
        string temp = support.Stack.AllocateDataRegister();
        support.Emit($"{temp} = ({left} {op} {right}) ? 1 : 0;");
        support.Stack.Push(temp);
    }
}