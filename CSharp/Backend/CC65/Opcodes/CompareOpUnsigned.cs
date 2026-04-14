using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>clt.un, cgt.un — unsigned comparison, push 0 or 1</summary>
public class CompareOpUnsigned(string op) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string right = support.Stack.Pop();
        string left = support.Stack.Pop();
        string temp = support.Stack.AllocateDataRegister();
        support.Emit($"{temp} = ((uint32_t){left} {op} (uint32_t){right}) ? 1 : 0;");
        support.Stack.Push(temp);
    }
}