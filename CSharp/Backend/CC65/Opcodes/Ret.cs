using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ret — return from method</summary>
public class Ret : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (support.Stack.StackDepth > 0)
            support.Emit($"return {support.Stack.Pop()};");
        else
            support.Emit("return;");
    }
}