using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>blt.un, bge.un, ble.un, bgt.un — unsigned conditional branch</summary>
public class BranchCmpUnsigned(string op) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        string right = support.Stack.Pop();
        string left = support.Stack.Pop();
        int offset = Br.SignExtendOffset(operand, support.Iterator.CurrentOpcode);
        int target = support.Iterator.NextIndex + offset;
        support.Emit($"if ((uint32_t){left} {op} (uint32_t){right}) goto IL_{target:X4};");
    }
}