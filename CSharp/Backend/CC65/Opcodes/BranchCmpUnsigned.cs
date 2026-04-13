using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>blt.un, bge.un, ble.un, bgt.un — unsigned conditional branch</summary>
public class BranchCmpUnsigned(string op) : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        string right = s.Stack.Pop();
        string left = s.Stack.Pop();
        int target = s.Iterator.NextIndex + (int)(operand ?? 0);
        s.Emit($"if ((uint32_t){left} {op} (uint32_t){right}) goto IL_{target:X4};");
    }
}