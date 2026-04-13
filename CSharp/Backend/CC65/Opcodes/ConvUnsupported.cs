using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>conv.r4, conv.r8 — float conversions not yet supported</summary>
public class ConvUnsupported(string typeName) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        string value = s.Stack.Pop();
        s.Emit($"/* WARNING: {typeName} conversion not supported on 6502 */");
        s.Stack.Push(value);
    }
}