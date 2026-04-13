using JumpCS.Backend.Asm68000;
using JumpCS.Backend.Base;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;
using System.Reflection;

namespace JumpCS.Backend.Asm68000.SystemTypes
{
    /// <summary>Handler for System.Double type operations</summary>
    public class SystemDoubleHandler : SystemHandlerBase, ISystemDoubleHandler
    {
        public SystemDoubleHandler(
            StreamWriter asmWriter,
            Func<IBackendStackSimulator, string> getAvailableRegister,
            Func<string> getUniqueLabel)
            : base(asmWriter, getAvailableRegister, getUniqueLabel)
        {
        }

        public override bool IsMethod(MethodMetadata method)
        {
            return method.OwningClass.FullName == "System.Double" &&
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
            return method.DeclaringType?.FullName == "System.Double";
        }

        public override void HandleMethodCall(MethodMetadata method, IBackendStackSimulator stack)
        {
            // Compiled Double methods (if any) would be handled here
            AsmWriter?.WriteLine($"    ; TODO: System.Double.{method.Name}");
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            string methodName = methodInfo.Name;
            AsmWriter?.WriteLine($"    ; System.Double.{methodName} (inline)");

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
                // Stub for unimplemented methods
                AsmWriter?.WriteLine($"    ; TODO: System.Double.{methodName}");
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

        /// <summary>Public method for double addition - delegates to library function</summary>
        public void HandleAddition(IBackendStackSimulator stack)
        {
            // Double addition: pop two doubles (4 regs total), call __adddf3
            string right_lo = stack.Pop();  // Low word of second double
            string right_hi = stack.Pop();  // High word of second double
            string left_lo = stack.Pop();   // Low word of first double
            string left_hi = stack.Pop();   // High word of first double

            // Setup arguments: left in D0/D1, right in D2/D3
            AsmWriter?.WriteLine($"    MOVE.L {left_hi},D0   ; Left high");
            AsmWriter?.WriteLine($"    MOVE.L {left_lo},D1   ; Left low");
            AsmWriter?.WriteLine($"    MOVE.L {right_hi},D2  ; Right high");
            AsmWriter?.WriteLine($"    MOVE.L {right_lo},D3  ; Right low");

            // Call library function for double addition
            AsmWriter?.WriteLine($"    JSR __adddf3          ; IEEE 754 double addition");

            // Result is in D0/D1
            stack.ReleaseDataRegister(left_hi);
            stack.ReleaseDataRegister(left_lo);
            stack.ReleaseDataRegister(right_hi);
            stack.ReleaseDataRegister(right_lo);

            stack.Push("D0", isDoubleWord: true);  // High word
            stack.Push("D1", isDoubleWord: true);  // Low word
        }

        /// <summary>Public method for double subtraction - delegates to library function</summary>
        public void HandleSubtraction(IBackendStackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left_hi},D0   ; Left high");
            AsmWriter?.WriteLine($"    MOVE.L {left_lo},D1   ; Left low");
            AsmWriter?.WriteLine($"    MOVE.L {right_hi},D2  ; Right high");
            AsmWriter?.WriteLine($"    MOVE.L {right_lo},D3  ; Right low");

            AsmWriter?.WriteLine($"    JSR __subdf3          ; IEEE 754 double subtraction");

            stack.ReleaseDataRegister(left_hi);
            stack.ReleaseDataRegister(left_lo);
            stack.ReleaseDataRegister(right_hi);
            stack.ReleaseDataRegister(right_lo);

            stack.Push("D0", isDoubleWord: true);
            stack.Push("D1", isDoubleWord: true);
        }

        /// <summary>Public method for double multiplication - delegates to library function</summary>
        public void HandleMultiply(IBackendStackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left_hi},D0   ; Left high");
            AsmWriter?.WriteLine($"    MOVE.L {left_lo},D1   ; Left low");
            AsmWriter?.WriteLine($"    MOVE.L {right_hi},D2  ; Right high");
            AsmWriter?.WriteLine($"    MOVE.L {right_lo},D3  ; Right low");

            AsmWriter?.WriteLine($"    JSR __muldf3          ; IEEE 754 double multiply");

            stack.ReleaseDataRegister(left_hi);
            stack.ReleaseDataRegister(left_lo);
            stack.ReleaseDataRegister(right_hi);
            stack.ReleaseDataRegister(right_lo);

            stack.Push("D0", isDoubleWord: true);
            stack.Push("D1", isDoubleWord: true);
        }

        /// <summary>Public method for double division - delegates to library function</summary>
        public void HandleDivision(IBackendStackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left_hi},D0   ; Left high");
            AsmWriter?.WriteLine($"    MOVE.L {left_lo},D1   ; Left low");
            AsmWriter?.WriteLine($"    MOVE.L {right_hi},D2  ; Right high");
            AsmWriter?.WriteLine($"    MOVE.L {right_lo},D3  ; Right low");

            AsmWriter?.WriteLine($"    JSR __divdf3          ; IEEE 754 double division");

            stack.ReleaseDataRegister(left_hi);
            stack.ReleaseDataRegister(left_lo);
            stack.ReleaseDataRegister(right_hi);
            stack.ReleaseDataRegister(right_lo);

            stack.Push("D0", isDoubleWord: true);
            stack.Push("D1", isDoubleWord: true);
        }

        /// <summary>Public method for double remainder - delegates to library function</summary>
        public void HandleRemainder(IBackendStackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left_hi},D0   ; Left high");
            AsmWriter?.WriteLine($"    MOVE.L {left_lo},D1   ; Left low");
            AsmWriter?.WriteLine($"    MOVE.L {right_hi},D2  ; Right high");
            AsmWriter?.WriteLine($"    MOVE.L {right_lo},D3  ; Right low");

            AsmWriter?.WriteLine($"    JSR __fmod            ; IEEE 754 double remainder/modulo");

            stack.ReleaseDataRegister(left_hi);
            stack.ReleaseDataRegister(left_lo);
            stack.ReleaseDataRegister(right_hi);
            stack.ReleaseDataRegister(right_lo);

            stack.Push("D0", isDoubleWord: true);
            stack.Push("D1", isDoubleWord: true);
        }

        private void HandleUnaryNegation(IBackendStackSimulator stack)
        {
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();

            // Flip the sign bit (bit 63 of the IEEE 754 double)
            AsmWriter?.WriteLine($"    MOVE.L {val_hi},D0    ; Value high word");
            AsmWriter?.WriteLine($"    MOVE.L {val_lo},D1    ; Value low word");
            AsmWriter?.WriteLine($"    EORI.L #$80000000,D0  ; Flip sign bit");

            stack.ReleaseDataRegister(val_hi);
            stack.ReleaseDataRegister(val_lo);

            stack.Push("D0", isDoubleWord: true);
            stack.Push("D1", isDoubleWord: true);
        }

        private void HandleEquality(IBackendStackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left_hi},D0   ; Left high");
            AsmWriter?.WriteLine($"    MOVE.L {left_lo},D1   ; Left low");
            AsmWriter?.WriteLine($"    MOVE.L {right_hi},D2  ; Right high");
            AsmWriter?.WriteLine($"    MOVE.L {right_lo},D3  ; Right low");

            AsmWriter?.WriteLine($"    JSR __eqdf2           ; IEEE 754 double equality");
            // Result: D0 = 0 if not equal, non-zero if equal

            stack.ReleaseDataRegister(left_hi);
            stack.ReleaseDataRegister(left_lo);
            stack.ReleaseDataRegister(right_hi);
            stack.ReleaseDataRegister(right_lo);

            stack.Push("D0", isDoubleWord: true);
        }

        private void HandleInequality(IBackendStackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left_hi},D0   ; Left high");
            AsmWriter?.WriteLine($"    MOVE.L {left_lo},D1   ; Left low");
            AsmWriter?.WriteLine($"    MOVE.L {right_hi},D2  ; Right high");
            AsmWriter?.WriteLine($"    MOVE.L {right_lo},D3  ; Right low");

            AsmWriter?.WriteLine($"    JSR __nedf2           ; IEEE 754 double inequality");
            // Result: D0 = 0 if equal, non-zero if not equal

            stack.ReleaseDataRegister(left_hi);
            stack.ReleaseDataRegister(left_lo);
            stack.ReleaseDataRegister(right_hi);
            stack.ReleaseDataRegister(right_lo);

            stack.Push("D0", isDoubleWord: true);
        }

        private void HandleLessThan(IBackendStackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left_hi},D0   ; Left high");
            AsmWriter?.WriteLine($"    MOVE.L {left_lo},D1   ; Left low");
            AsmWriter?.WriteLine($"    MOVE.L {right_hi},D2  ; Right high");
            AsmWriter?.WriteLine($"    MOVE.L {right_lo},D3  ; Right low");

            AsmWriter?.WriteLine($"    JSR __ltdf2           ; IEEE 754 double less-than");
            // Result: D0 = 0 if not less, 1 if less

            stack.ReleaseDataRegister(left_hi);
            stack.ReleaseDataRegister(left_lo);
            stack.ReleaseDataRegister(right_hi);
            stack.ReleaseDataRegister(right_lo);

            stack.Push("D0", isDoubleWord: true);
        }

        private void HandleGreaterThan(IBackendStackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left_hi},D0   ; Left high");
            AsmWriter?.WriteLine($"    MOVE.L {left_lo},D1   ; Left low");
            AsmWriter?.WriteLine($"    MOVE.L {right_hi},D2  ; Right high");
            AsmWriter?.WriteLine($"    MOVE.L {right_lo},D3  ; Right low");

            AsmWriter?.WriteLine($"    JSR __gtdf2           ; IEEE 754 double greater-than");
            // Result: D0 = 0 if not greater, 1 if greater

            stack.ReleaseDataRegister(left_hi);
            stack.ReleaseDataRegister(left_lo);
            stack.ReleaseDataRegister(right_hi);
            stack.ReleaseDataRegister(right_lo);

            stack.Push("D0", isDoubleWord: true);
        }

        private void HandleLessThanOrEqual(IBackendStackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left_hi},D0   ; Left high");
            AsmWriter?.WriteLine($"    MOVE.L {left_lo},D1   ; Left low");
            AsmWriter?.WriteLine($"    MOVE.L {right_hi},D2  ; Right high");
            AsmWriter?.WriteLine($"    MOVE.L {right_lo},D3  ; Right low");

            AsmWriter?.WriteLine($"    JSR __ledf2           ; IEEE 754 double less-than-or-equal");

            stack.ReleaseDataRegister(left_hi);
            stack.ReleaseDataRegister(left_lo);
            stack.ReleaseDataRegister(right_hi);
            stack.ReleaseDataRegister(right_lo);

            stack.Push("D0", isDoubleWord: true);
        }

        private void HandleGreaterThanOrEqual(IBackendStackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {left_hi},D0   ; Left high");
            AsmWriter?.WriteLine($"    MOVE.L {left_lo},D1   ; Left low");
            AsmWriter?.WriteLine($"    MOVE.L {right_hi},D2  ; Right high");
            AsmWriter?.WriteLine($"    MOVE.L {right_lo},D3  ; Right low");

            AsmWriter?.WriteLine($"    JSR __gedf2           ; IEEE 754 double greater-than-or-equal");

            stack.ReleaseDataRegister(left_hi);
            stack.ReleaseDataRegister(left_lo);
            stack.ReleaseDataRegister(right_hi);
            stack.ReleaseDataRegister(right_lo);

            stack.Push("D0", isDoubleWord: true);
        }

        private void HandleEquals(IBackendStackSimulator stack)
        {
            // Object.Equals(other) - compare the double values
            string other_lo = stack.Pop();
            string other_hi = stack.Pop();
            string self_lo = stack.Pop();
            string self_hi = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {self_hi},D0   ; Self high");
            AsmWriter?.WriteLine($"    MOVE.L {self_lo},D1   ; Self low");
            AsmWriter?.WriteLine($"    MOVE.L {other_hi},D2  ; Other high");
            AsmWriter?.WriteLine($"    MOVE.L {other_lo},D3  ; Other low");

            AsmWriter?.WriteLine($"    JSR __eqdf2           ; IEEE 754 double equality");

            stack.ReleaseDataRegister(self_hi);
            stack.ReleaseDataRegister(self_lo);
            stack.ReleaseDataRegister(other_hi);
            stack.ReleaseDataRegister(other_lo);

            stack.Push("D0", isDoubleWord: true);
        }

        private void HandleIsNaN(IBackendStackSimulator stack)
        {
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();
            string label = GetUniqueLabel();
            AsmWriter?.WriteLine($"    MOVE.L {val_hi},D0");
            AsmWriter?.WriteLine($"    ANDI.L #$7FF00000,D0  ; Isolate exponent");
            AsmWriter?.WriteLine($"    CMPI.L #$7FF00000,D0");
            AsmWriter?.WriteLine($"    BNE {label}_false");
            AsmWriter?.WriteLine($"    MOVE.L {val_hi},D0");
            AsmWriter?.WriteLine($"    ANDI.L #$000FFFFF,D0  ; Isolate mantissa high");
            AsmWriter?.WriteLine($"    TST.L D0");
            AsmWriter?.WriteLine($"    BNE {label}_true");
            AsmWriter?.WriteLine($"    TST.L {val_lo}");
            AsmWriter?.WriteLine($"    BNE {label}_true");
            AsmWriter?.WriteLine($"{label}_false:");
            AsmWriter?.WriteLine($"    CLR.L D0");
            AsmWriter?.WriteLine($"    BRA {label}_end");
            AsmWriter?.WriteLine($"{label}_true:");
            AsmWriter?.WriteLine($"    MOVE.L #1,D0");
            AsmWriter?.WriteLine($"{label}_end:");
            stack.ReleaseDataRegister(val_hi);
            stack.ReleaseDataRegister(val_lo);
            stack.Push("D0");
        }

        private void HandleIsInfinity(IBackendStackSimulator stack)
        {
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();
            string label = GetUniqueLabel();
            AsmWriter?.WriteLine($"    MOVE.L {val_hi},D0");
            AsmWriter?.WriteLine($"    ANDI.L #$7FFFFFFF,D0  ; Clear sign bit");
            AsmWriter?.WriteLine($"    CMPI.L #$7FF00000,D0");
            AsmWriter?.WriteLine($"    BNE {label}_false");
            AsmWriter?.WriteLine($"    TST.L {val_lo}");
            AsmWriter?.WriteLine($"    BNE {label}_false");
            AsmWriter?.WriteLine($"    MOVE.L #1,D0");
            AsmWriter?.WriteLine($"    BRA {label}_end");
            AsmWriter?.WriteLine($"{label}_false:");
            AsmWriter?.WriteLine($"    CLR.L D0");
            AsmWriter?.WriteLine($"{label}_end:");
            stack.ReleaseDataRegister(val_hi);
            stack.ReleaseDataRegister(val_lo);
            stack.Push("D0");
        }

        private void HandleIsPositiveInfinity(IBackendStackSimulator stack)
        {
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();
            string label = GetUniqueLabel();
            AsmWriter?.WriteLine($"    CMPI.L #$7FF00000,{val_hi}");
            AsmWriter?.WriteLine($"    BNE {label}_false");
            AsmWriter?.WriteLine($"    TST.L {val_lo}");
            AsmWriter?.WriteLine($"    BNE {label}_false");
            AsmWriter?.WriteLine($"    MOVE.L #1,D0");
            AsmWriter?.WriteLine($"    BRA {label}_end");
            AsmWriter?.WriteLine($"{label}_false:");
            AsmWriter?.WriteLine($"    CLR.L D0");
            AsmWriter?.WriteLine($"{label}_end:");
            stack.ReleaseDataRegister(val_hi);
            stack.ReleaseDataRegister(val_lo);
            stack.Push("D0");
        }

        private void HandleIsNegativeInfinity(IBackendStackSimulator stack)
        {
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();
            string label = GetUniqueLabel();
            AsmWriter?.WriteLine($"    CMPI.L #$FFF00000,{val_hi}");
            AsmWriter?.WriteLine($"    BNE {label}_false");
            AsmWriter?.WriteLine($"    TST.L {val_lo}");
            AsmWriter?.WriteLine($"    BNE {label}_false");
            AsmWriter?.WriteLine($"    MOVE.L #1,D0");
            AsmWriter?.WriteLine($"    BRA {label}_end");
            AsmWriter?.WriteLine($"{label}_false:");
            AsmWriter?.WriteLine($"    CLR.L D0");
            AsmWriter?.WriteLine($"{label}_end:");
            stack.ReleaseDataRegister(val_hi);
            stack.ReleaseDataRegister(val_lo);
            stack.Push("D0");
        }
    }
}