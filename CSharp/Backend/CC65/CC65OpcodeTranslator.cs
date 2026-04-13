using System.Reflection.Emit;
using JumpCS;
using JumpCS.Backend.CC65.Opcodes;
using JumpCS.Backend.Interfaces;
using JumpCS.Core;

namespace JumpCS.Backend.CC65;

public class CC65OpcodeTranslator
{
    private readonly Dictionary<OpCode, IOpcodeTranslation> _opCodes;
    private readonly CC65Support _support;
    private readonly HashSet<int> _branchTargets;

    public CC65OpcodeTranslator(CC65Support support, HashSet<int>? branchTargets = null)
    {
        _support = support;
        _branchTargets = branchTargets ?? new HashSet<int>();

        _opCodes = new Dictionary<OpCode, IOpcodeTranslation>()
        {
            // Constants
            { OpCodes.Ldc_I4_0, new Ldc_I4_N(0) },
            { OpCodes.Ldc_I4_1, new Ldc_I4_N(1) },
            { OpCodes.Ldc_I4_2, new Ldc_I4_N(2) },
            { OpCodes.Ldc_I4_3, new Ldc_I4_N(3) },
            { OpCodes.Ldc_I4_4, new Ldc_I4_N(4) },
            { OpCodes.Ldc_I4_5, new Ldc_I4_N(5) },
            { OpCodes.Ldc_I4_6, new Ldc_I4_N(6) },
            { OpCodes.Ldc_I4_7, new Ldc_I4_N(7) },
            { OpCodes.Ldc_I4_8, new Ldc_I4_N(8) },
            { OpCodes.Ldc_I4_M1, new Ldc_I4_N(-1) },
            { OpCodes.Ldc_I4, new Ldc_I4() },
            { OpCodes.Ldc_I4_S, new Ldc_I4_S() },

            // Arithmetic
            { OpCodes.Add, new BinaryOp("+") },
            { OpCodes.Sub, new BinaryOp("-") },
            { OpCodes.Mul, new BinaryOp("*") },
            { OpCodes.Div, new BinaryOp("/") },
            { OpCodes.Rem, new BinaryOp("%") },

            // Bitwise
            { OpCodes.And, new BinaryOp("&") },
            { OpCodes.Or, new BinaryOp("|") },
            { OpCodes.Xor, new BinaryOp("^") },
            { OpCodes.Shl, new BinaryOp("<<") },
            { OpCodes.Shr, new BinaryOp(">>") },
            { OpCodes.Shr_Un, new Shr_Un() },
            { OpCodes.Neg, new UnaryOp("-") },
            { OpCodes.Not, new UnaryOp("~") },

            // Comparison
            { OpCodes.Ceq, new CompareOp("==") },
            { OpCodes.Clt, new CompareOp("<") },
            { OpCodes.Clt_Un, new CompareOpUnsigned("<") },
            { OpCodes.Cgt, new CompareOp(">") },
            { OpCodes.Cgt_Un, new CompareOpUnsigned(">") },

            // Branching
            { OpCodes.Br, new Br() },
            { OpCodes.Br_S, new Br() },
            { OpCodes.Beq, new BranchCmp("==") },
            { OpCodes.Beq_S, new BranchCmp("==") },
            { OpCodes.Bne_Un, new BranchCmp("!=") },
            { OpCodes.Bne_Un_S, new BranchCmp("!=") },
            { OpCodes.Blt, new BranchCmp("<") },
            { OpCodes.Blt_S, new BranchCmp("<") },
            { OpCodes.Blt_Un, new BranchCmpUnsigned("<") },
            { OpCodes.Blt_Un_S, new BranchCmpUnsigned("<") },
            { OpCodes.Bge, new BranchCmp(">=") },
            { OpCodes.Bge_S, new BranchCmp(">=") },
            { OpCodes.Bge_Un, new BranchCmpUnsigned(">=") },
            { OpCodes.Bge_Un_S, new BranchCmpUnsigned(">=") },
            { OpCodes.Ble, new BranchCmp("<=") },
            { OpCodes.Ble_S, new BranchCmp("<=") },
            { OpCodes.Ble_Un, new BranchCmpUnsigned("<=") },
            { OpCodes.Ble_Un_S, new BranchCmpUnsigned("<=") },
            { OpCodes.Bgt_Un, new BranchCmpUnsigned(">") },
            { OpCodes.Bgt_Un_S, new BranchCmpUnsigned(">") },

            // Locals
            { OpCodes.Ldloc_0, new Ldloc_N(0) },
            { OpCodes.Ldloc_1, new Ldloc_N(1) },
            { OpCodes.Ldloc_2, new Ldloc_N(2) },
            { OpCodes.Ldloc_3, new Ldloc_N(3) },
            { OpCodes.Ldloc_S, new Ldloc_S() },
            { OpCodes.Ldloc, new Ldloc() },
            { OpCodes.Stloc_0, new Stloc_N(0) },
            { OpCodes.Stloc_1, new Stloc_N(1) },
            { OpCodes.Stloc_2, new Stloc_N(2) },
            { OpCodes.Stloc_3, new Stloc_N(3) },
            { OpCodes.Stloc_S, new Stloc_S() },

            // Arguments
            { OpCodes.Ldarg_0, new Ldarg_0() },

            // Conversions
            { OpCodes.Conv_I4, new Conv("int32_t") },
            { OpCodes.Conv_U1, new Conv("uint8_t") },
            { OpCodes.Conv_I8, new Conv("int32_t") },
            { OpCodes.Conv_R4, new ConvUnsupported("float") },
            { OpCodes.Conv_R8, new ConvUnsupported("double") },

            // Box/Unbox
            { OpCodes.Box, new Box() },
            { OpCodes.Unbox, new Unbox() },
            { OpCodes.Unbox_Any, new Unbox() },

            // Control flow
            { OpCodes.Ret, new Ret() },
            { OpCodes.Pop, new Pop() },
            { OpCodes.Dup, new Dup() },
            { OpCodes.Nop, new Nop() },
            { OpCodes.Leave, new Br() },
            { OpCodes.Leave_S, new Br() },

            // Calls
            { OpCodes.Call, new Call() },
            { OpCodes.Callvirt, new Call() },
            { OpCodes.Newobj, new Newobj() },
        };
    }

    /// <summary>Scan MSIL bytecode to find all branch target offsets</summary>
    public static HashSet<int> FindBranchTargets(byte[] code, MethodMetadata method)
    {
        var targets = new HashSet<int>();
        var iterator = new MsilIterator(code, method);

        while (iterator.MoveNext())
        {
            var opcode = iterator.CurrentOpcode;
            var operand = iterator.CurrentOperand;

            if (operand is int offset)
            {
                if (opcode.OperandType == OperandType.ShortInlineBrTarget)
                {
                    targets.Add(iterator.NextIndex + (sbyte)(offset & 0xFF));
                }
                else if (opcode.OperandType == OperandType.InlineBrTarget)
                {
                    targets.Add(iterator.NextIndex + offset);
                }
            }
        }

        return targets;
    }

    /// <summary>Translate a single MSIL opcode to CC65 C code</summary>
    public void TranslateCurrentOpcode()
    {
        OpCode opcode = _support.Iterator.CurrentOpcode;
        object? operand = _support.Iterator.CurrentOperand;
        int currentOffset = _support.Iterator.CurrentIndex;

        // Emit label only if this offset is a branch target
        if (_branchTargets.Contains(currentOffset))
        {
            _support.AsmWriter.WriteLine($"  IL_{currentOffset:X4}:");
        }

        if (Program.CodeOptions?.Verbosity >= 2)
        {
            string opInfo = operand != null ? $"{opcode.Name} ({operand})" : opcode.Name;
            Console.WriteLine($"[CC65 OPCODE] {currentOffset:X4}: {opInfo}");
        }

        _support.EmitComment($"IL_{currentOffset:X4}: {opcode.Name}");

        if (_opCodes.TryGetValue(opcode, out var handler))
        {
            handler.Translate(operand, _support);
        }
        else
        {
            _support.Emit($"/* TODO: Unimplemented opcode {opcode.Name} */");

            string opName = opcode.Name.ToLower();
            if (opName.StartsWith("ld") && !opName.Contains("st"))
            {
                string temp = _support.Stack.AllocateDataRegister();
                _support.Emit($"{temp} = 0; /* placeholder */");
                _support.Stack.Push(temp);
            }
            else if (opName.StartsWith("st"))
            {
                if (_support.Stack.StackDepth > 0) _support.Stack.Pop();
            }
        }
    }
}
