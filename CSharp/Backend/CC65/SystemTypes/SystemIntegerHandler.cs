using System.Reflection;
using JumpCS.Backend.Base;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;

namespace JumpCS.Backend.CC65.SystemTypes
{
    /// <summary>Handler for System.Int32 (int) type operations - CC65 (6502) target</summary>
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
            AsmWriter?.WriteLine($"    ; System.Int32.{methodName}");

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
                    AsmWriter?.WriteLine($"    LDA #0          ; TODO: {methodName} result");
                    stack.Push(resultReg);
                }
            }
        }

        /// <summary>32-bit addition: a + b (uses 6502 native instructions)</summary>
        private void HandleAddition(IBackendStackSimulator stack)
        {
            string right = stack.Pop();      // High 16 bits, low 16 bits
            string left = stack.Pop();       // High 16 bits, low 16 bits

            // For 6502, we need to work with 8-bit chunks via zero page
            AsmWriter?.WriteLine($"    ; Int32 Addition");
            AsmWriter?.WriteLine($"    ; Left value already in acc/XY");
            AsmWriter?.WriteLine($"    ; Right value in {right}");
            AsmWriter?.WriteLine($"    JSR __add32");
        }

        /// <summary>32-bit subtraction: a - b</summary>
        private void HandleSubtraction(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Int32 Subtraction");
            AsmWriter?.WriteLine($"    JSR __sub32");
        }

        /// <summary>32-bit multiplication: a * b (delegates to library)</summary>
        private void HandleMultiply(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Int32 Multiply");
            AsmWriter?.WriteLine($"    JSR __mul32");
        }

        /// <summary>32-bit division: a / b (delegates to library)</summary>
        private void HandleDivision(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Int32 Division");
            AsmWriter?.WriteLine($"    JSR __div32");
        }

        /// <summary>32-bit modulus: a % b (delegates to library)</summary>
        private void HandleModulus(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Int32 Modulus");
            AsmWriter?.WriteLine($"    JSR Int32_Modulus");
        }

        /// <summary>32-bit bitwise AND (inline - simple operation)</summary>
        private void HandleBitwiseAnd(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            // 6502 AND is only available for accumulator with memory/immediate
            AsmWriter?.WriteLine($"    ; Int32 Bitwise AND");
            AsmWriter?.WriteLine($"    JSR Int32_BitwiseAnd");
        }

        /// <summary>32-bit bitwise OR (inline - simple operation)</summary>
        private void HandleBitwiseOr(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Int32 Bitwise OR");
            AsmWriter?.WriteLine($"    JSR Int32_BitwiseOr");
        }

        /// <summary>32-bit bitwise XOR (inline - simple operation)</summary>
        private void HandleExclusiveOr(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Int32 Bitwise XOR");
            AsmWriter?.WriteLine($"    JSR Int32_BitwiseXor");
        }

        /// <summary>32-bit left shift: a << amount (variable shift - delegates to library)</summary>
        private void HandleLeftShift(IBackendStackSimulator stack)
        {
            string shiftAmount = stack.Pop();
            string value = stack.Pop();

            AsmWriter?.WriteLine($"    ; Int32 Left Shift");
            AsmWriter?.WriteLine($"    JSR Int32_ShiftLeft");
        }

        /// <summary>32-bit right shift: a >> amount (variable shift - delegates to library)</summary>
        private void HandleRightShift(IBackendStackSimulator stack)
        {
            string shiftAmount = stack.Pop();
            string value = stack.Pop();

            AsmWriter?.WriteLine($"    ; Int32 Right Shift");
            AsmWriter?.WriteLine($"    JSR Int32_ShiftRight");
        }

        /// <summary>32-bit unary negation: -a (inline - uses simple arithmetic)</summary>
        private void HandleUnaryNegation(IBackendStackSimulator stack)
        {
            string val = stack.Pop();

            // 6502: negate by EOR with $FF and add 1 (two's complement)
            AsmWriter?.WriteLine($"    ; Int32 Unary Negation");
            AsmWriter?.WriteLine($"    JSR Int32_Negate");
        }

        /// <summary>32-bit ones complement: ~a (inline - bitwise NOT)</summary>
        private void HandleOnesComplement(IBackendStackSimulator stack)
        {
            string val = stack.Pop();

            // 6502: EOR all bytes with $FF
            AsmWriter?.WriteLine($"    ; Int32 Ones Complement");
            AsmWriter?.WriteLine($"    JSR Int32_OnesComplement");
        }

        /// <summary>32-bit equality: a == b (delegates to library)</summary>
        private void HandleEquality(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Int32 Equality");
            AsmWriter?.WriteLine($"    JSR Int32_Equals");
        }

        /// <summary>32-bit inequality: a != b</summary>
        private void HandleInequality(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Int32 Inequality");
            AsmWriter?.WriteLine($"    JSR Int32_NotEquals");
        }

        /// <summary>32-bit less than: a < b (delegates to library)</summary>
        private void HandleLessThan(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Int32 Less Than");
            AsmWriter?.WriteLine($"    JSR Int32_LessThan");
        }

        /// <summary>32-bit greater than: a > b</summary>
        private void HandleGreaterThan(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Int32 Greater Than");
            AsmWriter?.WriteLine($"    JSR Int32_GreaterThan");
        }

        /// <summary>32-bit less than or equal: a <= b</summary>
        private void HandleLessThanOrEqual(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Int32 Less Than Or Equal");
            AsmWriter?.WriteLine($"    JSR Int32_LessOrEqual");
        }

        /// <summary>32-bit greater than or equal: a >= b</summary>
        private void HandleGreaterThanOrEqual(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Int32 Greater Than Or Equal");
            AsmWriter?.WriteLine($"    JSR Int32_GreaterOrEqual");
        }

        /// <summary>Equals(object) instance method</summary>
        private void HandleEquals(IBackendStackSimulator stack)
        {
            string objRef = stack.Pop();

            AsmWriter?.WriteLine($"    ; Int32 Instance Equals");
            AsmWriter?.WriteLine($"    JSR Int32_InstanceEquals");
        }

        /// <summary>CompareTo(object) instance method</summary>
        private void HandleCompareTo(IBackendStackSimulator stack)
        {
            string objRef = stack.Pop();

            AsmWriter?.WriteLine($"    ; Int32 CompareTo");
            AsmWriter?.WriteLine($"    JSR Int32_CompareTo");
        }
    }
}