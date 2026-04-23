using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldloc.3 — push local variable 3</summary>
public class Ldloc_3 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        support.Stack.Push("local_3");
    }
}