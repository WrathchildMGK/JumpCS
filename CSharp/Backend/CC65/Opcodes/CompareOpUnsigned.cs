using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>clt.un, cgt.un — unsigned comparison, push 0 or 1</summary>
public class CompareOpUnsigned(string op) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        string right = s.Stack.Pop();
        string left = s.Stack.Pop();
        string temp = s.Stack.AllocateDataRegister();
        s.Emit($"{CC65TypeMapper.StackType} {temp} = ((uint32_t){left} {op} (uint32_t){right}) ? 1 : 0;");
        s.Stack.Push(temp);
    }
}