using System.Reflection;
using JumpCS.Backend.Base;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;

namespace JumpCS.Backend.Asm68000.SystemTypes
{
    /// <summary>Handler for System.Single (float) type operations</summary>
    public class SystemFloatHandler : SystemHandlerBase, ISystemFloatHandler
    {
        public SystemFloatHandler(
            StreamWriter asmWriter,
            Func<IBackendStackSimulator, string> getAvailableRegister,
            Func<string> getUniqueLabel)
            : base(asmWriter, getAvailableRegister, getUniqueLabel)
        {
        }

        public override bool IsMethod(MethodMetadata method)
        {
            return method.OwningClass.FullName == "System.Single" &&
                   (method.Name == "op_Addition" || method.Name == "op_Subtraction" ||
                    method.Name == "op_Multiply" || method.Name == "op_Division" ||
                    method.Name == "op_Equality" || method.Name == "op_Inequality" ||
                    method.Name == "op_LessThan" || method.Name == "op_GreaterThan" ||
                    method.Name == "op_LessThanOrEqual" || method.Name == "op_GreaterThanOrEqual" ||
                    method.Name == "op_UnaryNegation" || method.Name == "Equals" ||
                    method.Name == "IsNaN" || method.Name == "IsInfinity" ||
                    method.Name == "IsPositiveInfinity" || method.Name == "IsNegativeInfinity");
        }

        public override bool IsReflectionMethod(MethodBase method)
        {
            return method.DeclaringType?.FullName == "System.Single";
        }

        public override void HandleMethodCall(MethodMetadata method, IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; TODO: System.Single.{method.Name}");
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            string methodName = methodInfo.Name;
            AsmWriter?.WriteLine($"    ; System.Single.{methodName} (library call)");

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
            else if (methodName == "op_UnaryNegation")
            {
                HandleUnaryNegation(stack);
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
            else if (methodName == "IsNaN")
            {
                HandleIsNaN(stack);
            }
            else if (methodName == "IsInfinity")
            {
                HandleIsInfinity(stack);
            }
            else if (methodName == "IsPositiveInfinity")
            {
                HandleIsPositiveInfinity(stack);
            }
            else if (methodName == "IsNegativeInfinity")
            {
                HandleIsNegativeInfinity(stack);
            }
            else
            {
                AsmWriter?.WriteLine($"    ; TODO: System.Single.{methodName}");
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

        /// <summary>Float addition - delegates to LIBGCC</summary>
        private void HandleAddition(IBackendStackSimulator stack)
        {
            string right = stack.Pop();   // Second float
            string left = stack.Pop();    // First float

            AsmWriter?.WriteLine($"    MOVE.L {left},D0      ; Left operand");
            AsmWriter?.WriteLine($"    MOVE.L {right},D1     ; Right operand");
            AsmWriter?.WriteLine($"    JSR __addsf3          ; IEEE 754 float addition");

            stack.ReleaseDataRegister(left);
            stack.ReleaseDataRegister(right);

            stack.Push("D0");
        }

        /// <summary>Float subtraction - delegates to LIBGCC</summary>
        private void HandleSubtraction(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left},D0      ; Left operand");
            AsmWriter?.WriteLine($"    MOVE.L {right},D1     ; Right operand");
            AsmWriter?.WriteLine($"    JSR __subsf3          ; IEEE 754 float subtraction");

            stack.ReleaseDataRegister(left);
            stack.ReleaseDataRegister(right);

            stack.Push("D0");
        }

        /// <summary>Float multiplication - delegates to LIBGCC</summary>
        private void HandleMultiply(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left},D0      ; Left operand");
            AsmWriter?.WriteLine($"    MOVE.L {right},D1     ; Right operand");
            AsmWriter?.WriteLine($"    JSR __mulsf3          ; IEEE 754 float multiply");

            stack.ReleaseDataRegister(left);
            stack.ReleaseDataRegister(right);

            stack.Push("D0");
        }

        /// <summary>Float division - delegates to LIBGCC</summary>
        private void HandleDivision(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left},D0      ; Left operand");
            AsmWriter?.WriteLine($"    MOVE.L {right},D1     ; Right operand");
            AsmWriter?.WriteLine($"    JSR __divsf3          ; IEEE 754 float division");

            stack.ReleaseDataRegister(left);
            stack.ReleaseDataRegister(right);

            stack.Push("D0");
        }

        /// <summary>Float negation - flip sign bit</summary>
        private void HandleUnaryNegation(IBackendStackSimulator stack)
        {
            string val = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {val},D0");
            AsmWriter?.WriteLine($"    EORI.L #$80000000,D0  ; Flip sign bit");

            stack.ReleaseDataRegister(val);

            stack.Push("D0");
        }

        /// <summary>Float equality - delegates to LIBGCC</summary>
        private void HandleEquality(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left},D0      ; Left operand");
            AsmWriter?.WriteLine($"    MOVE.L {right},D1     ; Right operand");
            AsmWriter?.WriteLine($"    JSR __eqsf2           ; IEEE 754 float equality");

            stack.ReleaseDataRegister(left);
            stack.ReleaseDataRegister(right);

            stack.Push("D0");
        }

        /// <summary>Float inequality - delegates to LIBGCC</summary>
        private void HandleInequality(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left},D0      ; Left operand");
            AsmWriter?.WriteLine($"    MOVE.L {right},D1     ; Right operand");
            AsmWriter?.WriteLine($"    JSR __nesf2           ; IEEE 754 float inequality");

            stack.ReleaseDataRegister(left);
            stack.ReleaseDataRegister(right);

            stack.Push("D0");
        }

        /// <summary>Float less-than - delegates to LIBGCC</summary>
        private void HandleLessThan(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left},D0      ; Left operand");
            AsmWriter?.WriteLine($"    MOVE.L {right},D1     ; Right operand");
            AsmWriter?.WriteLine($"    JSR __ltsf2           ; IEEE 754 float less-than");

            stack.ReleaseDataRegister(left);
            stack.ReleaseDataRegister(right);

            stack.Push("D0");
        }

        /// <summary>Float greater-than - delegates to LIBGCC</summary>
        private void HandleGreaterThan(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left},D0      ; Left operand");
            AsmWriter?.WriteLine($"    MOVE.L {right},D1     ; Right operand");
            AsmWriter?.WriteLine($"    JSR __gtsf2           ; IEEE 754 float greater-than");

            stack.ReleaseDataRegister(left);
            stack.ReleaseDataRegister(right);

            stack.Push("D0");
        }

        /// <summary>Float less-than-or-equal - delegates to LIBGCC</summary>
        private void HandleLessThanOrEqual(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left},D0      ; Left operand");
            AsmWriter?.WriteLine($"    MOVE.L {right},D1     ; Right operand");
            AsmWriter?.WriteLine($"    JSR __lesf2           ; IEEE 754 float less-than-or-equal");

            stack.ReleaseDataRegister(left);
            stack.ReleaseDataRegister(right);

            stack.Push("D0");
        }

        /// <summary>Float greater-than-or-equal - delegates to LIBGCC</summary>
        private void HandleGreaterThanOrEqual(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left},D0      ; Left operand");
            AsmWriter?.WriteLine($"    MOVE.L {right},D1     ; Right operand");
            AsmWriter?.WriteLine($"    JSR __gesf2           ; IEEE 754 float greater-than-or-equal");

            stack.ReleaseDataRegister(left);
            stack.ReleaseDataRegister(right);

            stack.Push("D0");
        }

        /// <summary>Float Equals - check if two float values are equal</summary>
        private void HandleEquals(IBackendStackSimulator stack)
        {
            // Object.Equals(other) - compare the float values
            string other = stack.Pop();
            string self = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {self},D0      ; Self");
            AsmWriter?.WriteLine($"    MOVE.L {other},D1     ; Other");
            AsmWriter?.WriteLine($"    JSR __eqsf2           ; IEEE 754 float equality");

            stack.ReleaseDataRegister(self);
            stack.ReleaseDataRegister(other);

            stack.Push("D0");
        }

        /// <summary>Check if float is NaN - library call</summary>
        private void HandleIsNaN(IBackendStackSimulator stack)
        {
            string val = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {val},D0");
            AsmWriter?.WriteLine($"    JSR Single_IsNaN      ; Library function checks NaN");

            stack.ReleaseDataRegister(val);

            stack.Push("D0");
        }

        /// <summary>Check if float is positive or negative infinity - library call</summary>
        private void HandleIsInfinity(IBackendStackSimulator stack)
        {
            string val = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {val},D0");
            AsmWriter?.WriteLine($"    JSR Single_IsInfinity ; Library function checks infinity");

            stack.ReleaseDataRegister(val);

            stack.Push("D0");
        }

        /// <summary>Check if float is positive infinity - library call</summary>
        private void HandleIsPositiveInfinity(IBackendStackSimulator stack)
        {
            string val = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {val},D0");
            AsmWriter?.WriteLine($"    JSR Single_IsPositiveInfinity");

            stack.ReleaseDataRegister(val);

            stack.Push("D0");
        }

        /// <summary>Check if float is negative infinity - library call</summary>
        private void HandleIsNegativeInfinity(IBackendStackSimulator stack)
        {
            string val = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {val},D0");
            AsmWriter?.WriteLine($"    JSR Single_IsNegativeInfinity");

            stack.ReleaseDataRegister(val);

            stack.Push("D0");
        }
    }
}