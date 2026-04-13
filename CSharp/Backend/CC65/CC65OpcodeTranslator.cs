using System.Reflection.Emit;
using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65;

public class CC65OpcodeTranslator
{
    private readonly Dictionary<OpCode, IOpcodeTranslation> _opCodes;
    private readonly CC65Support _support;

    public CC65OpcodeTranslator(CC65Support support)
    {
        _support = support;

        _opCodes = new Dictionary<OpCode, IOpcodeTranslation>()
        {
            // Constants
            { OpCodes.Ldc_I4_0, new Opcodes.Ldc_I4_N(0) },
            { OpCodes.Ldc_I4_1, new Opcodes.Ldc_I4_N(1) },
            { OpCodes.Ldc_I4_2, new Opcodes.Ldc_I4_N(2) },
            { OpCodes.Ldc_I4_3, new Opcodes.Ldc_I4_N(3) },
            { OpCodes.Ldc_I4_4, new Opcodes.Ldc_I4_N(4) },
            { OpCodes.Ldc_I4_5, new Opcodes.Ldc_I4_N(5) },
            { OpCodes.Ldc_I4_6, new Opcodes.Ldc_I4_N(6) },
            { OpCodes.Ldc_I4_7, new Opcodes.Ldc_I4_N(7) },
            { OpCodes.Ldc_I4_8, new Opcodes.Ldc_I4_N(8) },
            { OpCodes.Ldc_I4_M1, new Opcodes.Ldc_I4_N(-1) },
            { OpCodes.Ldc_I4, new Opcodes.Ldc_I4() },
            { OpCodes.Ldc_I4_S, new Opcodes.Ldc_I4_S() },

            // Arithmetic
            { OpCodes.Add, new Opcodes.BinaryOp("+") },
            { OpCodes.Sub, new Opcodes.BinaryOp("-") },
            { OpCodes.Mul, new Opcodes.BinaryOp("*") },
            { OpCodes.Div, new Opcodes.BinaryOp("/") },
            { OpCodes.Rem, new Opcodes.BinaryOp("%") },

            // Bitwise
            { OpCodes.And, new Opcodes.BinaryOp("&") },
            { OpCodes.Or, new Opcodes.BinaryOp("|") },
            { OpCodes.Xor, new Opcodes.BinaryOp("^") },
            { OpCodes.Shl, new Opcodes.BinaryOp("<<") },
            { OpCodes.Shr, new Opcodes.BinaryOp(">>") },
            { OpCodes.Shr_Un, new Opcodes.Shr_Un() },
            { OpCodes.Neg, new Opcodes.UnaryOp("-") },
            { OpCodes.Not, new Opcodes.UnaryOp("~") },

            // Comparison
            { OpCodes.Ceq, new Opcodes.CompareOp("==") },
            { OpCodes.Clt, new Opcodes.CompareOp("<") },
            { OpCodes.Clt_Un, new Opcodes.CompareOpUnsigned("<") },
            { OpCodes.Cgt, new Opcodes.CompareOp(">") },
            { OpCodes.Cgt_Un, new Opcodes.CompareOpUnsigned(">") },

            // Branching
            { OpCodes.Br, new Opcodes.Br() },
            { OpCodes.Br_S, new Opcodes.Br() },
            { OpCodes.Beq, new Opcodes.BranchCmp("==") },
            { OpCodes.Beq_S, new Opcodes.BranchCmp("==") },
            { OpCodes.Bne_Un, new Opcodes.BranchCmp("!=") },
            { OpCodes.Bne_Un_S, new Opcodes.BranchCmp("!=") },
            { OpCodes.Blt, new Opcodes.BranchCmp("<") },
            { OpCodes.Blt_S, new Opcodes.BranchCmp("<") },
            { OpCodes.Blt_Un, new Opcodes.BranchCmpUnsigned("<") },
            { OpCodes.Blt_Un_S, new Opcodes.BranchCmpUnsigned("<") },
            { OpCodes.Bge, new Opcodes.BranchCmp(">=") },
            { OpCodes.Bge_S, new Opcodes.BranchCmp(">=") },
            { OpCodes.Bge_Un, new Opcodes.BranchCmpUnsigned(">=") },
            { OpCodes.Bge_Un_S, new Opcodes.BranchCmpUnsigned(">=") },
            { OpCodes.Ble, new Opcodes.BranchCmp("<=") },
            { OpCodes.Ble_S, new Opcodes.BranchCmp("<=") },
            { OpCodes.Ble_Un, new Opcodes.BranchCmpUnsigned("<=") },
            { OpCodes.Ble_Un_S, new Opcodes.BranchCmpUnsigned("<=") },
            { OpCodes.Bgt_Un, new Opcodes.BranchCmpUnsigned(">") },
            { OpCodes.Bgt_Un_S, new Opcodes.BranchCmpUnsigned(">") },

            // Locals
            { OpCodes.Ldloc_0, new Opcodes.Ldloc_N(0) },
            { OpCodes.Ldloc_1, new Opcodes.Ldloc_N(1) },
            { OpCodes.Ldloc_2, new Opcodes.Ldloc_N(2) },
            { OpCodes.Ldloc_3, new Opcodes.Ldloc_N(3) },
            { OpCodes.Ldloc_S, new Opcodes.Ldloc_S() },
            { OpCodes.Ldloc, new Opcodes.Ldloc() },
            { OpCodes.Stloc_0, new Opcodes.Stloc_N(0) },
            { OpCodes.Stloc_1, new Opcodes.Stloc_N(1) },
            { OpCodes.Stloc_2, new Opcodes.Stloc_N(2) },
            { OpCodes.Stloc_3, new Opcodes.Stloc_N(3) },
            { OpCodes.Stloc_S, new Opcodes.Stloc_S() },

            // Arguments
            { OpCodes.Ldarg_0, new Opcodes.Ldarg_0() },

            // Conversions
            { OpCodes.Conv_I4, new Opcodes.Conv("int32_t") },
            { OpCodes.Conv_U1, new Opcodes.Conv("uint8_t") },
            { OpCodes.Conv_I8, new Opcodes.Conv("int32_t") },
            { OpCodes.Conv_R4, new Opcodes.ConvUnsupported("float") },
            { OpCodes.Conv_R8, new Opcodes.ConvUnsupported("double") },

            // Box/Unbox
            { OpCodes.Box, new Opcodes.Box() },
            { OpCodes.Unbox, new Opcodes.Unbox() },
            { OpCodes.Unbox_Any, new Opcodes.Unbox() },

            // Control flow
            { OpCodes.Ret, new Opcodes.Ret() },
            { OpCodes.Pop, new Opcodes.Pop() },
            { OpCodes.Dup, new Opcodes.Dup() },
            { OpCodes.Nop, new Opcodes.Nop() },
            { OpCodes.Leave, new Opcodes.Br() },
            { OpCodes.Leave_S, new Opcodes.Br() },

            // Calls
            { OpCodes.Call, new Opcodes.Call() },
            { OpCodes.Callvirt, new Opcodes.Call() },
            { OpCodes.Newobj, new Opcodes.Newobj() },
        };
    }

    public void TranslateCurrentOpcode()
    {
        OpCode opcode = _support.Iterator.CurrentOpcode;
        object? operand = _support.Iterator.CurrentOperand;

        if (Program.CodeOptions?.Verbosity >= 2)
        {
            string opInfo = operand != null ? $"{opcode.Name} ({operand})" : opcode.Name;
            Console.WriteLine($"[CC65 OPCODE] {_support.Iterator.CurrentIndex:X4}: {opInfo}");
        }

        _support.EmitComment($"IL_{_support.Iterator.CurrentIndex:X4}: {opcode.Name}");

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
                _support.Emit($"{CC65TypeMapper.StackType} {temp} = 0; /* placeholder */");
                _support.Stack.Push(temp);
            }
            else if (opName.StartsWith("st"))
            {
                if (_support.Stack.StackDepth > 0) _support.Stack.Pop();
            }
        }
    }
}
