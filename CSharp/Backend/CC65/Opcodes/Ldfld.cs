using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>ldfld — load field value</summary>
public class Ldfld : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is not int fieldToken) return;
        if (support.Stack.StackDepth < 1) return;

        string obj = support.Stack.Pop();
        support.EmitComment($"ldfld field 0x{fieldToken:X8}");
        string temp = support.Stack.AllocateDataRegister();
        support.Emit($"{temp} = {obj}; /* TODO: actual field access */");
        support.Stack.Push(temp);
    }
}