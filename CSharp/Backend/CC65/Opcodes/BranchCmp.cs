using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>beq, bne.un, blt, bge, ble — signed conditional branch</summary>
public class BranchCmp(string op) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        string right = s.Stack.Pop();
        string left = s.Stack.Pop();
        int offset = Br.SignExtendOffset(operand, s.Iterator.CurrentOpcode);
        int target = s.Iterator.NextIndex + offset;
        s.Emit($"if ({left} {op} {right}) goto IL_{target:X4};");
    }
}