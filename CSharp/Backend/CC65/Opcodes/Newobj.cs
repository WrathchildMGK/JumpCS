using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>newobj — allocate and construct object (simplified)</summary>
public class Newobj : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        if (operand is int methodToken)
        {
            s.Emit($"/* TODO: newobj token 0x{methodToken:X8} */");
            string temp = s.Stack.AllocateDataRegister();
            s.Emit($"{temp} = 0; /* newobj placeholder */");
            s.Stack.Push(temp);
        }
    }
}