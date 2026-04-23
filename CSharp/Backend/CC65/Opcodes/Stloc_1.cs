using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>stloc.1 — store local variable 1</summary>
public class Stloc_1 : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (support.Stack.StackDepth < 1) return;
        string value = support.Stack.Pop();
        support.Emit($"local_1 = {value};");
    }
}