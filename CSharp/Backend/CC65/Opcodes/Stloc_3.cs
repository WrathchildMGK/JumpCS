using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>stloc.3 — store local variable 3</summary>
public class Stloc_3 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (support.Stack.StackDepth < 1) return;
        string value = support.Stack.Pop();
        support.Emit($"local_3 = {value};");
    }
}