using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldarg.0 — push first argument (this or first param)</summary>
public class Ldarg_0 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        ((CC65Support)support).Stack.Push("arg_0");
    }
}