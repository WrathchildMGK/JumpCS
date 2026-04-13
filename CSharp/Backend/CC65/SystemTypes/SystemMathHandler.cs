using System.Reflection;
using JumpCS.Backend.Base;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;

namespace JumpCS.Backend.CC65.SystemTypes
{
    /// <summary>Handler for System.Math type operations</summary>
    public class SystemMathHandler : SystemHandlerBase, ISystemMathHandler
    {
        public SystemMathHandler(
            StreamWriter asmWriter,
            Func<IBackendStackSimulator, string> getAvailableRegister)
            : base(asmWriter, getAvailableRegister)
        {
        }

        public override bool IsMethod(Core.MethodMetadata method)
        {
            return method.OwningClass.FullName == "System.Math";
        }

        public override bool IsReflectionMethod(MethodBase method)
        {
            return method.DeclaringType?.FullName == "System.Math";
        }

        public override void HandleMethodCall(Core.MethodMetadata method, IBackendStackSimulator stack)
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

            AsmWriter?.WriteLine($"    ; System.Math.Round (inline) - {parameters.Length} parameters");

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

        /// <summary>Round(double value, int digits) - most common case in tests</summary>
        private void HandleRoundDoubleWithDigits(IBackendStackSimulator stack)
        {
            // Pop arguments (in reverse order for stack)
            string digitsReg = stack.Pop();    // digits (int)
            // Double takes 2 registers (D0 for high, D1 for low)
            string doubleLowReg = stack.Pop();
            string doubleHighReg = stack.Pop();

            AsmWriter?.WriteLine($"    ; Round({doubleHighReg}:{doubleLowReg}, {digitsReg}) - double precision rounding");
            AsmWriter?.WriteLine($"    ; TODO: Implement IEEE double rounding to {digitsReg} decimal places");
            AsmWriter?.WriteLine($"    ; For now: return double value unchanged");
            AsmWriter?.WriteLine($"    ; (Proper implementation requires FPU or fixed-point conversion)");

            // Return the double value (unchanged for now)
            string resultHigh = GetAvailableRegister(stack);
            string resultLow = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L {doubleHighReg},{resultHigh}  ; Copy high word");
            AsmWriter?.WriteLine($"    MOVE.L {doubleLowReg},{resultLow}    ; Copy low word");

            stack.Push(resultHigh);
            stack.Push(resultLow);
        }

        /// <summary>Round(double value) - round to nearest integer</summary>
        private void HandleRoundDoubleNoDigits(IBackendStackSimulator stack)
        {
            // Pop arguments
            string doubleLowReg = stack.Pop();
            string doubleHighReg = stack.Pop();

            AsmWriter?.WriteLine($"    ; Round({doubleHighReg}:{doubleLowReg}) - round to integer");
            AsmWriter?.WriteLine($"    ; TODO: Implement rounding to nearest integer");

            // Return the double value (unchanged for now)
            string resultHigh = GetAvailableRegister(stack);
            string resultLow = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L {doubleHighReg},{resultHigh}");
            AsmWriter?.WriteLine($"    MOVE.L {doubleLowReg},{resultLow}");

            stack.Push(resultHigh);
            stack.Push(resultLow);
        }

        /// <summary>Round(decimal value) - round decimal to integer</summary>
        private void HandleRoundDecimalNoDigits(IBackendStackSimulator stack)
        {
            string decimalAddrReg = stack.Pop();

            AsmWriter?.WriteLine($"    ; Round(decimal @ {decimalAddrReg}) - round to integer");
            AsmWriter?.WriteLine($"    ; TODO: Implement decimal rounding");

            // Return the decimal address (unchanged for now)
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L {decimalAddrReg},{resultReg}");

            stack.Push(resultReg);
        }

        /// <summary>Round(decimal value, int digits) - round decimal to N places - CRITICAL FOR TESTS</summary>
        private void HandleRoundDecimalWithDigits(IBackendStackSimulator stack)
        {
            string digitsReg = stack.Pop();    // digits parameter
            string decimalAddrReg = stack.Pop(); // decimal address

            AsmWriter?.WriteLine($"    ; System.Decimal.Round({decimalAddrReg}, {digitsReg}) - round to {digitsReg} places");
            AsmWriter?.WriteLine($"    ; Stub implementation: return decimal unchanged");
            AsmWriter?.WriteLine($"    ; (Proper rounding would require scale adjustment in flags word)");

            // For now: just return the decimal address unchanged
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L {decimalAddrReg},{resultReg}");

            stack.Push(resultReg);
        }

        /// <summary>Round(decimal value, int digits, MidpointRounding mode) - with rounding mode</summary>
        private void HandleRoundDecimalWithMode(IBackendStackSimulator stack)
        {
            string modeReg = stack.Pop();        // MidpointRounding enum
            string digitsReg = stack.Pop();      // digits parameter
            string decimalAddrReg = stack.Pop(); // decimal address

            AsmWriter?.WriteLine($"    ; System.Decimal.Round({decimalAddrReg}, {digitsReg}, mode={modeReg})");
            AsmWriter?.WriteLine($"    ; Stub: return decimal unchanged");

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L {decimalAddrReg},{resultReg}");

            stack.Push(resultReg);
        }

        /// <summary>Handle System.Math.Truncate</summary>
        private void HandleMathTruncate(MethodBase methodInfo, ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            string valueReg = stack.Pop();
            AsmWriter?.WriteLine($"    ; Truncate - stub (return value unchanged)");
            stack.Push(valueReg);
        }

        /// <summary>Handle System.Math.Floor</summary>
        private void HandleMathFloor(MethodBase methodInfo, ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            string valueReg = stack.Pop();
            AsmWriter?.WriteLine($"    ; Floor - stub (return value unchanged)");
            stack.Push(valueReg);
        }

        /// <summary>Handle System.Math.Ceiling</summary>
        private void HandleMathCeiling(MethodBase methodInfo, ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            string valueReg = stack.Pop();
            AsmWriter?.WriteLine($"    ; Ceiling - stub (return value unchanged)");
            stack.Push(valueReg);
        }

        /// <summary>Handle System.Math.Sqrt</summary>
        private void HandleSqrt(IBackendStackSimulator stack)
        {
            // Math.Sqrt(double) → double
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();
            AsmWriter?.WriteLine($"    MOVE.L {val_hi},D0   ; Sqrt: input high");
            AsmWriter?.WriteLine($"    MOVE.L {val_lo},D1   ; Sqrt: input low");
            AsmWriter?.WriteLine($"    JSR __sqrt            ; IEEE 754 double square root");
            stack.ReleaseDataRegister(val_hi);
            stack.ReleaseDataRegister(val_lo);
            stack.Push("D0", isDoubleWord: true);
            stack.Push("D1", isDoubleWord: true);
        }

        /// <summary>Handle System.Math.Pow</summary>
        private void HandlePow(IBackendStackSimulator stack)
        {
            // Math.Pow(double base, double exponent) → double
            string exp_lo = stack.Pop();
            string exp_hi = stack.Pop();
            string base_lo = stack.Pop();
            string base_hi = stack.Pop();
            AsmWriter?.WriteLine($"    MOVE.L {base_hi},D0  ; Pow: base high");
            AsmWriter?.WriteLine($"    MOVE.L {base_lo},D1  ; Pow: base low");
            AsmWriter?.WriteLine($"    MOVE.L {exp_hi},D2   ; Pow: exponent high");
            AsmWriter?.WriteLine($"    MOVE.L {exp_lo},D3   ; Pow: exponent low");
            AsmWriter?.WriteLine($"    JSR __pow             ; IEEE 754 double power");
            stack.ReleaseDataRegister(base_hi);
            stack.ReleaseDataRegister(base_lo);
            stack.ReleaseDataRegister(exp_hi);
            stack.ReleaseDataRegister(exp_lo);
            stack.Push("D0", isDoubleWord: true);
            stack.Push("D1", isDoubleWord: true);
        }

        /// <summary>Handle System.Math.Log</summary>
        private void HandleLog(IBackendStackSimulator stack)
        {
            // Math.Log(double) → double (natural log)
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();
            AsmWriter?.WriteLine($"    MOVE.L {val_hi},D0   ; Log: input high");
            AsmWriter?.WriteLine($"    MOVE.L {val_lo},D1   ; Log: input low");
            AsmWriter?.WriteLine($"    JSR __log             ; IEEE 754 double natural log");
            stack.ReleaseDataRegister(val_hi);
            stack.ReleaseDataRegister(val_lo);
            stack.Push("D0", isDoubleWord: true);
            stack.Push("D1", isDoubleWord: true);
        }

        /// <summary>Handle System.Math.Sin</summary>
        private void HandleSin(IBackendStackSimulator stack)
        {
            // Math.Sin(double) → double
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();
            AsmWriter?.WriteLine($"    MOVE.L {val_hi},D0   ; Sin: input high");
            AsmWriter?.WriteLine($"    MOVE.L {val_lo},D1   ; Sin: input low");
            AsmWriter?.WriteLine($"    JSR __sin             ; IEEE 754 double sine");
            stack.ReleaseDataRegister(val_hi);
            stack.ReleaseDataRegister(val_lo);
            stack.Push("D0", isDoubleWord: true);
            stack.Push("D1", isDoubleWord: true);
        }

        /// <summary>Handle System.Math.Cos</summary>
        private void HandleCos(IBackendStackSimulator stack)
        {
            // Math.Cos(double) → double
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();
            AsmWriter?.WriteLine($"    MOVE.L {val_hi},D0   ; Cos: input high");
            AsmWriter?.WriteLine($"    MOVE.L {val_lo},D1   ; Cos: input low");
            AsmWriter?.WriteLine($"    JSR __cos             ; IEEE 754 double cosine");
            stack.ReleaseDataRegister(val_hi);
            stack.ReleaseDataRegister(val_lo);
            stack.Push("D0", isDoubleWord: true);
            stack.Push("D1", isDoubleWord: true);
        }

        /// <summary>Handle System.Math.Abs</summary>
        private void HandleAbs(MethodBase methodInfo, ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            if (parameters.Length == 0)
            {
                AsmWriter?.WriteLine($"    ; Abs() - no parameters (error)");
                string resultReg = GetAvailableRegister(stack);
                stack.Push(resultReg);
                return;
            }

            var paramType = parameters[0].ParameterType;

            if (paramType == typeof(decimal))
            {
                string decimalAddr = stack.Pop();
                AsmWriter?.WriteLine($"    ; Decimal.Abs({decimalAddr})");
                AsmWriter?.WriteLine($"    ; TODO: Implement decimal absolute value");
                string resultReg = GetAvailableRegister(stack);
                AsmWriter?.WriteLine($"    MOVE.L {decimalAddr},{resultReg}");
                stack.ReleaseDataRegister(decimalAddr);
                stack.Push(resultReg);
            }
            else if (paramType == typeof(double))
            {
                string val_lo = stack.Pop();
                string val_hi = stack.Pop();
                AsmWriter?.WriteLine($"    ; Double precision absolute value");
                AsmWriter?.WriteLine($"    MOVE.L {val_hi},D0");
                AsmWriter?.WriteLine($"    MOVE.L {val_lo},D1");
                AsmWriter?.WriteLine($"    ANDI.L #$7FFFFFFF,D0 ; Clear sign bit (IEEE 754 abs)");
                stack.ReleaseDataRegister(val_hi);
                stack.ReleaseDataRegister(val_lo);
                stack.Push("D0", isDoubleWord: true);
                stack.Push("D1", isDoubleWord: true);
            }
            else if (paramType == typeof(float))
            {
                string valueReg = stack.Pop();
                string resultReg = GetAvailableRegister(stack);
                AsmWriter?.WriteLine($"    MOVE.L {valueReg},{resultReg}");
                AsmWriter?.WriteLine($"    ANDI.L #$7FFFFFFF,{resultReg} ; Clear sign bit (IEEE 754 float abs)");
                stack.ReleaseDataRegister(valueReg);
                stack.Push(resultReg);
            }
            else
            {
                // Integer types
                string valueReg = stack.Pop();
                string resultReg = GetAvailableRegister(stack);
                AsmWriter?.WriteLine($"    MOVE.L {valueReg},{resultReg}");
                AsmWriter?.WriteLine($"    TST.L {resultReg}");
                AsmWriter?.WriteLine($"    BPL .+4");
                AsmWriter?.WriteLine($"    NEG.L {resultReg}    ; Integer abs");
                stack.ReleaseDataRegister(valueReg);
                stack.Push(resultReg);
            }
        }
    }
}