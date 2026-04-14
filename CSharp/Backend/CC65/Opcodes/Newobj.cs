using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>newobj — allocate and construct object (simplified)</summary>
public class Newobj : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is int methodToken)
        {
            support.EmitComment($"TODO: newobj token 0x{methodToken:X8}");
            string temp = support.Stack.AllocateDataRegister();
            support.Emit($"{temp} = 0; /* newobj placeholder */");
            support.Stack.Push(temp);
        }
    }
}