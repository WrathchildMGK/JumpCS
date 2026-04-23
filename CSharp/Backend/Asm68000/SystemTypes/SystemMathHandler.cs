using System.Reflection;
using JumpCS.Backend.Base;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;

namespace JumpCS.Backend.Asm68000.SystemTypes
{
    /// <summary>Handler for System.Math type operations</summary>
    public class SystemMathHandler : SystemHandlerBase, ISystemMathHandler
    {
        private readonly Func<string> _getUniqueLabel;

        public SystemMathHandler(
            StreamWriter asmWriter,
            Func<IBackendStackSimulator, string> getAvailableRegister,
            Func<string> getUniqueLabel = null)
            : base(asmWriter, getAvailableRegister)
        {
            _getUniqueLabel = getUniqueLabel ?? (() => $"L_{Guid.NewGuid().ToString("N").Substring(0, 8)}");
        }

        public override bool IsMethod(MethodMetadata method)
        {
            return method.OwningClass.FullName == "System.Math";
        }

        public override bool IsReflectionMethod(MethodBase method)
        {
            return method.DeclaringType?.FullName == "System.Math";
        }

        public override void HandleMethodCall(MethodMetadata method, IBackendStackSimulator stack)
        {
            // System.Math methods typically come from reflection, not compiled metadata
            AsmWriter?.WriteLine($"    ; TODO: System.Math.{method.Name}");
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            string methodName = methodInfo.Name;
            var parameters = ((MethodInfo)methodInfo).GetParameters();
            int paramCount = parameters.Length;

            // Route to specific handler based on method name and parameter count
            if (methodName == "Round")
            {
                HandleMathRound(methodInfo, parameters, stack);
            }
            else if (methodName == "Sqrt")
            {
                HandleSqrt(stack);
            }
            else if (methodName == "Pow")
            {
                HandlePow(stack);
            }
            else if (methodName == "Log")
            {
                HandleLog(stack);
            }
            else if (methodName == "Sin")
            {
                HandleSin(stack);
            }
            else if (methodName == "Cos")
            {
                HandleCos(stack);
            }
            else if (methodName == "Abs")
            {
                HandleAbs(methodInfo, parameters, stack);
            }
            else if (methodName == "Truncate")
            {
                HandleMathTruncate(methodInfo, parameters, stack);
            }
            else if (methodName == "Floor")
            {
                HandleMathFloor(methodInfo, parameters, stack);
            }
            else if (methodName == "Ceiling")
            {
                HandleMathCeiling(methodInfo, parameters, stack);
            }
            else
            {
                // Stub for unimplemented Math functions
                AsmWriter?.WriteLine($"    ; System.Math.{methodName} - {paramCount} parameters (stub)");

                // Pop all arguments
                for (int i = 0; i < paramCount; i++)
                {
                    try
                    {
                        stack.Pop();
                    }
                    catch (Exception ex)
                    {
                        AsmWriter?.WriteLine($"    ; WARNING: Could not pop argument {i}: {ex.Message}");
                    }
                }

                // Push return value if non-void
                var returnType = ((MethodInfo)methodInfo).ReturnType;
                if (returnType != typeof(void))
                {
                    string resultReg = GetAvailableRegister(stack);
                    AsmWriter?.WriteLine($"    MOVE.L #0,{resultReg}     ; TODO: {methodName} result");
                    stack.Push(resultReg);
                }
            }
        }

        /// <summary>Handle System.Math.Round with multiple signatures</summary>
        private void HandleMathRound(MethodBase methodInfo, ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            var parameterType = parameters.Length > 0 ? parameters[0].ParameterType : null;

            AsmWriter?.WriteLine($"    ; System.Math.Round (library call) - {parameters.Length} parameters");

            if (parameterType == typeof(double) && parameters.Length == 2 && parameters[1].ParameterType == typeof(int))
            {
                // Round(double value, int digits) - most common case
                HandleRoundDoubleWithDigits(stack);
            }
            else if (parameterType == typeof(double) && parameters.Length == 1)
            {
                // Round(double value) - round to nearest integer
                HandleRoundDoubleNoDigits(stack);
            }
            else if (parameterType == typeof(decimal) && parameters.Length == 1)
            {
                // Round(decimal value)
                HandleRoundDecimalNoDigits(stack);
            }
            else if (parameterType == typeof(decimal) && parameters.Length == 2 && parameters[1].ParameterType == typeof(int))
            {
                // Round(decimal value, int digits) - CRITICAL for tests
                HandleRoundDecimalWithDigits(stack);
            }
            else if (parameterType == typeof(decimal) && parameters.Length == 3)
            {
                // Round(decimal value, int digits, MidpointRounding mode)
                HandleRoundDecimalWithMode(stack);
            }
            else
            {
                // Unknown signature - pop args and push stub result
                for (int i = 0; i < parameters.Length; i++)
                {
                    try { stack.Pop(); } catch { }
                }
                string resultReg = GetAvailableRegister(stack);
                AsmWriter?.WriteLine($"    MOVE.L #0,{resultReg}     ; TODO: Round with unknown signature");
                stack.Push(resultReg);
            }
        }

        /// <summary>Round(double value, int digits) - Library call version</summary>
        private void HandleRoundDoubleWithDigits(IBackendStackSimulator stack)
        {
            // Pop arguments (in reverse order for stack)
            string digitsReg = stack.Pop();    // digits (int)
            // Double takes 2 registers (D0 for high, D1 for low)
            string doubleLowReg = stack.Pop();
            string doubleHighReg = stack.Pop();

            AsmWriter?.WriteLine($"    ; Round(double, {digitsReg}) - Library call");
            AsmWriter?.WriteLine($"    MOVE.L {doubleHighReg},D0   ; Double high word to D0");
            AsmWriter?.WriteLine($"    MOVE.L {doubleLowReg},D1    ; Double low word to D1");
            AsmWriter?.WriteLine($"    MOVE.L {digitsReg},D2       ; Digits parameter to D2");
            AsmWriter?.WriteLine($"    JSR Math_RoundDouble");
            AsmWriter?.WriteLine($"    ; Result in D0:D1");

            stack.ReleaseDataRegister(doubleHighReg);
            stack.ReleaseDataRegister(doubleLowReg);
            stack.ReleaseDataRegister(digitsReg);

            stack.Push("D0");
            stack.Push("D1");
        }

        /// <summary>Round(double value) - round to nearest integer</summary>
        private void HandleRoundDoubleNoDigits(IBackendStackSimulator stack)
        {
            // Pop arguments
            string doubleLowReg = stack.Pop();
            string doubleHighReg = stack.Pop();

            AsmWriter?.WriteLine($"    ; Round(double) - Library call");
            AsmWriter?.WriteLine($"    MOVE.L {doubleHighReg},D0");
            AsmWriter?.WriteLine($"    MOVE.L {doubleLowReg},D1");
            AsmWriter?.WriteLine($"    JSR Math_RoundDouble_NoDigits");
            AsmWriter?.WriteLine($"    ; Result in D0:D1");

            stack.ReleaseDataRegister(doubleHighReg);
            stack.ReleaseDataRegister(doubleLowReg);

            stack.Push("D0");
            stack.Push("D1");
        }

        /// <summary>Round(decimal value) - round decimal to integer</summary>
        private void HandleRoundDecimalNoDigits(IBackendStackSimulator stack)
        {
            string decimalAddrReg = stack.Pop();

            AsmWriter?.WriteLine($"    ; Round(decimal) - Library call");
            AsmWriter?.WriteLine($"    MOVE.L {decimalAddrReg},A0");
            AsmWriter?.WriteLine($"    LEA -32(A6),A1              ; Result buffer");
            AsmWriter?.WriteLine($"    JSR Math_RoundDecimal_NoDigits");
            AsmWriter?.WriteLine($"    ; Result in A1 (A6-32)");

            stack.ReleaseDataRegister(decimalAddrReg);

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    LEA -32(A6),{resultReg}");
            stack.Push(resultReg);
        }

        /// <summary>Round(decimal value, int digits) - round decimal to N places - CRITICAL FOR TESTS</summary>
        private void HandleRoundDecimalWithDigits(IBackendStackSimulator stack)
        {
            string digitsReg = stack.Pop();    // digits parameter
            string decimalAddrReg = stack.Pop(); // decimal address

            AsmWriter?.WriteLine($"    ; Round(decimal, {digitsReg}) - Library call");
            AsmWriter?.WriteLine($"    MOVE.L {decimalAddrReg},A0   ; Decimal address to A0");
            AsmWriter?.WriteLine($"    MOVE.L {digitsReg},D0        ; Digits to D0");
            AsmWriter?.WriteLine($"    LEA -32(A6),A1              ; Result buffer to A1");
            AsmWriter?.WriteLine($"    JSR Math_RoundDecimal_WithDigits");
            AsmWriter?.WriteLine($"    ; Result in A1 (A6-32)");

            stack.ReleaseDataRegister(decimalAddrReg);
            stack.ReleaseDataRegister(digitsReg);

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    LEA -32(A6),{resultReg}");
            stack.Push(resultReg);
        }

        /// <summary>Round(decimal value, int digits, MidpointRounding mode) - with rounding mode</summary>
        private void HandleRoundDecimalWithMode(IBackendStackSimulator stack)
        {
            string modeReg = stack.Pop();        // MidpointRounding enum
            string digitsReg = stack.Pop();      // digits parameter
            string decimalAddrReg = stack.Pop(); // decimal address

            AsmWriter?.WriteLine($"    ; Round(decimal, {digitsReg}, mode) - Library call");
            AsmWriter?.WriteLine($"    MOVE.L {decimalAddrReg},A0");
            AsmWriter?.WriteLine($"    MOVE.L {digitsReg},D0");
            AsmWriter?.WriteLine($"    MOVE.L {modeReg},D1");
            AsmWriter?.WriteLine($"    LEA -32(A6),A1");
            AsmWriter?.WriteLine($"    JSR Math_RoundDecimal_WithMode");

            stack.ReleaseDataRegister(decimalAddrReg);
            stack.ReleaseDataRegister(digitsReg);
            stack.ReleaseDataRegister(modeReg);

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    LEA -32(A6),{resultReg}");
            stack.Push(resultReg);
        }

        /// <summary>Handle System.Math.Abs with multiple signatures</summary>
        private void HandleAbs(MethodBase methodInfo, ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            if (parameters.Length == 0)
            {
                AsmWriter?.WriteLine($"    ; Math.Abs - no parameters (error)");
                return;
            }

            var paramType = parameters[0].ParameterType;

            if (paramType == typeof(int))
            {
                HandleAbsInt(stack);
            }
            else if (paramType == typeof(long))
            {
                HandleAbsLong(stack);
            }
            else if (paramType == typeof(float))
            {
                HandleAbsFloat(stack);
            }
            else if (paramType == typeof(double))
            {
                HandleAbsDouble(stack);
            }
            else if (paramType == typeof(decimal))
            {
                HandleAbsDecimal(stack);
            }
            else
            {
                AsmWriter?.WriteLine($"    ; Math.Abs - unknown type");
                string val = stack.Pop();
                stack.Push(val);
            }
        }

        private void HandleAbsInt(IBackendStackSimulator stack)
        {
            string valueReg = stack.Pop();
            AsmWriter?.WriteLine($"    ; Math.Abs(int) - Library call");
            AsmWriter?.WriteLine($"    MOVE.L {valueReg},D0");
            AsmWriter?.WriteLine($"    JSR Math_Abs_Int");
            AsmWriter?.WriteLine($"    ; Result in D0");
            stack.Push("D0");
        }

        private void HandleAbsLong(IBackendStackSimulator stack)
        {
            string lowReg = stack.Pop();
            string highReg = stack.Pop();
            AsmWriter?.WriteLine($"    ; Math.Abs(long) - Library call");
            AsmWriter?.WriteLine($"    MOVE.L {highReg},D0");
            AsmWriter?.WriteLine($"    MOVE.L {lowReg},D1");
            AsmWriter?.WriteLine($"    JSR Math_Abs_Long");
            AsmWriter?.WriteLine($"    ; Result in D0:D1");
            stack.Push("D0");
            stack.Push("D1");
        }

        private void HandleAbsFloat(IBackendStackSimulator stack)
        {
            string valueReg = stack.Pop();
            AsmWriter?.WriteLine($"    ; Math.Abs(float) - Library call");
            AsmWriter?.WriteLine($"    MOVE.L {valueReg},D0");
            AsmWriter?.WriteLine($"    JSR Math_Abs_Float");
            stack.Push("D0");
        }

        private void HandleAbsDouble(IBackendStackSimulator stack)
        {
            string lowReg = stack.Pop();
            string highReg = stack.Pop();
            AsmWriter?.WriteLine($"    ; Math.Abs(double) - Library call");
            AsmWriter?.WriteLine($"    MOVE.L {highReg},D0");
            AsmWriter?.WriteLine($"    MOVE.L {lowReg},D1");
            AsmWriter?.WriteLine($"    JSR Math_Abs_Double");
            AsmWriter?.WriteLine($"    ; Result in D0:D1");
            stack.Push("D0");
            stack.Push("D1");
        }

        private void HandleAbsDecimal(IBackendStackSimulator stack)
        {
            string decimalAddrReg = stack.Pop();
            AsmWriter?.WriteLine($"    ; Math.Abs(decimal) - Library call");
            AsmWriter?.WriteLine($"    MOVE.L {decimalAddrReg},A0");
            AsmWriter?.WriteLine($"    LEA -32(A6),A1");
            AsmWriter?.WriteLine($"    JSR System_Decimal_Abs");
            stack.Push("D0");
        }

        /// <summary>Handle System.Math.Truncate</summary>
        private void HandleMathTruncate(MethodBase methodInfo, ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            if (parameters.Length == 0 || parameters[0].ParameterType == typeof(double))
            {
                // Double truncate
                string lowReg = stack.Pop();
                string highReg = stack.Pop();
                AsmWriter?.WriteLine($"    ; Truncate(double) - Library call");
                AsmWriter?.WriteLine($"    MOVE.L {highReg},D0");
                AsmWriter?.WriteLine($"    MOVE.L {lowReg},D1");
                AsmWriter?.WriteLine($"    JSR Math_Truncate_Double");
                stack.Push("D0");
                stack.Push("D1");
            }
            else
            {
                // Decimal truncate
                string decimalAddrReg = stack.Pop();
                AsmWriter?.WriteLine($"    ; Truncate(decimal) - Library call");
                AsmWriter?.WriteLine($"    MOVE.L {decimalAddrReg},A0");
                AsmWriter?.WriteLine($"    LEA -32(A6),A1");
                AsmWriter?.WriteLine($"    JSR Math_Truncate_Decimal");
                stack.Push("D0");
            }
        }

        /// <summary>Handle System.Math.Floor</summary>
        private void HandleMathFloor(MethodBase methodInfo, ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            if (parameters.Length == 0 || parameters[0].ParameterType == typeof(double))
            {
                string lowReg = stack.Pop();
                string highReg = stack.Pop();
                AsmWriter?.WriteLine($"    ; Floor(double) - Library call");
                AsmWriter?.WriteLine($"    MOVE.L {highReg},D0");
                AsmWriter?.WriteLine($"    MOVE.L {lowReg},D1");
                AsmWriter?.WriteLine($"    JSR Math_Floor_Double");
                stack.Push("D0");
                stack.Push("D1");
            }
            else
            {
                string decimalAddrReg = stack.Pop();
                AsmWriter?.WriteLine($"    ; Floor(decimal) - Library call");
                AsmWriter?.WriteLine($"    MOVE.L {decimalAddrReg},A0");
                AsmWriter?.WriteLine($"    LEA -32(A6),A1");
                AsmWriter?.WriteLine($"    JSR Math_Floor_Decimal");
                stack.Push("D0");
            }
        }

        /// <summary>Handle System.Math.Ceiling</summary>
        private void HandleMathCeiling(MethodBase methodInfo, ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            if (parameters.Length == 0 || parameters[0].ParameterType == typeof(double))
            {
                string lowReg = stack.Pop();
                string highReg = stack.Pop();
                AsmWriter?.WriteLine($"    ; Ceiling(double) - Library call");
                AsmWriter?.WriteLine($"    MOVE.L {highReg},D0");
                AsmWriter?.WriteLine($"    MOVE.L {lowReg},D1");
                AsmWriter?.WriteLine($"    JSR Math_Ceiling_Double");
                stack.Push("D0");
                stack.Push("D1");
            }
            else
            {
                string decimalAddrReg = stack.Pop();
                AsmWriter?.WriteLine($"    ; Ceiling(decimal) - Library call");
                AsmWriter?.WriteLine($"    MOVE.L {decimalAddrReg},A0");
                AsmWriter?.WriteLine($"    LEA -32(A6),A1");
                AsmWriter?.WriteLine($"    JSR Math_Ceiling_Decimal");
                stack.Push("D0");
            }
        }

        /// <summary>Handle System.Math.Sqrt</summary>
        private void HandleSqrt(IBackendStackSimulator stack)
        {
            // Math.Sqrt(double) → double
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();
            AsmWriter?.WriteLine($"    ; Sqrt(double) - Library call");
            AsmWriter?.WriteLine($"    MOVE.L {val_hi},D0");
            AsmWriter?.WriteLine($"    MOVE.L {val_lo},D1");
            AsmWriter?.WriteLine($"    JSR Math_Sqrt");
            stack.ReleaseDataRegister(val_hi);
            stack.ReleaseDataRegister(val_lo);
            stack.Push("D0");
            stack.Push("D1");
        }

        /// <summary>Handle System.Math.Pow</summary>
        private void HandlePow(IBackendStackSimulator stack)
        {
            // Math.Pow(double base, double exponent) → double
            string exp_lo = stack.Pop();
            string exp_hi = stack.Pop();
            string base_lo = stack.Pop();
            string base_hi = stack.Pop();
            AsmWriter?.WriteLine($"    ; Pow(double, double) - Library call");
            AsmWriter?.WriteLine($"    MOVE.L {base_hi},D0");
            AsmWriter?.WriteLine($"    MOVE.L {base_lo},D1");
            AsmWriter?.WriteLine($"    MOVE.L {exp_hi},D2");
            AsmWriter?.WriteLine($"    MOVE.L {exp_lo},D3");
            AsmWriter?.WriteLine($"    JSR Math_Pow");
            stack.ReleaseDataRegister(base_hi);
            stack.ReleaseDataRegister(base_lo);
            stack.ReleaseDataRegister(exp_hi);
            stack.ReleaseDataRegister(exp_lo);
            stack.Push("D0");
            stack.Push("D1");
        }

        /// <summary>Handle System.Math.Log</summary>
        private void HandleLog(IBackendStackSimulator stack)
        {
            // Math.Log(double) → double
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();
            AsmWriter?.WriteLine($"    ; Log(double) - Library call");
            AsmWriter?.WriteLine($"    MOVE.L {val_hi},D0");
            AsmWriter?.WriteLine($"    MOVE.L {val_lo},D1");
            AsmWriter?.WriteLine($"    JSR Math_Log");
            stack.ReleaseDataRegister(val_hi);
            stack.ReleaseDataRegister(val_lo);
            stack.Push("D0");
            stack.Push("D1");
        }

        /// <summary>Handle System.Math.Sin</summary>
        private void HandleSin(IBackendStackSimulator stack)
        {
            // Math.Sin(double) → double
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();
            AsmWriter?.WriteLine($"    ; Sin(double) - Library call");
            AsmWriter?.WriteLine($"    MOVE.L {val_hi},D0");
            AsmWriter?.WriteLine($"    MOVE.L {val_lo},D1");
            AsmWriter?.WriteLine($"    JSR Math_Sin");
            stack.ReleaseDataRegister(val_hi);
            stack.ReleaseDataRegister(val_lo);
            stack.Push("D0");
            stack.Push("D1");
        }

        /// <summary>Handle System.Math.Cos</summary>
        private void HandleCos(IBackendStackSimulator stack)
        {
            // Math.Cos(double) → double
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();
            AsmWriter?.WriteLine($"    ; Cos(double) - Library call");
            AsmWriter?.WriteLine($"    MOVE.L {val_hi},D0");
            AsmWriter?.WriteLine($"    MOVE.L {val_lo},D1");
            AsmWriter?.WriteLine($"    JSR Math_Cos");
            stack.ReleaseDataRegister(val_hi);
            stack.ReleaseDataRegister(val_lo);
            stack.Push("D0");
            stack.Push("D1");
        }
    }
}