using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldloc.1 — push local variable 1</summary>
public class Ldloc_1 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        support.Stack.Push("local_1");
    }
}