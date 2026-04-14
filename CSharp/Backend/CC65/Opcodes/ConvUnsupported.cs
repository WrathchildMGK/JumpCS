using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>conv.r4, conv.r8 — float conversions not yet supported</summary>
public class ConvUnsupported(string typeName) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string value = support.Stack.Pop();
        support.EmitComment($"WARNING: {typeName} conversion not supported on 6502");
        support.Stack.Push(value);
    }
}