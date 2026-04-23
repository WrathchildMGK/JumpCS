using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>brfalse / brfalse.s — branch if false/zero</summary>
public class Brfalse : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is not int offset) return;
        if (support.Stack.StackDepth < 1) return;

        string condition = support.Stack.Pop();
        int target = support.Iterator.NextIndex + Br.SignExtendOffset(operand, support.Iterator.CurrentOpcode);
        support.Emit($"if (!{condition}) goto IL_{target:X4};");
    }
}