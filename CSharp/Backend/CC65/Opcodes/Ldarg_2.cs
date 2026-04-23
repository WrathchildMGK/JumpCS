using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldarg.2 — push third argument</summary>
public class Ldarg_2 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        support.Stack.Push("arg_2");
    }
}