using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldarg — push argument at index</summary>
public class Ldarg : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is not ushort index) return;
        support.Stack.Push($"arg_{index}");
    }
}