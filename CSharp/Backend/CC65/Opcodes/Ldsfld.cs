using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldsfld — load static field</summary>
public class Ldsfld : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is not int fieldToken) return;
        support.EmitComment($"ldsfld field 0x{fieldToken:X8}");
        string temp = support.Stack.AllocateDataRegister();
        support.Emit($"{temp} = 0; /* TODO: static field access */");
        support.Stack.Push(temp);
    }
}