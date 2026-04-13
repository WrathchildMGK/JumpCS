using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>pop — discard top of stack</summary>
public class Pop : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        if (s.Stack.StackDepth > 0)
            s.Emit($"(void){s.Stack.Pop()}; /* pop */");
    }
}