using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>pop — discard top of stack</summary>
public class Pop : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (support.Stack.StackDepth > 0)
            support.Emit($"(void){support.Stack.Pop()}; /* pop */");
    }
}