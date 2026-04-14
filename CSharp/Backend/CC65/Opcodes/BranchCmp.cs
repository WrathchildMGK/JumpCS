using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>beq, bne.un, blt, bge, ble — signed conditional branch</summary>
public class BranchCmp(string op) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string right = support.Stack.Pop();
        string left = support.Stack.Pop();
        int offset = Br.SignExtendOffset(operand, support.Iterator.CurrentOpcode);
        int target = support.Iterator.NextIndex + offset;
        support.Emit($"if ({left} {op} {right}) goto IL_{target:X4};");
    }
}