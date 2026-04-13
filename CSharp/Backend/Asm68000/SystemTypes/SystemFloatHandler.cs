using System.Reflection;
using JumpCS.Backend.Asm68000;
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
            AsmWriter?.WriteLine($"    ; System.Single.{methodName} (inline)");

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

        private void HandleAddition(IBackendStackSimulator stack)
        {
            // Float addition: pop two floats (2 regs total), call __addsf3
            string right = stack.Pop();   // Second float
            string left = stack.Pop();    // First float

            // Setup arguments: left in D0, right in D1
            AsmWriter?.WriteLine($"    MOVE.L {left},D0      ; Left operand");
            AsmWriter?.WriteLine($"    MOVE.L {right},D1     ; Right operand");

            // Call library function for float addition
            AsmWriter?.WriteLine($"    JSR __addsf3          ; IEEE 754 float addition");

            // Result is in D0
            stack.ReleaseDataRegister(left);
            stack.ReleaseDataRegister(right);

            stack.Push("D0");
        }

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

        private void HandleUnaryNegation(IBackendStackSimulator stack)
        {
            string val = stack.Pop();

            // Flip the sign bit (bit 31 of the IEEE 754 float)
            AsmWriter?.WriteLine($"    MOVE.L {val},D0       ; Value");
            AsmWriter?.WriteLine($"    EORI.L #$80000000,D0  ; Flip sign bit");

            stack.ReleaseDataRegister(val);

            stack.Push("D0");
        }

        private void HandleEquality(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left},D0      ; Left operand");
            AsmWriter?.WriteLine($"    MOVE.L {right},D1     ; Right operand");

            AsmWriter?.WriteLine($"    JSR __eqsf2           ; IEEE 754 float equality");
            // Result: D0 = 0 if not equal, non-zero if equal

            stack.ReleaseDataRegister(left);
            stack.ReleaseDataRegister(right);

            stack.Push("D0");
        }

        private void HandleInequality(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left},D0      ; Left operand");
            AsmWriter?.WriteLine($"    MOVE.L {right},D1     ; Right operand");

            AsmWriter?.WriteLine($"    JSR __nesf2           ; IEEE 754 float inequality");
            // Result: D0 = 0 if equal, non-zero if not equal

            stack.ReleaseDataRegister(left);
            stack.ReleaseDataRegister(right);

            stack.Push("D0");
        }

        private void HandleLessThan(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left},D0      ; Left operand");
            AsmWriter?.WriteLine($"    MOVE.L {right},D1     ; Right operand");

            AsmWriter?.WriteLine($"    JSR __ltsf2           ; IEEE 754 float less-than");
            // Result: D0 = 0 if not less, 1 if less

            stack.ReleaseDataRegister(left);
            stack.ReleaseDataRegister(right);

            stack.Push("D0");
        }

        private void HandleGreaterThan(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left},D0      ; Left operand");
            AsmWriter?.WriteLine($"    MOVE.L {right},D1     ; Right operand");

            AsmWriter?.WriteLine($"    JSR __gtsf2           ; IEEE 754 float greater-than");
            // Result: D0 = 0 if not greater, 1 if greater

            stack.ReleaseDataRegister(left);
            stack.ReleaseDataRegister(right);

            stack.Push("D0");
        }

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

        private void HandleIsNaN(IBackendStackSimulator stack)
        {
            string val = stack.Pop();
            string label = GetUniqueLabel();
            AsmWriter?.WriteLine($"    MOVE.L {val},D0");
            AsmWriter?.WriteLine($"    ANDI.L #$7F800000,D0  ; Isolate exponent");
            AsmWriter?.WriteLine($"    CMPI.L #$7F800000,D0");
            AsmWriter?.WriteLine($"    BNE {label}_false");
            AsmWriter?.WriteLine($"    MOVE.L {val},D0");
            AsmWriter?.WriteLine($"    ANDI.L #$007FFFFF,D0  ; Isolate mantissa");
            AsmWriter?.WriteLine($"    TST.L D0");
            AsmWriter?.WriteLine($"    BEQ {label}_false");
            AsmWriter?.WriteLine($"    MOVE.L #1,D0");
            AsmWriter?.WriteLine($"    BRA {label}_end");
            AsmWriter?.WriteLine($"{label}_false:");
            AsmWriter?.WriteLine($"    CLR.L D0");
            AsmWriter?.WriteLine($"{label}_end:");
            stack.ReleaseDataRegister(val);
            stack.Push("D0");
        }

        private void HandleIsInfinity(IBackendStackSimulator stack)
        {
            string val = stack.Pop();
            string label = GetUniqueLabel();
            AsmWriter?.WriteLine($"    MOVE.L {val},D0");
            AsmWriter?.WriteLine($"    ANDI.L #$7FFFFFFF,D0  ; Clear sign bit");
            AsmWriter?.WriteLine($"    CMPI.L #$7F800000,D0");
            AsmWriter?.WriteLine($"    BNE {label}_false");
            AsmWriter?.WriteLine($"    MOVE.L #1,D0");
            AsmWriter?.WriteLine($"    BRA {label}_end");
            AsmWriter?.WriteLine($"{label}_false:");
            AsmWriter?.WriteLine($"    CLR.L D0");
            AsmWriter?.WriteLine($"{label}_end:");
            stack.ReleaseDataRegister(val);
            stack.Push("D0");
        }

        private void HandleIsPositiveInfinity(IBackendStackSimulator stack)
        {
            string val = stack.Pop();
            string label = GetUniqueLabel();
            AsmWriter?.WriteLine($"    CMPI.L #$7F800000,{val}");
            AsmWriter?.WriteLine($"    BNE {label}_false");
            AsmWriter?.WriteLine($"    MOVE.L #1,D0");
            AsmWriter?.WriteLine($"    BRA {label}_end");
            AsmWriter?.WriteLine($"{label}_false:");
            AsmWriter?.WriteLine($"    CLR.L D0");
            AsmWriter?.WriteLine($"{label}_end:");
            stack.ReleaseDataRegister(val);
            stack.Push("D0");
        }

        private void HandleIsNegativeInfinity(IBackendStackSimulator stack)
        {
            string val = stack.Pop();
            string label = GetUniqueLabel();
            AsmWriter?.WriteLine($"    CMPI.L #$FF800000,{val}");
            AsmWriter?.WriteLine($"    BNE {label}_false");
            AsmWriter?.WriteLine($"    MOVE.L #1,D0");
            AsmWriter?.WriteLine($"    BRA {label}_end");
            AsmWriter?.WriteLine($"{label}_false:");
            AsmWriter?.WriteLine($"    CLR.L D0");
            AsmWriter?.WriteLine($"{label}_end:");
            stack.ReleaseDataRegister(val);
            stack.Push("D0");
        }
    }
}