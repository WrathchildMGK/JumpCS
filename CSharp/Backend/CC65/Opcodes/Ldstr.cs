using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldstr — push string constant reference</summary>
public class Ldstr : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is not int stringToken) return;

        support.EmitComment($"ldstr 0x{stringToken:X8}");
        string temp = support.Stack.AllocateDataRegister();
        support.Emit($"{temp} = (int32_t)0x{stringToken:X8}; /* string literal reference */");
        support.Stack.Push(temp);
    }
}