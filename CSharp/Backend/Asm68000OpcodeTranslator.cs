using CSharp.Backend.Asm68000Opcodes;
using JumpCS;
using JumpCS.Backend;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;
using System.Collections;
using System.Reflection;
using System.Reflection.Emit;

namespace CSharp.Backend
{
    public class Asm68000OpcodeTranslator
    {
        private Dictionary<OpCode, IOpcodeTranslation> opCodes;
        private Asm68000StackSimulator _stack;
        private StreamWriter _asmWriter;
        private MsilIterator _iterator;
        private MethodMetadata _method;
        private LabelMapper _labels;

        private SystemDecimalHandler _decimalHandler;
        private SystemMathHandler _mathHandler;
        private SystemDoubleHandler _doubleHandler;
        private SystemFloatHandler _floatHandler;
        private SystemIntegerHandler _integerHandler;

        public Asm68000OpcodeTranslator(MsilIterator iterator, MethodMetadata method, Asm68000StackSimulator stack, LabelMapper labels, StreamWriter asmWriter)
        {
            _iterator = iterator;
            _method = method;
            _stack = stack;
            _labels = labels;
            _asmWriter = asmWriter;

            _mathHandler = new SystemMathHandler(
                _asmWriter,
                (stack) => stack.AllocateDataRegister()
            );

            _decimalHandler = new SystemDecimalHandler(
                _asmWriter,
                (stack) => stack.AllocateDataRegister(),
                () => _labels.GetUniqueLabel()
            );

            _doubleHandler = new SystemDoubleHandler(
                _asmWriter,
                (stack) => stack.AllocateDataRegister(),
                () => _labels.GetUniqueLabel()
            );

            _floatHandler = new SystemFloatHandler(
                _asmWriter,
                (stack) => stack.AllocateDataRegister(),
                () => _labels.GetUniqueLabel()
            );

            _integerHandler = new SystemIntegerHandler(
                _asmWriter,
                (stack) => stack.AllocateDataRegister(),
                () => _labels.GetUniqueLabel()
            );

            opCodes = new Dictionary<OpCode, IOpcodeTranslation>()
            {
                { OpCodes.Ldc_I4_0, new Ldc_I4_0() },
/*
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
                { OpCodes.Stloc_S, new Stloc_S() }
*/
            };
        }

        /// <summary>Translate a single MSIL opcode to 68000 assembly</summary>
        public void TranslateCurrentOpcode()
        {
            OpCode opcode = _iterator.CurrentOpcode;
            object? operand = _iterator.CurrentOperand;

            // Add diagnostic output for problematic instructions
            if (Program.CodeOptions?.Verbosity >= 2)
            {
                string opInfo = $"{opcode.Name}";
                if (operand != null)
                    opInfo += $" ({operand})";

                Console.WriteLine($"[OPCODE] {_iterator.CurrentIndex:X4}: {opInfo}");
            }

            _asmWriter.WriteLine($"    ; Offset {_iterator.CurrentIndex:X4}: {opcode.Name}");

            if (opCodes.ContainsKey(opcode))
            {
                opCodes[opcode].Translate(operand, _stack, _asmWriter);
            }

            _asmWriter.WriteLine();

            if (opcode == OpCodes.Ldc_I4_0)
            {
                string targetReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    CLR.L {targetReg}             ; Load 0");
                _stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_1)
            {
                string targetReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    MOVE.L #1,{targetReg}         ; Load 1");
                _stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_2)
            {
                string targetReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    MOVE.L #2,{targetReg}         ; Load 2");
                _stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_3)
            {
                string targetReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    MOVE.L #3,{targetReg}         ; Load 3");
                _stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_4)
            {
                string targetReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    MOVE.L #4,{targetReg}         ; Load 4");
                _stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_5)
            {
                string targetReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    MOVE.L #5,{targetReg}         ; Load 5");
                _stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_6)
            {
                string targetReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    MOVE.L #6,{targetReg}         ; Load 6");
                _stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_7)
            {
                string targetReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    MOVE.L #7,{targetReg}         ; Load 7");
                _stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_8)
            {
                string targetReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    MOVE.L #8,{targetReg}         ; Load 8");
                _stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_M1)
            {
                string targetReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    MOVE.L #-1,{targetReg}        ; Load -1");
                _stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4)
            {
                if (operand is int intVal)
                {
                    string targetReg = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    MOVE.L #{intVal},{targetReg}  ; Load constant");
                    _stack.Push(targetReg);
                }
            }
            else if (opcode == OpCodes.Ldc_I4_S)
            {
                if (operand is int shortIntVal)
                {
                    string targetReg = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    MOVE.L #{shortIntVal},{targetReg}  ; Load short constant");
                    _stack.Push(targetReg);
                }
            }
            else if (opcode == OpCodes.Ldc_I8)
            {
                if (operand is long longVal)
                {
                    string targetReg1 = _stack.AllocateDataRegister();
                    string targetReg2 = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    MOVE.L #{(int)(longVal >> 32)},{targetReg1}     ; Load high word");
                    _asmWriter.WriteLine($"    MOVE.L #{(int)(longVal & 0xFFFFFFFF)},{targetReg2}    ; Load low word");
                    _stack.Push(targetReg1);
                    _stack.Push(targetReg2);
                }
            }
            else if (opcode == OpCodes.Ldc_R8)
            {
                if (operand is double dVal)
                {
                    int constantIndex = _iterator.CurrentIndex;
                    _doubleConstants[constantIndex] = dVal;
                    string addrReg = _stack.AllocateAddressRegister();
                    string targetReg1 = _stack.AllocateDataRegister();
                    string targetReg2 = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    LEA DOUBLE_CONST_{constantIndex:X4}(PC),{addrReg}");
                    _asmWriter.WriteLine($"    MOVE.L ({addrReg}),{targetReg1}     ; Double high word");
                    _asmWriter.WriteLine($"    MOVE.L 4({addrReg}),{targetReg2}    ; Double low word");
                    _stack.ReleaseAddressRegister(addrReg);
                    _stack.Push(targetReg1, isDoubleWord: true);
                    _stack.Push(targetReg2, isDoubleWord: true);
                }
            }
            else if (opcode == OpCodes.Ldc_R4)
            {
                float fVal = 0f;
                bool handled = false;

                // ldc.r4 operand is a 32-bit float
                if (operand is float f)
                {
                    fVal = f;
                    handled = true;
                }
                else if (operand is double d)
                {
                    // Fallback: if somehow we get a double, convert it
                    fVal = (float)d;
                    handled = true;
                }
                else if (operand is int intBits)
                {
                    // Raw int bits interpretation
                    fVal = BitConverter.Int32BitsToSingle(intBits);
                    handled = true;
                }

                if (handled)
                {
                    int constantIndex = _iterator.CurrentIndex;
                    _floatConstants[constantIndex] = fVal;
                    string targetReg = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    LEA FLOAT_CONST_{constantIndex:X4}(PC),A0");
                    _asmWriter.WriteLine($"    MOVE.L (A0),{targetReg}");
                    _stack.Push(targetReg);
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: ldc.r4 operand type: {operand?.GetType().Name ?? "null"} value: {operand}");
                    string targetReg = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    CLR.L {targetReg}  ; TODO: Load float constant");
                    _stack.Push(targetReg);
                }
            }
            else if (opcode == OpCodes.Add)
            {
                if (_stack.StackDepth >= 4)
                {
                    // Double addition - delegate to handler for IEEE 754 library call
                    _doubleHandler?.HandleAddition(_stack);
                }
                else
                {
                    // Integer addition
                    string right = _stack.Pop();
                    string left = _stack.Pop();

                    string resultReg = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    MOVE.L {left},{resultReg}");
                    _asmWriter.WriteLine($"    ADD.L {right},{resultReg}");
                    _stack.ReleaseDataRegister(left);
                    _stack.ReleaseDataRegister(right);
                    _stack.Push(resultReg);
                }
            }
            else if (opcode == OpCodes.Sub)
            {
                if (_stack.StackDepth >= 4)
                {
                    // Double subtraction - delegate to handler for IEEE 754 library call
                    _doubleHandler?.HandleSubtraction(_stack);
                }
                else
                {
                    // Integer subtraction
                    string right = _stack.Pop();
                    string left = _stack.Pop();

                    string resultReg = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    MOVE.L {left},{resultReg}");
                    _asmWriter.WriteLine($"    SUB.L {right},{resultReg}");
                    _stack.ReleaseDataRegister(left);
                    _stack.ReleaseDataRegister(right);
                    _stack.Push(resultReg);
                }
            }
            else if (opcode == OpCodes.Mul)
            {
                if (_stack.StackDepth >= 4)
                {
                    // Double multiplication - delegate to handler for IEEE 754 library call
                    _doubleHandler?.HandleMultiply(_stack);
                }
                else
                {
                    // Integer multiplication
                    string right = _stack.Pop();
                    string left = _stack.Pop();

                    string resultReg = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    MOVE.L {left},{resultReg}");
                    _asmWriter.WriteLine($"    MULS.L {right},{resultReg}");
                    _stack.ReleaseDataRegister(left);
                    _stack.ReleaseDataRegister(right);
                    _stack.Push(resultReg);
                }
            }
            else if (opcode == OpCodes.Div)
            {
                if (_stack.StackDepth >= 4)
                {
                    // Double division - delegate to handler for IEEE 754 library call
                    _doubleHandler?.HandleDivision(_stack);
                }
                else
                {
                    // Integer division
                    string right = _stack.Pop();
                    string left = _stack.Pop();

                    string resultReg = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    MOVE.L {left},{resultReg}");
                    _asmWriter.WriteLine($"    DIVS.L {right},{resultReg}");
                    _stack.ReleaseDataRegister(left);
                    _stack.ReleaseDataRegister(right);
                    _stack.Push(resultReg);
                }
            }
            else if (opcode == OpCodes.Rem)
            {
                if (_stack.StackDepth >= 4)
                {
                    // Double remainder - delegate to handler for IEEE 754 library call
                    _doubleHandler?.HandleRemainder(_stack);
                }
                else
                {
                    // Integer remainder
                    string right = _stack.Pop();
                    string left = _stack.Pop();

                    _asmWriter.WriteLine($"    MOVE.L {left},D0");
                    _asmWriter.WriteLine($"    DIVS.L {right},D0");
                    string resultReg = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    MOVE.L D1,{resultReg}  ; Remainder from division");
                    _stack.ReleaseDataRegister(left);
                    _stack.ReleaseDataRegister(right);
                    _stack.Push(resultReg);
                }
            }
            else if (opcode == OpCodes.Box)
            {
                if (operand is int typeToken)
                {
                    string valueReg = _stack.Pop();
                    _asmWriter.WriteLine($"    ; Box type token {typeToken:X8}");
                    _asmWriter.WriteLine($"    MOVE.L {valueReg},D0     ; Boxed value");
                    _stack.ReleaseDataRegister(valueReg);
                    _stack.Push("D0");
                }
            }
            else if (opcode == OpCodes.Unbox)
            {
                string objRef = _stack.Pop();
                _asmWriter.WriteLine($"    ; Unbox");
                _asmWriter.WriteLine($"    MOVE.L {objRef},D0     ; Unboxed value");
                _stack.ReleaseDataRegister(objRef);
                _stack.Push("D0");
            }
            else if (opcode == OpCodes.Unbox_Any)
            {
                if (operand is int typeToken)
                {
                    string objRef = _stack.Pop();
                    _asmWriter.WriteLine($"    ; Unbox.Any type token {typeToken:X8}");
                    _asmWriter.WriteLine($"    MOVE.L {objRef},D0     ; Unboxed value");
                    _stack.ReleaseDataRegister(objRef);
                    _stack.Push("D0");
                }
            }
            else if (opcode == OpCodes.Ceq)
            {
                if (_stack.StackDepth >= 4 && _stack.IsTopDoubleWord)
                {
                    string right_lo = _stack.Pop();
                    string right_hi = _stack.Pop();
                    string left_lo = _stack.Pop();
                    string left_hi = _stack.Pop();
                    _asmWriter.WriteLine($"    MOVE.L {left_hi},D0");
                    _asmWriter.WriteLine($"    MOVE.L {left_lo},D1");
                    _asmWriter.WriteLine($"    MOVE.L {right_hi},D2");
                    _asmWriter.WriteLine($"    MOVE.L {right_lo},D3");
                    _asmWriter.WriteLine($"    JSR __eqdf2           ; IEEE 754 double equality");
                    _stack.ReleaseDataRegister(left_hi);
                    _stack.ReleaseDataRegister(left_lo);
                    _stack.ReleaseDataRegister(right_hi);
                    _stack.ReleaseDataRegister(right_lo);
                    _stack.Push("D0");
                }
                else
                {
                    string right = _stack.Pop();
                    string left = _stack.Pop();

                    string resultReg = _stack.AllocateDataRegister();
                    string label = _labels.GetUniqueLabel();
                    _asmWriter.WriteLine($"    CMP.L {right},{left}");
                    _asmWriter.WriteLine($"    BEQ {label}_eq");
                    _asmWriter.WriteLine($"    CLR.L {resultReg}");
                    _asmWriter.WriteLine($"    BRA {label}_end");
                    _asmWriter.WriteLine($"{label}_eq:");
                    _asmWriter.WriteLine($"    MOVE.L #1,{resultReg}");
                    _asmWriter.WriteLine($"{label}_end:");
                    _stack.ReleaseDataRegister(left);
                    _stack.ReleaseDataRegister(right);
                    _stack.Push(resultReg);
                }
            }
            else if (opcode == OpCodes.Clt || opcode == OpCodes.Clt_Un)
            {
                if (_stack.StackDepth >= 4 && _stack.IsTopDoubleWord)
                {
                    string right_lo = _stack.Pop();
                    string right_hi = _stack.Pop();
                    string left_lo = _stack.Pop();
                    string left_hi = _stack.Pop();
                    _asmWriter.WriteLine($"    MOVE.L {left_hi},D0");
                    _asmWriter.WriteLine($"    MOVE.L {left_lo},D1");
                    _asmWriter.WriteLine($"    MOVE.L {right_hi},D2");
                    _asmWriter.WriteLine($"    MOVE.L {right_lo},D3");
                    _asmWriter.WriteLine($"    JSR __ltdf2           ; IEEE 754 double less-than");
                    _stack.ReleaseDataRegister(left_hi);
                    _stack.ReleaseDataRegister(left_lo);
                    _stack.ReleaseDataRegister(right_hi);
                    _stack.ReleaseDataRegister(right_lo);
                    _stack.Push("D0");
                }
                else
                {
                    string right = _stack.Pop();
                    string left = _stack.Pop();

                    string resultReg = _stack.AllocateDataRegister();
                    string label = _labels.GetUniqueLabel();
                    _asmWriter.WriteLine($"    CMP.L {right},{left}");
                    _asmWriter.WriteLine($"    BLT {label}_lt");
                    _asmWriter.WriteLine($"    CLR.L {resultReg}");
                    _asmWriter.WriteLine($"    BRA {label}_end");
                    _asmWriter.WriteLine($"{label}_lt:");
                    _asmWriter.WriteLine($"    MOVE.L #1,{resultReg}");
                    _asmWriter.WriteLine($"{label}_end:");
                    _stack.ReleaseDataRegister(left);
                    _stack.ReleaseDataRegister(right);
                    _stack.Push(resultReg);
                }
            }
            else if (opcode == OpCodes.Cgt || opcode == OpCodes.Cgt_Un)
            {
                if (_stack.StackDepth >= 4 && _stack.IsTopDoubleWord)
                {
                    string right_lo = _stack.Pop();
                    string right_hi = _stack.Pop();
                    string left_lo = _stack.Pop();
                    string left_hi = _stack.Pop();
                    _asmWriter.WriteLine($"    MOVE.L {left_hi},D0");
                    _asmWriter.WriteLine($"    MOVE.L {left_lo},D1");
                    _asmWriter.WriteLine($"    MOVE.L {right_hi},D2");
                    _asmWriter.WriteLine($"    MOVE.L {right_lo},D3");
                    _asmWriter.WriteLine($"    JSR __gtdf2           ; IEEE 754 double greater-than");
                    _stack.ReleaseDataRegister(left_hi);
                    _stack.ReleaseDataRegister(left_lo);
                    _stack.ReleaseDataRegister(right_hi);
                    _stack.ReleaseDataRegister(right_lo);
                    _stack.Push("D0");
                }
                else
                {
                    string right = _stack.Pop();
                    string left = _stack.Pop();

                    string resultReg = _stack.AllocateDataRegister();
                    string label = _labels.GetUniqueLabel();
                    _asmWriter.WriteLine($"    CMP.L {right},{left}");
                    _asmWriter.WriteLine($"    BGT {label}_gt");
                    _asmWriter.WriteLine($"    CLR.L {resultReg}");
                    _asmWriter.WriteLine($"    BRA {label}_end");
                    _asmWriter.WriteLine($"{label}_gt:");
                    _asmWriter.WriteLine($"    MOVE.L #1,{resultReg}");
                    _asmWriter.WriteLine($"{label}_end:");
                    _stack.ReleaseDataRegister(left);
                    _stack.ReleaseDataRegister(right);
                    _stack.Push(resultReg);
                }
            }
            else if (opcode == OpCodes.And)
            {
                string right = _stack.Pop();
                string left = _stack.Pop();

                string resultReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    MOVE.L {left},{resultReg}");
                _asmWriter.WriteLine($"    AND.L {right},{resultReg}");
                _stack.ReleaseDataRegister(left);
                _stack.ReleaseDataRegister(right);
                _stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Or)
            {
                string right = _stack.Pop();
                string left = _stack.Pop();

                string resultReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    MOVE.L {left},{resultReg}");
                _asmWriter.WriteLine($"    OR.L {right},{resultReg}");
                _stack.ReleaseDataRegister(left);
                _stack.ReleaseDataRegister(right);
                _stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Xor)
            {
                string right = _stack.Pop();
                string left = _stack.Pop();

                string resultReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    MOVE.L {left},{resultReg}");
                _asmWriter.WriteLine($"    EOR.L {right},{resultReg}");
                _stack.ReleaseDataRegister(left);
                _stack.ReleaseDataRegister(right);
                _stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Shl)
            {
                string shiftAmount = _stack.Pop();
                string value = _stack.Pop();

                string resultReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    MOVE.L {value},{resultReg}");
                _asmWriter.WriteLine($"    MOVE.L {shiftAmount},D0");
                _asmWriter.WriteLine($"    ASL.L D0,{resultReg}  ; Shift left");
                _stack.ReleaseDataRegister(value);
                _stack.ReleaseDataRegister(shiftAmount);
                _stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Shr)
            {
                string shiftAmount = _stack.Pop();
                string value = _stack.Pop();

                string resultReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    MOVE.L {value},{resultReg}");
                _asmWriter.WriteLine($"    MOVE.L {shiftAmount},D0");
                _asmWriter.WriteLine($"    ASR.L D0,{resultReg}  ; Shift right (arithmetic)");
                _stack.ReleaseDataRegister(value);
                _stack.ReleaseDataRegister(shiftAmount);
                _stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Shr_Un)
            {
                string shiftAmount = _stack.Pop();
                string value = _stack.Pop();

                string resultReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    MOVE.L {value},{resultReg}");
                _asmWriter.WriteLine($"    MOVE.L {shiftAmount},D0");
                _asmWriter.WriteLine($"    LSR.L D0,{resultReg}  ; Shift right (logical/unsigned)");
                _stack.ReleaseDataRegister(value);
                _stack.ReleaseDataRegister(shiftAmount);
                _stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Neg)
            {
                string value = _stack.Pop();

                string resultReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    CLR.L {resultReg}");
                _asmWriter.WriteLine($"    SUB.L {value},{resultReg}");
                _stack.ReleaseDataRegister(value);
                _stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Not)
            {
                string value = _stack.Pop();

                string resultReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    MOVE.L {value},{resultReg}");
                _asmWriter.WriteLine($"    NOT.L {resultReg}");
                _stack.ReleaseDataRegister(value);
                _stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Bne_Un || opcode == OpCodes.Bne_Un_S)
            {
                if (_stack.StackDepth >= 4 && _stack.IsTopDoubleWord)
                {
                    string val2_lo = _stack.Pop();
                    string val2_hi = _stack.Pop();
                    string val1_lo = _stack.Pop();
                    string val1_hi = _stack.Pop();
                    string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter.WriteLine($"    MOVE.L {val1_hi},D0");
                    _asmWriter.WriteLine($"    MOVE.L {val1_lo},D1");
                    _asmWriter.WriteLine($"    MOVE.L {val2_hi},D2");
                    _asmWriter.WriteLine($"    MOVE.L {val2_lo},D3");
                    _asmWriter.WriteLine($"    JSR __eqdf2           ; IEEE 754 double equality");
                    _asmWriter.WriteLine($"    TST.L D0");
                    _asmWriter.WriteLine($"    BEQ {label}  ; Branch if not equal (double)");
                    _stack.ReleaseDataRegister(val1_hi);
                    _stack.ReleaseDataRegister(val1_lo);
                    _stack.ReleaseDataRegister(val2_hi);
                    _stack.ReleaseDataRegister(val2_lo);
                }
                else if (_stack.StackDepth >= 2)
                {
                    string val2 = _stack.Pop();
                    string val1 = _stack.Pop();
                    string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter.WriteLine($"    CMP.L {val2},{val1}");
                    _asmWriter.WriteLine($"    BNE {label}  ; Branch if not equal (unsigned)");
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: Bne_Un with insufficient _stack depth ({_stack.StackDepth})");
                }
            }
            else if (opcode == OpCodes.Blt || opcode == OpCodes.Blt_S)
            {
                if (_stack.StackDepth >= 4 && _stack.IsTopDoubleWord)
                {
                    string val2_lo = _stack.Pop();
                    string val2_hi = _stack.Pop();
                    string val1_lo = _stack.Pop();
                    string val1_hi = _stack.Pop();
                    string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter.WriteLine($"    MOVE.L {val1_hi},D0");
                    _asmWriter.WriteLine($"    MOVE.L {val1_lo},D1");
                    _asmWriter.WriteLine($"    MOVE.L {val2_hi},D2");
                    _asmWriter.WriteLine($"    MOVE.L {val2_lo},D3");
                    _asmWriter.WriteLine($"    JSR __ltdf2           ; IEEE 754 double less-than");
                    _asmWriter.WriteLine($"    TST.L D0");
                    _asmWriter.WriteLine($"    BNE {label}  ; Branch if < (double, signed)");
                    _stack.ReleaseDataRegister(val1_hi);
                    _stack.ReleaseDataRegister(val1_lo);
                    _stack.ReleaseDataRegister(val2_hi);
                    _stack.ReleaseDataRegister(val2_lo);
                }
                else if (_stack.StackDepth >= 2)
                {
                    string val2 = _stack.Pop();
                    string val1 = _stack.Pop();
                    string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter.WriteLine($"    CMP.L {val2},{val1}");
                    _asmWriter.WriteLine($"    BLT {label}  ; Branch if < (signed)");
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: Blt with insufficient _stack depth ({_stack.StackDepth})");
                }
            }
            else if (opcode == OpCodes.Blt_Un || opcode == OpCodes.Blt_Un_S)
            {
                if (_stack.StackDepth >= 4 && _stack.IsTopDoubleWord)
                {
                    string val2_lo = _stack.Pop();
                    string val2_hi = _stack.Pop();
                    string val1_lo = _stack.Pop();
                    string val1_hi = _stack.Pop();
                    string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter.WriteLine($"    MOVE.L {val1_hi},D0");
                    _asmWriter.WriteLine($"    MOVE.L {val1_lo},D1");
                    _asmWriter.WriteLine($"    MOVE.L {val2_hi},D2");
                    _asmWriter.WriteLine($"    MOVE.L {val2_lo},D3");
                    _asmWriter.WriteLine($"    JSR __ltdf2           ; IEEE 754 double less-than");
                    _asmWriter.WriteLine($"    TST.L D0");
                    _asmWriter.WriteLine($"    BNE {label}  ; Branch if < (double, unsigned/unordered)");
                    _stack.ReleaseDataRegister(val1_hi);
                    _stack.ReleaseDataRegister(val1_lo);
                    _stack.ReleaseDataRegister(val2_hi);
                    _stack.ReleaseDataRegister(val2_lo);
                }
                else if (_stack.StackDepth >= 2)
                {
                    string val2 = _stack.Pop();
                    string val1 = _stack.Pop();
                    string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter.WriteLine($"    CMP.L {val2},{val1}");
                    _asmWriter.WriteLine($"    BCS {label}  ; Branch if < (unsigned - Carry Set)");
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: Blt_Un with insufficient _stack depth ({_stack.StackDepth})");
                }
            }
            else if (opcode == OpCodes.Br || opcode == OpCodes.Br_S)
            {
                // Unconditional branch - simple jump to target
                string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                _asmWriter.WriteLine($"    BRA {label}  ; Unconditional branch");
                _stack.Clear();  // Clear _stack after unconditional branch
            }
            else if (opcode == OpCodes.Beq || opcode == OpCodes.Beq_S)
            {
                if (_stack.StackDepth >= 4 && _stack.IsTopDoubleWord)
                {
                    string val2_lo = _stack.Pop();
                    string val2_hi = _stack.Pop();
                    string val1_lo = _stack.Pop();
                    string val1_hi = _stack.Pop();
                    string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter.WriteLine($"    MOVE.L {val1_hi},D0");
                    _asmWriter.WriteLine($"    MOVE.L {val1_lo},D1");
                    _asmWriter.WriteLine($"    MOVE.L {val2_hi},D2");
                    _asmWriter.WriteLine($"    MOVE.L {val2_lo},D3");
                    _asmWriter.WriteLine($"    JSR __eqdf2           ; IEEE 754 double equality");
                    _asmWriter.WriteLine($"    TST.L D0");
                    _asmWriter.WriteLine($"    BNE {label}  ; Branch if equal (double)");
                    _stack.ReleaseDataRegister(val1_hi);
                    _stack.ReleaseDataRegister(val1_lo);
                    _stack.ReleaseDataRegister(val2_hi);
                    _stack.ReleaseDataRegister(val2_lo);
                }
                else if (_stack.StackDepth >= 2)
                {
                    string val2 = _stack.Pop();
                    string val1 = _stack.Pop();
                    string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter.WriteLine($"    CMP.L {val2},{val1}");
                    _asmWriter.WriteLine($"    BEQ {label}  ; Branch if equal (signed)");
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: Beq with insufficient _stack depth ({_stack.StackDepth})");
                }
            }
            else if (opcode == OpCodes.Bge || opcode == OpCodes.Bge_S)
            {
                if (_stack.StackDepth >= 4 && _stack.IsTopDoubleWord)
                {
                    string val2_lo = _stack.Pop();
                    string val2_hi = _stack.Pop();
                    string val1_lo = _stack.Pop();
                    string val1_hi = _stack.Pop();
                    string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter.WriteLine($"    MOVE.L {val1_hi},D0");
                    _asmWriter.WriteLine($"    MOVE.L {val1_lo},D1");
                    _asmWriter.WriteLine($"    MOVE.L {val2_hi},D2");
                    _asmWriter.WriteLine($"    MOVE.L {val2_lo},D3");
                    _asmWriter.WriteLine($"    JSR __gedf2           ; IEEE 754 double greater-or-equal");
                    _asmWriter.WriteLine($"    TST.L D0");
                    _asmWriter.WriteLine($"    BNE {label}  ; Branch if >= (double)");
                    _stack.ReleaseDataRegister(val1_hi);
                    _stack.ReleaseDataRegister(val1_lo);
                    _stack.ReleaseDataRegister(val2_hi);
                    _stack.ReleaseDataRegister(val2_lo);
                }
                else if (_stack.StackDepth >= 2)
                {
                    string val2 = _stack.Pop();
                    string val1 = _stack.Pop();
                    string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter.WriteLine($"    CMP.L {val2},{val1}");
                    _asmWriter.WriteLine($"    BGE {label}  ; Branch if >= (signed)");
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: Bge with insufficient _stack depth ({_stack.StackDepth})");
                }
            }
            else if (opcode == OpCodes.Bge_Un || opcode == OpCodes.Bge_Un_S)
            {
                if (_stack.StackDepth >= 4 && _stack.IsTopDoubleWord)
                {
                    string val2_lo = _stack.Pop();
                    string val2_hi = _stack.Pop();
                    string val1_lo = _stack.Pop();
                    string val1_hi = _stack.Pop();
                    string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter.WriteLine($"    MOVE.L {val1_hi},D0");
                    _asmWriter.WriteLine($"    MOVE.L {val1_lo},D1");
                    _asmWriter.WriteLine($"    MOVE.L {val2_hi},D2");
                    _asmWriter.WriteLine($"    MOVE.L {val2_lo},D3");
                    _asmWriter.WriteLine($"    JSR __gedf2           ; IEEE 754 double greater-or-equal");
                    _asmWriter.WriteLine($"    TST.L D0");
                    _asmWriter.WriteLine($"    BNE {label}  ; Branch if >= (double, unsigned/unordered)");
                    _stack.ReleaseDataRegister(val1_hi);
                    _stack.ReleaseDataRegister(val1_lo);
                    _stack.ReleaseDataRegister(val2_hi);
                    _stack.ReleaseDataRegister(val2_lo);
                }
                else if (_stack.StackDepth >= 2)
                {
                    string val2 = _stack.Pop();
                    string val1 = _stack.Pop();
                    string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter.WriteLine($"    CMP.L {val2},{val1}");
                    _asmWriter.WriteLine($"    BCC {label}  ; Branch if >= (unsigned)");
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: Bge_Un with insufficient _stack depth ({_stack.StackDepth})");
                }
            }
            else if (opcode == OpCodes.Ble || opcode == OpCodes.Ble_S)
            {
                if (_stack.StackDepth >= 4 && _stack.IsTopDoubleWord)
                {
                    string val2_lo = _stack.Pop();
                    string val2_hi = _stack.Pop();
                    string val1_lo = _stack.Pop();
                    string val1_hi = _stack.Pop();
                    string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter.WriteLine($"    MOVE.L {val1_hi},D0");
                    _asmWriter.WriteLine($"    MOVE.L {val1_lo},D1");
                    _asmWriter.WriteLine($"    MOVE.L {val2_hi},D2");
                    _asmWriter.WriteLine($"    MOVE.L {val2_lo},D3");
                    _asmWriter.WriteLine($"    JSR __ledf2           ; IEEE 754 double less-or-equal");
                    _asmWriter.WriteLine($"    TST.L D0");
                    _asmWriter.WriteLine($"    BNE {label}  ; Branch if <= (double)");
                    _stack.ReleaseDataRegister(val1_hi);
                    _stack.ReleaseDataRegister(val1_lo);
                    _stack.ReleaseDataRegister(val2_hi);
                    _stack.ReleaseDataRegister(val2_lo);
                }
                else if (_stack.StackDepth >= 2)
                {
                    string val2 = _stack.Pop();
                    string val1 = _stack.Pop();
                    string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter.WriteLine($"    CMP.L {val2},{val1}");
                    _asmWriter.WriteLine($"    BLE {label}  ; Branch if <= (signed)");
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: Ble with insufficient _stack depth ({_stack.StackDepth})");
                }
            }
            else if (opcode == OpCodes.Ble_Un || opcode == OpCodes.Ble_Un_S)
            {
                if (_stack.StackDepth >= 4 && _stack.IsTopDoubleWord)
                {
                    string val2_lo = _stack.Pop();
                    string val2_hi = _stack.Pop();
                    string val1_lo = _stack.Pop();
                    string val1_hi = _stack.Pop();
                    string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter.WriteLine($"    MOVE.L {val1_hi},D0");
                    _asmWriter.WriteLine($"    MOVE.L {val1_lo},D1");
                    _asmWriter.WriteLine($"    MOVE.L {val2_hi},D2");
                    _asmWriter.WriteLine($"    MOVE.L {val2_lo},D3");
                    _asmWriter.WriteLine($"    JSR __ledf2           ; IEEE 754 double less-or-equal");
                    _asmWriter.WriteLine($"    TST.L D0");
                    _asmWriter.WriteLine($"    BNE {label}  ; Branch if <= (double, unsigned/unordered)");
                    _stack.ReleaseDataRegister(val1_hi);
                    _stack.ReleaseDataRegister(val1_lo);
                    _stack.ReleaseDataRegister(val2_hi);
                    _stack.ReleaseDataRegister(val2_lo);
                }
                else if (_stack.StackDepth >= 2)
                {
                    string val2 = _stack.Pop();
                    string val1 = _stack.Pop();
                    string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter.WriteLine($"    CMP.L {val2},{val1}");
                    _asmWriter.WriteLine($"    BLS {label}  ; Branch if <= (unsigned)");
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: Ble_Un with insufficient _stack depth ({_stack.StackDepth})");
                }
            }
            else if (opcode == OpCodes.Bgt_Un || opcode == OpCodes.Bgt_Un_S)
            {
                if (_stack.StackDepth >= 4 && _stack.IsTopDoubleWord)
                {
                    string val2_lo = _stack.Pop();
                    string val2_hi = _stack.Pop();
                    string val1_lo = _stack.Pop();
                    string val1_hi = _stack.Pop();
                    string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter.WriteLine($"    MOVE.L {val1_hi},D0");
                    _asmWriter.WriteLine($"    MOVE.L {val1_lo},D1");
                    _asmWriter.WriteLine($"    MOVE.L {val2_hi},D2");
                    _asmWriter.WriteLine($"    MOVE.L {val2_lo},D3");
                    _asmWriter.WriteLine($"    JSR __gtdf2           ; IEEE 754 double greater-than");
                    _stack.ReleaseDataRegister(val1_hi);
                    _stack.ReleaseDataRegister(val1_lo);
                    _stack.ReleaseDataRegister(val2_hi);
                    _stack.ReleaseDataRegister(val2_lo);
                }
                else if (_stack.StackDepth >= 2)
                {
                    string val2 = _stack.Pop();
                    string val1 = _stack.Pop();
                    string label = _labels.GetOrCreateLabel(_iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter.WriteLine($"    CMP.L {val2},{val1}");
                    _asmWriter.WriteLine($"    BHI {label}  ; Branch if > (unsigned)");
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: Bgt_Un with insufficient _stack depth ({_stack.StackDepth})");
                }
            }
            else if (opcode == OpCodes.Call || opcode == OpCodes.Callvirt)
            {
                if (operand is int methodToken)
                {
                    var targetMethod = ResolveMethodToken(_method.OwningClass, methodToken);

                    if (targetMethod != null)
                    {
                        if (_decimalHandler.TryHandleMethod(targetMethod, _stack))
                        {
                        }
                        else
                        {
                            string methodLabel = targetMethod.OwningClass.GetMethodLabel(targetMethod);
                            _asmWriter.WriteLine($"    ; Call {targetMethod.OwningClass.FullName}.{targetMethod.Name}{targetMethod.Signature}");
                            _asmWriter.WriteLine($"    JSR {methodLabel}");

                            if (targetMethod.Signature != "()V" && !targetMethod.Signature.EndsWith(")V"))
                            {
                                _stack.Push("D0");
                                if (Program.CodeOptions?.Verbosity > 1)
                                {
                                    _asmWriter.WriteLine($"    ; Return value pushed (non-void method)");
                                }
                            }
                        }
                    }
                    else
                    {
                        var reflectionMethod = TryResolveFrameworkMethod(_method.OwningClass, methodToken);

                        if (reflectionMethod != null)
                        {
                            if (_decimalHandler.TryHandleReflectionMethod(reflectionMethod, _stack))
                            {
                            }
                            else if (_mathHandler.TryHandleReflectionMethod(reflectionMethod, _stack))
                            {
                            }
                            else if (_doubleHandler.TryHandleReflectionMethod(reflectionMethod, _stack))
                            {
                            }
                            else if (_floatHandler.TryHandleReflectionMethod(reflectionMethod, _stack))
                            {
                            }
                            else if (_integerHandler.TryHandleReflectionMethod(reflectionMethod, _stack))
                            {
                            }
                            else
                            {
                                _asmWriter.WriteLine($"    ; Framework method: {reflectionMethod.DeclaringType?.FullName}::{reflectionMethod.Name}");
                                _asmWriter.WriteLine($"    ; TODO: Implement framework call");
                                var paramCount = reflectionMethod is MethodInfo mi ?
                                    mi.GetParameters().Length : 0;
                                for (int i = 0; i < paramCount; i++)
                                {
                                    try { _stack.Pop(); } catch { }
                                }
                                if (reflectionMethod is MethodInfo methodInfo &&
                                    methodInfo.ReturnType != typeof(void))
                                {
                                    string resultReg = _stack.AllocateDataRegister();
                                    _stack.Push(resultReg);
                                }
                            }
                        }
                        else
                        {
                            _asmWriter.WriteLine($"    ; WARNING: Unresolved method token {methodToken:X8}");
                            _asmWriter.WriteLine($"    ; JSR UNKNOWN_METHOD_{methodToken:X8}  ; UNRESOLVED");
                        }
                    }
                }
            }
            else if (opcode == OpCodes.Ldarg_0)
            {
                // Load 'this' pointer or first argument
                string targetReg = _stack.AllocateDataRegister();
                _asmWriter.WriteLine($"    MOVE.L 8(A6),{targetReg}  ; Load arg.0 (this/first param)");
                _stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Newobj)
            {
                if (operand is int methodToken)
                {
                    var reflectionMethod = TryResolveFrameworkMethod(_method.OwningClass, methodToken);

                    if (!_decimalHandler.TryHandleNewObj(reflectionMethod, _stack))
                    {
                        _asmWriter.WriteLine($"    ; TODO: newobj {methodToken:X8}");
                    }
                }
            }
            else if (opcode == OpCodes.Ret)
            {
                if (_stack.StackDepth > 0)
                {
                    string retVal = _stack.Pop();
                    if (retVal != "D0")
                    {
                        _asmWriter.WriteLine($"    MOVE.L {retVal},D0  ; Move return value to D0");
                    }
                }
                else
                {
                    _asmWriter.WriteLine("    CLR.L D0            ; Clear return value (void)");
                }
            }
            else if (opcode == OpCodes.Pop)
            {
                if (_stack.StackDepth > 0)
                {
                    _stack.Pop();
                    _asmWriter.WriteLine("    ; Pop");
                }
                else
                {
                    _asmWriter.WriteLine("    ; WARNING: Pop on empty _stack");
                }
            }
            else if (opcode == OpCodes.Dup)
            {
                string val = _stack.Peek();
                _asmWriter.WriteLine($"    ; Duplicate {val}");
                _stack.Push(val);
            }
            else if (opcode == OpCodes.Leave || opcode == OpCodes.Leave_S)
            {
                int targetOffset = _iterator.NextIndex + (int)(operand ?? 0);
                string label = _labels.GetOrCreateLabel(targetOffset);
                _asmWriter.WriteLine($"    BRA {label}  ; leave - exit exception handler");
                _stack.Clear();
            }
            else if (opcode == OpCodes.Nop)
            {
                _asmWriter.WriteLine("    ; NOP");
            }
            else if (opcode == OpCodes.Conv_I4)
            {
                if (_stack.StackDepth > 0)
                {
                    string value = _stack.Pop();
                    string resultReg = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    MOVE.L {value},{resultReg}  ; Convert to I4");
                    _stack.ReleaseDataRegister(value);
                    _stack.Push(resultReg);
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: Conv_I4 with empty _stack");
                }
            }
            else if (opcode == OpCodes.Conv_R4)
            {
                if (_stack.StackDepth > 0)
                {
                    string value = _stack.Pop();
                    string resultReg = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    MOVE.L {value},{resultReg}  ; Convert to R4");
                    _stack.ReleaseDataRegister(value);
                    _stack.Push(resultReg);
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: Conv_R4 with empty _stack");
                }
            }
            else if (opcode == OpCodes.Conv_R8)
            {
                if (_stack.StackDepth > 0)
                {
                    string value = _stack.Pop();
                    string resultReg1 = _stack.AllocateDataRegister();
                    string resultReg2 = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    MOVE.L {value},{resultReg1}  ; Convert to R8 (high word)");
                    _asmWriter.WriteLine($"    CLR.L {resultReg2}          ; Convert to R8 (low word)");
                    _stack.ReleaseDataRegister(value);
                    _stack.Push(resultReg1, isDoubleWord: true);
                    _stack.Push(resultReg2, isDoubleWord: true);
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: Conv_R8 with empty _stack");
                }
            }
            else if (opcode == OpCodes.Conv_I8)
            {
                if (_stack.StackDepth > 0)
                {
                    string value = _stack.Pop();
                    string resultHi = _stack.AllocateDataRegister();
                    string resultLo = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    MOVE.L {value},{resultLo}  ; Conv_I8: low word = original value");
                    _asmWriter.WriteLine($"    MOVE.L {value},{resultHi}  ; Conv_I8: copy for sign extension");
                    _asmWriter.WriteLine($"    ASR.L #8,{resultHi}");
                    _asmWriter.WriteLine($"    ASR.L #8,{resultHi}");
                    _asmWriter.WriteLine($"    ASR.L #8,{resultHi}");
                    _asmWriter.WriteLine($"    ASR.L #7,{resultHi}       ; Sign-extend to 32 bits (high word)");
                    _stack.ReleaseDataRegister(value);
                    _stack.Push(resultHi);
                    _stack.Push(resultLo);
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: Conv_I8 with empty _stack");
                }
            }
            else if (opcode == OpCodes.Conv_U1)
            {
                if (_stack.StackDepth > 0)
                {
                    string value = _stack.Pop();
                    string resultReg = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    MOVE.L {value},{resultReg}");
                    _asmWriter.WriteLine($"    ANDI.L #$FF,{resultReg}   ; Conv_U1: mask to unsigned byte");
                    _stack.ReleaseDataRegister(value);
                    _stack.Push(resultReg);
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: Conv_U1 with empty _stack");
                }
            }
            else if (opcode == OpCodes.Ldloc_0 || opcode == OpCodes.Ldloc_1 ||
                     opcode == OpCodes.Ldloc_2 || opcode == OpCodes.Ldloc_3)
            {
                int localIndex = 0;
                if (opcode == OpCodes.Ldloc_1) localIndex = 1;
                else if (opcode == OpCodes.Ldloc_2) localIndex = 2;
                else if (opcode == OpCodes.Ldloc_3) localIndex = 3;

                int frameOffset = -(localIndex + 1) * 4 - 4;

                if (_doubleLocals.Contains(localIndex))
                {
                    string targetReg1 = _stack.AllocateDataRegister();
                    string targetReg2 = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    MOVE.L {frameOffset}(A6),{targetReg1}      ; Load local.{localIndex} (high)");
                    _asmWriter.WriteLine($"    MOVE.L {frameOffset + 4}(A6),{targetReg2}  ; Load local.{localIndex} (low)");
                    _stack.Push(targetReg1, isDoubleWord: true);
                    _stack.Push(targetReg2, isDoubleWord: true);
                }
                else
                {
                    string targetReg = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    MOVE.L {frameOffset}(A6),{targetReg}  ; Load local.{localIndex}");
                    _stack.Push(targetReg);
                }
            }
            else if (opcode == OpCodes.Ldloc_S)
            {
                if (operand is int localIdx)
                {
                    int frameOffset = -(localIdx + 1) * 4 - 4;

                    if (_doubleLocals.Contains(localIdx))
                    {
                        string targetReg1 = _stack.AllocateDataRegister();
                        string targetReg2 = _stack.AllocateDataRegister();
                        _asmWriter.WriteLine($"    MOVE.L {frameOffset}(A6),{targetReg1}      ; Load local.{localIdx} (high)");
                        _asmWriter.WriteLine($"    MOVE.L {frameOffset + 4}(A6),{targetReg2}  ; Load local.{localIdx} (low)");
                        _stack.Push(targetReg1, isDoubleWord: true);
                        _stack.Push(targetReg2, isDoubleWord: true);
                    }
                    else
                    {
                        string targetReg = _stack.AllocateDataRegister();
                        _asmWriter.WriteLine($"    MOVE.L {frameOffset}(A6),{targetReg}  ; Load local.{localIdx}");
                        _stack.Push(targetReg);
                    }
                }
                else
                {
                    _asmWriter.WriteLine($"    ; ERROR: ldloc.s with invalid operand type: {operand?.GetType().Name}");
                }
            }
            else if (opcode == OpCodes.Ldloc)
            {
                if (operand is ushort localIdx2)
                {
                    int frameOffset = -(localIdx2 + 1) * 4 - 4;

                    if (_doubleLocals.Contains(localIdx2))
                    {
                        string targetReg1 = _stack.AllocateDataRegister();
                        string targetReg2 = _stack.AllocateDataRegister();
                        _asmWriter.WriteLine($"    MOVE.L {frameOffset}(A6),{targetReg1}      ; Load local.{localIdx2} (high)");
                        _asmWriter.WriteLine($"    MOVE.L {frameOffset + 4}(A6),{targetReg2}  ; Load local.{localIdx2} (low)");
                        _stack.Push(targetReg1, isDoubleWord: true);
                        _stack.Push(targetReg2, isDoubleWord: true);
                    }
                    else
                    {
                        string targetReg = _stack.AllocateDataRegister();
                        _asmWriter.WriteLine($"    MOVE.L {frameOffset}(A6),{targetReg}  ; Load local.{localIdx2}");
                        _stack.Push(targetReg);
                    }
                }
            }
            else if (opcode == OpCodes.Ldloca_S)
            {
                if (operand is int localIdx)
                {
                    int frameOffset = -(localIdx + 1) * 4 - 4;
                    string addrReg = _stack.AllocateAddressRegister();
                    _asmWriter.WriteLine($"    LEA {frameOffset}(A6),{addrReg}  ; Load address of local.{localIdx}");
                    string dataReg = _stack.AllocateDataRegister();
                    _asmWriter.WriteLine($"    MOVE.L {addrReg},{dataReg}");
                    _stack.ReleaseAddressRegister(addrReg);
                    _stack.Push(dataReg);
                }
                else
                {
                    _asmWriter.WriteLine($"    ; ERROR: ldloca.s with invalid operand type: {operand?.GetType().Name}");
                }
            }
            else if (opcode == OpCodes.Ldsfld)
            {
                if (operand is int fieldToken)
                {
                    string targetReg = _stack.AllocateDataRegister();
                    try
                    {
                        var fieldInfo = _method.OwningClass.ReflectionType?.Module?.ResolveField(fieldToken);
                        if (fieldInfo != null)
                        {
                            string fieldLabel = $"STATIC_{fieldInfo.DeclaringType?.Name}_{fieldInfo.Name}";
                            _asmWriter.WriteLine($"    MOVE.L {fieldLabel},{targetReg}  ; Load static field {fieldInfo.DeclaringType?.Name}.{fieldInfo.Name}");
                        }
                        else
                        {
                            _asmWriter.WriteLine($"    CLR.L {targetReg}  ; TODO: Unresolved static field token {fieldToken:X8}");
                        }
                    }
                    catch
                    {
                        _asmWriter.WriteLine($"    CLR.L {targetReg}  ; TODO: Could not resolve static field token {fieldToken:X8}");
                    }
                    _stack.Push(targetReg);
                }
            }
            else if (opcode == OpCodes.Stloc_0)
            {
                if (_stack.StackDepth >= 2 && _stack.IsTopDoubleWord)
                {
                    string loReg = _stack.Pop();
                    string hiReg = _stack.Pop();
                    _asmWriter.WriteLine($"    MOVE.L {hiReg},-4(A6)    ; Store to local 0 (high)");
                    _asmWriter.WriteLine($"    MOVE.L {loReg},-8(A6)    ; Store to local 0 (low)");
                    _stack.ReleaseDataRegister(hiReg);
                    _stack.ReleaseDataRegister(loReg);
                    _doubleLocals.Add(0);
                }
                else if (_stack.StackDepth > 0)
                {
                    string valueReg = _stack.Pop();
                    _asmWriter.WriteLine($"    MOVE.L {valueReg},-4(A6)   ; Store to local 0");
                    _stack.ReleaseDataRegister(valueReg);
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: Stloc_0 with empty _stack");
                }
            }
            else if (opcode == OpCodes.Stloc_1)
            {
                if (_stack.StackDepth >= 2 && _stack.IsTopDoubleWord)
                {
                    string loReg = _stack.Pop();
                    string hiReg = _stack.Pop();
                    _asmWriter.WriteLine($"    MOVE.L {hiReg},-8(A6)    ; Store to local 1 (high)");
                    _asmWriter.WriteLine($"    MOVE.L {loReg},-12(A6)   ; Store to local 1 (low)");
                    _stack.ReleaseDataRegister(hiReg);
                    _stack.ReleaseDataRegister(loReg);
                    _doubleLocals.Add(1);
                }
                else if (_stack.StackDepth > 0)
                {
                    string valueReg = _stack.Pop();
                    _asmWriter.WriteLine($"    MOVE.L {valueReg},-8(A6)   ; Store to local 1");
                    _stack.ReleaseDataRegister(valueReg);
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: Stloc_1 with empty _stack");
                }
            }
            else if (opcode == OpCodes.Stloc_2)
            {
                if (_stack.StackDepth >= 2 && _stack.IsTopDoubleWord)
                {
                    string loReg = _stack.Pop();
                    string hiReg = _stack.Pop();
                    _asmWriter.WriteLine($"    MOVE.L {hiReg},-12(A6)   ; Store to local 2 (high)");
                    _asmWriter.WriteLine($"    MOVE.L {loReg},-16(A6)   ; Store to local 2 (low)");
                    _stack.ReleaseDataRegister(hiReg);
                    _stack.ReleaseDataRegister(loReg);
                    _doubleLocals.Add(2);
                }
                else if (_stack.StackDepth > 0)
                {
                    string valueReg = _stack.Pop();
                    _asmWriter.WriteLine($"    MOVE.L {valueReg},-12(A6)  ; Store to local 2");
                    _stack.ReleaseDataRegister(valueReg);
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: Stloc_2 with empty _stack");
                }
            }
            else if (opcode == OpCodes.Stloc_3)
            {
                if (_stack.StackDepth >= 2 && _stack.IsTopDoubleWord)
                {
                    string loReg = _stack.Pop();
                    string hiReg = _stack.Pop();
                    _asmWriter.WriteLine($"    MOVE.L {hiReg},-16(A6)   ; Store to local 3 (high)");
                    _asmWriter.WriteLine($"    MOVE.L {loReg},-20(A6)   ; Store to local 3 (low)");
                    _stack.ReleaseDataRegister(hiReg);
                    _stack.ReleaseDataRegister(loReg);
                    _doubleLocals.Add(3);
                }
                else if (_stack.StackDepth > 0)
                {
                    string valueReg = _stack.Pop();
                    _asmWriter.WriteLine($"    MOVE.L {valueReg},-16(A6)  ; Store to local 3");
                    _stack.ReleaseDataRegister(valueReg);
                }
                else
                {
                    _asmWriter.WriteLine($"    ; WARNING: Stloc_3 with empty _stack");
                }
            }
            else if (opcode == OpCodes.Stloc_S)
            {
                if (operand is int localIdx)
                {
                    int offset = -4 - (localIdx * 4);
                    if (_stack.StackDepth >= 2 && _stack.IsTopDoubleWord)
                    {
                        string loReg = _stack.Pop();
                        string hiReg = _stack.Pop();
                        _asmWriter.WriteLine($"    MOVE.L {hiReg},{offset}(A6)      ; Store to local {localIdx} (high)");
                        _asmWriter.WriteLine($"    MOVE.L {loReg},{offset - 4}(A6)  ; Store to local {localIdx} (low)");
                        _stack.ReleaseDataRegister(hiReg);
                        _stack.ReleaseDataRegister(loReg);
                        _doubleLocals.Add(localIdx);
                    }
                    else if (_stack.StackDepth > 0)
                    {
                        string src = _stack.Pop();
                        _asmWriter.WriteLine($"    MOVE.L {src},{offset}(A6)  ; Store to local {localIdx}");
                        _stack.ReleaseDataRegister(src);
                    }
                    else
                    {
                        _asmWriter.WriteLine($"    ; WARNING: Stloc_S with empty _stack");
                    }
                }
            }
            else
            {
                _asmWriter.WriteLine($"    ; TODO: Unimplemented opcode {opcode.Name}");

                // Attempt to infer _stack effects for common opcode patterns
                // This helps maintain _stack balance when opcodes are not yet implemented
                string opName = opcode.Name.ToLower();

                // Load opcodes typically push a value
                if (opName.StartsWith("ld") && !opName.Contains("st"))
                {
                    try
                    {
                        string reg = _stack.AllocateDataRegister();
                        _asmWriter.WriteLine($"    CLR.L {reg}  ; TODO: Placeholder value");
                        _stack.Push(reg);
                    }
                    catch { }
                }
                // Store opcodes typically pop a value
                else if (opName.StartsWith("st"))
                {
                    if (_stack.StackDepth > 0)
                    {
                        _stack.Pop();
                    }
                }
                // Call-like opcodes pop parameters and may push a return value
                else if (opName.Contains("call") || opName.Contains("new"))
                {
                    // Pop parameters (conservative estimate)
                    while (_stack.StackDepth > 0)
                    {
                        try { _stack.Pop(); }
                        catch { break; }
                    }
                    // May push return value (conservative)
                    try
                    {
                        string reg = _stack.AllocateDataRegister();
                        _stack.Push(reg);
                    }
                    catch { }
                }
            }
        }
    }
}
