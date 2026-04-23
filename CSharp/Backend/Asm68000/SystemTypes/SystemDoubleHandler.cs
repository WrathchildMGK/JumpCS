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
            AsmWriter?.WriteLine($"    ; System.Double.{methodName} (library call)");

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

        /// <summary>Double addition - delegates to LIBGCC __adddf3</summary>
        public void HandleAddition(IBackendStackSimulator stack)
        {
            // Double addition: pop two doubles (4 regs total)
            string right_lo = stack.Pop();  // Low word of second double
            string right_hi = stack.Pop();  // High word of second double
            string left_lo = stack.Pop();   // Low word of first double
            string left_hi = stack.Pop();   // High word of first double

            // Setup arguments: left in D0/D1, right in D2/D3
            AsmWriter?.WriteLine($"    MOVE.L {left_hi},D0   ; Left high");
            AsmWriter?.WriteLine($"    MOVE.L {left_lo},D1   ; Left low");
            AsmWriter?.WriteLine($"    MOVE.L {right_hi},D2  ; Right high");
            AsmWriter?.WriteLine($"    MOVE.L {right_lo},D3  ; Right low");
            AsmWriter?.WriteLine($"    JSR __adddf3          ; IEEE 754 double addition");

            // Result is in D0/D1
            stack.ReleaseDataRegister(left_hi);
            stack.ReleaseDataRegister(left_lo);
            stack.ReleaseDataRegister(right_hi);
            stack.ReleaseDataRegister(right_lo);

            stack.Push("D0", isDoubleWord: true);
            stack.Push("D1", isDoubleWord: true);
        }

        /// <summary>Double subtraction - delegates to LIBGCC __subdf3</summary>
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

        /// <summary>Double multiplication - delegates to LIBGCC __muldf3</summary>
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

        /// <summary>Double division - delegates to LIBGCC __divdf3</summary>
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

        /// <summary>Double remainder - delegates to LIBGCC __fmod (or custom implementation)</summary>
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

        /// <summary>Double negation - flip sign bit (bit 63)</summary>
        private void HandleUnaryNegation(IBackendStackSimulator stack)
        {
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {val_hi},D0");
            AsmWriter?.WriteLine($"    MOVE.L {val_lo},D1");
            AsmWriter?.WriteLine($"    EORI.L #$80000000,D0  ; Flip sign bit (bit 63 of 64-bit value)");

            stack.ReleaseDataRegister(val_hi);
            stack.ReleaseDataRegister(val_lo);

            stack.Push("D0", isDoubleWord: true);
            stack.Push("D1", isDoubleWord: true);
        }

        /// <summary>Double equality - delegates to LIBGCC __eqdf2</summary>
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

            stack.ReleaseDataRegister(left_hi);
            stack.ReleaseDataRegister(left_lo);
            stack.ReleaseDataRegister(right_hi);
            stack.ReleaseDataRegister(right_lo);

            stack.Push("D0");
        }

        /// <summary>Double inequality - delegates to LIBGCC __nedf2</summary>
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

            stack.ReleaseDataRegister(left_hi);
            stack.ReleaseDataRegister(left_lo);
            stack.ReleaseDataRegister(right_hi);
            stack.ReleaseDataRegister(right_lo);

            stack.Push("D0");
        }

        /// <summary>Double less-than - delegates to LIBGCC __ltdf2</summary>
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

            stack.ReleaseDataRegister(left_hi);
            stack.ReleaseDataRegister(left_lo);
            stack.ReleaseDataRegister(right_hi);
            stack.ReleaseDataRegister(right_lo);

            stack.Push("D0");
        }

        /// <summary>Double greater-than - delegates to LIBGCC __gtdf2</summary>
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

            stack.ReleaseDataRegister(left_hi);
            stack.ReleaseDataRegister(left_lo);
            stack.ReleaseDataRegister(right_hi);
            stack.ReleaseDataRegister(right_lo);

            stack.Push("D0");
        }

        /// <summary>Double less-than-or-equal - delegates to LIBGCC __ledf2</summary>
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

            stack.Push("D0");
        }

        /// <summary>Double greater-than-or-equal - delegates to LIBGCC __gedf2</summary>
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

            stack.Push("D0");
        }

        /// <summary>Double Equals - check if two double values are equal</summary>
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

            stack.Push("D0");
        }

        /// <summary>Check if double is NaN - library call</summary>
        private void HandleIsNaN(IBackendStackSimulator stack)
        {
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {val_hi},D0");
            AsmWriter?.WriteLine($"    MOVE.L {val_lo},D1");
            AsmWriter?.WriteLine($"    JSR Double_IsNaN      ; Library function checks NaN");

            stack.ReleaseDataRegister(val_hi);
            stack.ReleaseDataRegister(val_lo);

            stack.Push("D0");
        }

        /// <summary>Check if double is positive or negative infinity - library call</summary>
        private void HandleIsInfinity(IBackendStackSimulator stack)
        {
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {val_hi},D0");
            AsmWriter?.WriteLine($"    MOVE.L {val_lo},D1");
            AsmWriter?.WriteLine($"    JSR Double_IsInfinity ; Library function checks infinity");

            stack.ReleaseDataRegister(val_hi);
            stack.ReleaseDataRegister(val_lo);

            stack.Push("D0");
        }

        /// <summary>Check if double is positive infinity - library call</summary>
        private void HandleIsPositiveInfinity(IBackendStackSimulator stack)
        {
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {val_hi},D0");
            AsmWriter?.WriteLine($"    MOVE.L {val_lo},D1");
            AsmWriter?.WriteLine($"    JSR Double_IsPositiveInfinity");

            stack.ReleaseDataRegister(val_hi);
            stack.ReleaseDataRegister(val_lo);

            stack.Push("D0");
        }

        /// <summary>Check if double is negative infinity - library call</summary>
        private void HandleIsNegativeInfinity(IBackendStackSimulator stack)
        {
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {val_hi},D0");
            AsmWriter?.WriteLine($"    MOVE.L {val_lo},D1");
            AsmWriter?.WriteLine($"    JSR Double_IsNegativeInfinity");

            stack.ReleaseDataRegister(val_hi);
            stack.ReleaseDataRegister(val_lo);

            stack.Push("D0");
        }
    }
}