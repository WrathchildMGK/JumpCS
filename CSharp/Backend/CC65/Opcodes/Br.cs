using System.Reflection.Emit;
using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>br, br.s, leave, leave.s — unconditional branch</summary>
public class Br : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        int offset = SignExtendOffset(operand, s.Iterator.CurrentOpcode);
        int target = s.Iterator.NextIndex + offset;
        s.Emit($"goto IL_{target:X4};");
        s.Stack.Clear();
    }

    /// <summary>Sign-extend short-form branch offsets</summary>
    internal static int SignExtendOffset(object? operand, OpCode opcode)
    {
        if (operand is not int val) return 0;

        // Short-form opcodes use signed byte offsets
        if (opcode.OperandType == OperandType.ShortInlineBrTarget)
            return (sbyte)(val & 0xFF);

        return val;
    }
}