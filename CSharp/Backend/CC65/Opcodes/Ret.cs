using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ret — return from method</summary>
public class Ret : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        if (s.Stack.StackDepth > 0)
            s.Emit($"return {s.Stack.Pop()};");
        else
            s.Emit("return;");
    }
}