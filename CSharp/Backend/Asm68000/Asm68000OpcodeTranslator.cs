using System.Reflection.Emit;
using JumpCS.Backend.Asm68000.Opcodes;
using JumpCS.Backend.Interfaces;
using JumpCS.Core;

namespace JumpCS.Backend.Asm68000
{
    public class Asm68000OpcodeTranslator
    {
        private readonly Dictionary<OpCode, IOpcodeTranslation> opCodes;
        private readonly Asm68000Support _support;
        private readonly HashSet<int> _branchTargets;

        public Asm68000OpcodeTranslator(Asm68000Support support, HashSet<int>? branchTargets = null)
        {
            _support = support;
            _branchTargets = branchTargets ?? new HashSet<int>();

            opCodes = new Dictionary<OpCode, IOpcodeTranslation>()
            {
                { OpCodes.Ldc_I4_0, new Ldc_I4_0() },
                { OpCodes.Ldc_I4_1, new Ldc_I4_1() },
                { OpCodes.Ldc_I4_2, new Ldc_I4_2() },
                { OpCodes.Ldc_I4_3, new Ldc_I4_3() },
                { OpCodes.Ldc_I4_4, new Ldc_I4_4() },
                { OpCodes.Ldc_I4_5, new Ldc_I4_5() },
                { OpCodes.Ldc_I4_6, new Ldc_I4_6() },
                { OpCodes.Ldc_I4_7, new Ldc_I4_7() },
                { OpCodes.Ldc_I4_8, new Ldc_I4_8() },
                { OpCodes.Ldc_I4_M1, new Ldc_I4_M1() },
                { OpCodes.Ldc_I4, new Ldc_I4() },
                { OpCodes.Ldc_I4_S, new Ldc_I4_S() },
                { OpCodes.Ldc_I8, new Ldc_I8() },
                { OpCodes.Ldc_R8, new Ldc_R8() },
                { OpCodes.Ldc_R4, new Ldc_R4() },
                { OpCodes.Add, new Add() },
                { OpCodes.Sub, new Sub() },
                { OpCodes.Mul, new Mul() },
                { OpCodes.Div, new Div() },
                { OpCodes.Rem, new Rem() },
                { OpCodes.Box, new Box() },
                { OpCodes.Unbox, new Unbox() },
                { OpCodes.Unbox_Any, new Unbox_Any() },
                { OpCodes.Ceq, new Ceq() },
                { OpCodes.Clt, new Clt() },
                { OpCodes.Clt_Un, new Clt_Un() },
                { OpCodes.Cgt, new Cgt() },
                { OpCodes.Cgt_Un, new Cgt_Un() },
                { OpCodes.And, new And() },
                { OpCodes.Or, new Or() },
                { OpCodes.Xor, new Xor() },
                { OpCodes.Shl, new Shl() },
                { OpCodes.Shr, new Shr() },
                { OpCodes.Shr_Un, new Shr_Un() },
                { OpCodes.Neg, new Neg() },
                { OpCodes.Not, new Not() },
                { OpCodes.Bne_Un, new Bne_Un() },
                { OpCodes.Bne_Un_S, new Bne_Un_S() },
                { OpCodes.Blt, new Blt() },
                { OpCodes.Blt_S, new Blt_S() },
                { OpCodes.Blt_Un, new Blt_Un() },
                { OpCodes.Blt_Un_S, new Blt_Un_S() },
                { OpCodes.Br, new Br() },
                { OpCodes.Br_S, new Br_S() },
                { OpCodes.Beq, new Beq() },
                { OpCodes.Beq_S, new Beq_S() },
                { OpCodes.Bge, new Bge() },
                { OpCodes.Bge_S, new Bge_S() },
                { OpCodes.Bge_Un, new Bge_Un() },
                { OpCodes.Bge_Un_S, new Bge_Un_S() },
                { OpCodes.Ble, new Ble() },
                { OpCodes.Ble_S, new Ble_S() },
                { OpCodes.Ble_Un, new Ble_Un() },
                { OpCodes.Ble_Un_S, new Ble_Un_S() },
                { OpCodes.Bgt_Un, new Bgt_Un() },
                { OpCodes.Bgt_Un_S, new Bgt_Un_S() },
                { OpCodes.Call, new Call() },
                { OpCodes.Callvirt, new Callvirt() },
                { OpCodes.Ldarg_0, new Ldarg_0() },
                { OpCodes.Ldarg_1, new Ldarg_1() },  // ← NEW
                { OpCodes.Ldarg_2, new Ldarg_2() },  // ← NEW
                { OpCodes.Ldarg_3, new Ldarg_3() },  // ← NEW
                { OpCodes.Ldarg, new Ldarg() },      // ← NEW
                { OpCodes.Ldstr, new Ldstr() },      // ← NEW
                { OpCodes.Newobj, new Newobj() },
                { OpCodes.Ret, new Ret() },
                { OpCodes.Pop, new Pop() },
                { OpCodes.Dup, new Dup() },
                { OpCodes.Leave, new Leave() },
                { OpCodes.Leave_S, new Leave_S() },
                { OpCodes.Nop, new Nop() },
                { OpCodes.Conv_I4, new Conv_I4() },
                { OpCodes.Conv_R4, new Conv_R4() },
                { OpCodes.Conv_R8, new Conv_R8() },
                { OpCodes.Conv_I8, new Conv_I8() },
                { OpCodes.Conv_U1, new Conv_U1() },
                { OpCodes.Ldloc_0, new Ldloc_0() },
                { OpCodes.Ldloc_1, new Ldloc_1() },
                { OpCodes.Ldloc_2, new Ldloc_2() },
                { OpCodes.Ldloc_3, new Ldloc_3() },
                { OpCodes.Ldloc_S, new Ldloc_S() },
                { OpCodes.Ldloc, new Ldloc() },
                { OpCodes.Ldloca_S, new Ldloca_S() },
                { OpCodes.Ldsfld, new Ldsfld() },
                { OpCodes.Stloc_0, new Stloc_0() },
                { OpCodes.Stloc_1, new Stloc_1() },
                { OpCodes.Stloc_2, new Stloc_2() },
                { OpCodes.Stloc_3, new Stloc_3() },
                { OpCodes.Stloc_S, new Stloc_S() },
                { OpCodes.Brfalse, new Brfalse() },
                { OpCodes.Brfalse_S, new Brfalse_S() },
                { OpCodes.Ldfld, new Ldfld() },
                { OpCodes.Endfinally, new Endfinally() }
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

        /// <summary>Translate a single MSIL opcode to 68000 assembly</summary>
        public void TranslateCurrentOpcode()
        {
            try
            {
                OpCode opcode = _support.Iterator.CurrentOpcode;
                object? operand = _support.Iterator.CurrentOperand;
                int currentOffset = _support.Iterator.CurrentIndex;

                // Emit label only if this offset is a branch target
                if (_branchTargets.Contains(currentOffset))
                {
                    _support.AsmWriter.WriteLine($"L_{currentOffset:X4}:");
                }

                // Add diagnostic output for problematic instructions
                if (Program.CodeOptions?.Verbosity >= 2)
                {
                    string opInfo = $"{opcode.Name}";
                    if (operand != null)
                        opInfo += $" ({operand})";

                    Console.WriteLine($"[OPCODE] {currentOffset:X4}: {opInfo}");
                }

                _support.AsmWriter.WriteLine($"    ; Offset {currentOffset:X4}: {opcode.Name}");

                if (opCodes.ContainsKey(opcode))
                {
                    opCodes[opcode].Translate(operand, _support);
                }
                else
                {
                    HandleUnimplementedOpcode(opcode);
                }
            }
            catch (Exception ex)
            {
                // Log exception but continue generation
                int currentOffset = _support.Iterator.CurrentIndex;
                string opcodeName = _support.Iterator.CurrentOpcode.Name;
                _support.AsmWriter.WriteLine($"    ; ERROR: Exception processing {opcodeName} at offset {currentOffset:X4}");
                _support.AsmWriter.WriteLine($"    ; {ex.Message}");
                Console.Error.WriteLine($"[ERROR] {opcodeName} at {currentOffset:X4}: {ex.Message}");
                if (Program.CodeOptions?.Verbosity > 1)
                    Console.Error.WriteLine(ex.StackTrace);
            }
        }

        private void HandleUnimplementedOpcode(OpCode opcode)
        {
            _support.AsmWriter.WriteLine($"    ; TODO: Unimplemented opcode {opcode.Name}");

            // Attempt to infer stack effects for common opcode patterns
            // This helps maintain stack balance when opcodes are not yet implemented
            string opName = opcode.Name?.ToLower() ?? "unk";

            try
            {
                // Load opcodes typically push a value
                if (opName.StartsWith("ld") && !opName.Contains("st"))
                {
                    string reg = _support.Stack.AllocateDataRegister();
                    _support.AsmWriter.WriteLine($"    CLR.L {reg}  ; TODO: Placeholder value");
                    _support.Stack.Push(reg);
                }
                // Store opcodes typically pop a value
                else if (opName.StartsWith("st"))
                {
                    if (_support.Stack.StackDepth > 0)
                    {
                        _support.Stack.Pop();
                    }
                }
                // Call-like opcodes pop parameters and may push a return value
                else if (opName.Contains("call") || opName.Contains("new"))
                {
                    // Pop parameters (conservative estimate)
                    while (_support.Stack.StackDepth > 0)
                    {
                        try { _support.Stack.Pop(); }
                        catch { break; }
                    }
                    // May push return value (conservative)
                }
            }
            catch (Exception ex)
            {
                _support.AsmWriter.WriteLine($"    ; Exception inferring stack effects: {ex.Message}");
            }
        }
    }
}
