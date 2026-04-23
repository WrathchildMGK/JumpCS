using System.Reflection;
using JumpCS.Backend.Base;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;

namespace JumpCS.Backend.Asm68000.SystemTypes
{
    /// <summary>Handler for System.Int32 (int) type operations</summary>
    public class SystemIntegerHandler : SystemHandlerBase, ISystemIntegerHandler
    {
        public SystemIntegerHandler(
            StreamWriter asmWriter,
            Func<IBackendStackSimulator, string> getAvailableRegister,
            Func<string> getUniqueLabel)
            : base(asmWriter, getAvailableRegister, getUniqueLabel)
        {
        }

        public override bool IsMethod(MethodMetadata method)
        {
            return method.OwningClass.FullName == "System.Int32" &&
                   (method.Name == "op_Addition" || method.Name == "op_Subtraction" ||
                    method.Name == "op_Multiply" || method.Name == "op_Division" ||
                    method.Name == "op_Modulus" || method.Name == "op_BitwiseAnd" ||
                    method.Name == "op_BitwiseOr" || method.Name == "op_ExclusiveOr" ||
                    method.Name == "op_LeftShift" || method.Name == "op_RightShift" ||
                    method.Name == "op_Equality" || method.Name == "op_Inequality" ||
                    method.Name == "op_LessThan" || method.Name == "op_GreaterThan" ||
                    method.Name == "op_LessThanOrEqual" || method.Name == "op_GreaterThanOrEqual" ||
                    method.Name == "op_UnaryNegation" || method.Name == "op_OnesComplement" ||
                    method.Name == "Equals" || method.Name == "CompareTo");
        }

        public override bool IsReflectionMethod(MethodBase method)
        {
            return method.DeclaringType?.FullName == "System.Int32";
        }

        public override void HandleMethodCall(MethodMetadata method, IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; TODO: System.Int32.{method.Name}");
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            string methodName = methodInfo.Name;
            AsmWriter?.WriteLine($"    ; System.Int32.{methodName} (inline/library call)");

            if (methodName == "op_Addition")
            {
                HandleAddition(stack);
            }
            else if (methodName == "op_Subtraction")
            {
                HandleSubtraction(stack);
            }
            else if (methodName == "op_Multiply")
            {
                HandleMultiply(stack);
            }
            else if (methodName == "op_Division")
            {
                HandleDivision(stack);
            }
            else if (methodName == "op_Modulus")
            {
                HandleModulus(stack);
            }
            else if (methodName == "op_BitwiseAnd")
            {
                HandleBitwiseAnd(stack);
            }
            else if (methodName == "op_BitwiseOr")
            {
                HandleBitwiseOr(stack);
            }
            else if (methodName == "op_ExclusiveOr")
            {
                HandleExclusiveOr(stack);
            }
            else if (methodName == "op_LeftShift")
            {
                HandleLeftShift(stack);
            }
            else if (methodName == "op_RightShift")
            {
                HandleRightShift(stack);
            }
            else if (methodName == "op_UnaryNegation")
            {
                HandleUnaryNegation(stack);
            }
            else if (methodName == "op_OnesComplement")
            {
                HandleOnesComplement(stack);
            }
            else if (methodName == "op_Equality")
            {
                HandleEquality(stack);
            }
            else if (methodName == "op_Inequality")
            {
                HandleInequality(stack);
            }
            else if (methodName == "op_LessThan")
            {
                HandleLessThan(stack);
            }
            else if (methodName == "op_GreaterThan")
            {
                HandleGreaterThan(stack);
            }
            else if (methodName == "op_LessThanOrEqual")
            {
                HandleLessThanOrEqual(stack);
            }
            else if (methodName == "op_GreaterThanOrEqual")
            {
                HandleGreaterThanOrEqual(stack);
            }
            else if (methodName == "Equals")
            {
                HandleEquals(stack);
            }
            else if (methodName == "CompareTo")
            {
                HandleCompareTo(stack);
            }
            else
            {
                AsmWriter?.WriteLine($"    ; TODO: System.Int32.{methodName}");
                var paramCount = methodInfo is MethodInfo mi ? mi.GetParameters().Length : 0;
                for (int i = 0; i < paramCount; i++)
                {
                    try { stack.Pop(); } catch { }
                }
                if (methodInfo is MethodInfo methodInfoTyped && methodInfoTyped.ReturnType != typeof(void))
                {
                    string resultReg = GetAvailableRegister(stack);
                    AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; TODO: {methodName} result");
                    stack.Push(resultReg);
                }
            }
        }

        /// <summary>Integer addition - inline (very simple)</summary>
        private void HandleAddition(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L {left},{resultReg}");
            AsmWriter?.WriteLine($"    ADD.L {right},{resultReg}");
            stack.Push(resultReg);
        }

        /// <summary>Integer subtraction - inline</summary>
        private void HandleSubtraction(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L {left},{resultReg}");
            AsmWriter?.WriteLine($"    SUB.L {right},{resultReg}");
            stack.Push(resultReg);
        }

        /// <summary>Integer multiplication - inline (uses MULS.L)</summary>
        private void HandleMultiply(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L {left},{resultReg}");
            AsmWriter?.WriteLine($"    MULS.L {right},{resultReg}");
            stack.Push(resultReg);
        }

        /// <summary>Integer division - inline (uses DIVS.L)</summary>
        private void HandleDivision(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L {left},{resultReg}");
            AsmWriter?.WriteLine($"    DIVS.L {right},{resultReg}");
            stack.Push(resultReg);
        }

        /// <summary>Integer modulus - delegates to library function</summary>
        private void HandleModulus(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left},D0");
            AsmWriter?.WriteLine($"    MOVE.L {right},D1");
            AsmWriter?.WriteLine($"    JSR Int32_Modulus        ; Library function handles modulo");

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L D0,{resultReg}    ; Result in D0");
            stack.Push(resultReg);
        }

        /// <summary>Bitwise AND - inline</summary>
        private void HandleBitwiseAnd(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L {left},{resultReg}");
            AsmWriter?.WriteLine($"    AND.L {right},{resultReg}");
            stack.Push(resultReg);
        }

        /// <summary>Bitwise OR - inline</summary>
        private void HandleBitwiseOr(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L {left},{resultReg}");
            AsmWriter?.WriteLine($"    OR.L {right},{resultReg}");
            stack.Push(resultReg);
        }

        /// <summary>Bitwise XOR - inline</summary>
        private void HandleExclusiveOr(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L {left},{resultReg}");
            AsmWriter?.WriteLine($"    EOR.L {right},{resultReg}");
            stack.Push(resultReg);
        }

        /// <summary>Left shift - delegates to library (variable shift amount)</summary>
        private void HandleLeftShift(IBackendStackSimulator stack)
        {
            string shiftAmount = stack.Pop();
            string value = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {value},D0");
            AsmWriter?.WriteLine($"    MOVE.L {shiftAmount},D1");
            AsmWriter?.WriteLine($"    JSR Int32_ShiftLeft      ; Library handles variable shift");

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L D0,{resultReg}");
            stack.Push(resultReg);
        }

        /// <summary>Right shift (arithmetic) - delegates to library (variable shift amount)</summary>
        private void HandleRightShift(IBackendStackSimulator stack)
        {
            string shiftAmount = stack.Pop();
            string value = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {value},D0");
            AsmWriter?.WriteLine($"    MOVE.L {shiftAmount},D1");
            AsmWriter?.WriteLine($"    JSR Int32_ShiftRight     ; Library handles variable shift");

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L D0,{resultReg}");
            stack.Push(resultReg);
        }

        /// <summary>Unary negation (two's complement) - inline</summary>
        private void HandleUnaryNegation(IBackendStackSimulator stack)
        {
            string val = stack.Pop();

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    CLR.L {resultReg}");
            AsmWriter?.WriteLine($"    SUB.L {val},{resultReg}");
            stack.Push(resultReg);
        }

        /// <summary>One's complement (bitwise NOT) - inline</summary>
        private void HandleOnesComplement(IBackendStackSimulator stack)
        {
            string val = stack.Pop();

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L {val},{resultReg}");
            AsmWriter?.WriteLine($"    NOT.L {resultReg}");
            stack.Push(resultReg);
        }

        /// <summary>Equality comparison - inline (simple CMP)</summary>
        private void HandleEquality(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            string resultReg = GetAvailableRegister(stack);
            string label = GetUniqueLabel();
            AsmWriter?.WriteLine($"    CMP.L {right},{left}");
            AsmWriter?.WriteLine($"    BEQ {label}_eq");
            AsmWriter?.WriteLine($"    CLR.L {resultReg}");
            AsmWriter?.WriteLine($"    BRA {label}_end");
            AsmWriter?.WriteLine($"{label}_eq:");
            AsmWriter?.WriteLine($"    MOVE.L #1,{resultReg}");
            AsmWriter?.WriteLine($"{label}_end:");
            stack.Push(resultReg);
        }

        /// <summary>Inequality comparison - inline (simple CMP)</summary>
        private void HandleInequality(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            string resultReg = GetAvailableRegister(stack);
            string label = GetUniqueLabel();
            AsmWriter?.WriteLine($"    CMP.L {right},{left}");
            AsmWriter?.WriteLine($"    BNE {label}_ne");
            AsmWriter?.WriteLine($"    CLR.L {resultReg}");
            AsmWriter?.WriteLine($"    BRA {label}_end");
            AsmWriter?.WriteLine($"{label}_ne:");
            AsmWriter?.WriteLine($"    MOVE.L #1,{resultReg}");
            AsmWriter?.WriteLine($"{label}_end:");
            stack.Push(resultReg);
        }

        /// <summary>Less-than comparison - inline (signed)</summary>
        private void HandleLessThan(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            string resultReg = GetAvailableRegister(stack);
            string label = GetUniqueLabel();
            AsmWriter?.WriteLine($"    CMP.L {right},{left}");
            AsmWriter?.WriteLine($"    BLT {label}_lt");
            AsmWriter?.WriteLine($"    CLR.L {resultReg}");
            AsmWriter?.WriteLine($"    BRA {label}_end");
            AsmWriter?.WriteLine($"{label}_lt:");
            AsmWriter?.WriteLine($"    MOVE.L #1,{resultReg}");
            AsmWriter?.WriteLine($"{label}_end:");
            stack.Push(resultReg);
        }

        /// <summary>Greater-than comparison - inline (signed)</summary>
        private void HandleGreaterThan(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            string resultReg = GetAvailableRegister(stack);
            string label = GetUniqueLabel();
            AsmWriter?.WriteLine($"    CMP.L {right},{left}");
            AsmWriter?.WriteLine($"    BGT {label}_gt");
            AsmWriter?.WriteLine($"    CLR.L {resultReg}");
            AsmWriter?.WriteLine($"    BRA {label}_end");
            AsmWriter?.WriteLine($"{label}_gt:");
            AsmWriter?.WriteLine($"    MOVE.L #1,{resultReg}");
            AsmWriter?.WriteLine($"{label}_end:");
            stack.Push(resultReg);
        }

        /// <summary>Less-than-or-equal comparison - inline</summary>
        private void HandleLessThanOrEqual(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            string resultReg = GetAvailableRegister(stack);
            string label = GetUniqueLabel();
            AsmWriter?.WriteLine($"    CMP.L {right},{left}");
            AsmWriter?.WriteLine($"    BLE {label}_le");
            AsmWriter?.WriteLine($"    CLR.L {resultReg}");
            AsmWriter?.WriteLine($"    BRA {label}_end");
            AsmWriter?.WriteLine($"{label}_le:");
            AsmWriter?.WriteLine($"    MOVE.L #1,{resultReg}");
            AsmWriter?.WriteLine($"{label}_end:");
            stack.Push(resultReg);
        }

        /// <summary>Greater-than-or-equal comparison - inline</summary>
        private void HandleGreaterThanOrEqual(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            string resultReg = GetAvailableRegister(stack);
            string label = GetUniqueLabel();
            AsmWriter?.WriteLine($"    CMP.L {right},{left}");
            AsmWriter?.WriteLine($"    BGE {label}_ge");
            AsmWriter?.WriteLine($"    CLR.L {resultReg}");
            AsmWriter?.WriteLine($"    BRA {label}_end");
            AsmWriter?.WriteLine($"{label}_ge:");
            AsmWriter?.WriteLine($"    MOVE.L #1,{resultReg}");
            AsmWriter?.WriteLine($"{label}_end:");
            stack.Push(resultReg);
        }

        /// <summary>Object.Equals override - delegates to library</summary>
        private void HandleEquals(IBackendStackSimulator stack)
        {
            string objRef = stack.Pop();
            string self = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {self},D0         ; this (as int value)");
            AsmWriter?.WriteLine($"    MOVE.L {objRef},D1       ; other (as int value)");
            AsmWriter?.WriteLine($"    JSR Int32_Equals         ; Library function");

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L D0,{resultReg}");
            stack.Push(resultReg);
        }

        /// <summary>CompareTo override - delegates to library</summary>
        private void HandleCompareTo(IBackendStackSimulator stack)
        {
            string objRef = stack.Pop();
            string self = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {self},D0         ; this (as int value)");
            AsmWriter?.WriteLine($"    MOVE.L {objRef},D1       ; other (as int value)");
            AsmWriter?.WriteLine($"    JSR Int32_CompareTo      ; Library function");

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L D0,{resultReg}    ; Result: -1, 0, or 1");
            stack.Push(resultReg);
        }
    }
}