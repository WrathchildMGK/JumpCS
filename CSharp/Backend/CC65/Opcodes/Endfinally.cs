using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>endfinally — end finally block</summary>
public class Endfinally : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        support.EmitComment("endfinally");
        // Finally blocks are handled by the surrounding try/catch structure
    }
}