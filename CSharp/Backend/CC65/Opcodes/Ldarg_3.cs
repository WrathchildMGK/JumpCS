using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldarg.3 — push fourth argument</summary>
public class Ldarg_3 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        support.Stack.Push("arg_3");
    }
}