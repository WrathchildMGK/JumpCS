using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>stloc.2 — store local variable 2</summary>
public class Stloc_2 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (support.Stack.StackDepth < 1) return;
        string value = support.Stack.Pop();
        support.Emit($"local_2 = {value};");
    }
}