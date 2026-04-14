using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>unbox / unbox.any — passthrough for value types</summary>
public class Unbox : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        support.Emit("/* unbox — passthrough */");
    }
}