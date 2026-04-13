using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ceq, clt, cgt — signed comparison, push 0 or 1</summary>
public class CompareOp(string op) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        string right = s.Stack.Pop();
        string left = s.Stack.Pop();
        string temp = s.Stack.AllocateDataRegister();
        s.Emit($"{CC65TypeMapper.StackType} {temp} = ({left} {op} {right}) ? 1 : 0;");
        s.Stack.Push(temp);
    }
}