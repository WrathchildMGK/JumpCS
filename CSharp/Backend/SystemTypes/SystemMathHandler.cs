using System.Reflection;
using System.Text;

namespace JumpCS.Backend.SystemTypes
{
    /// <summary>Handler for System.Math type operations</summary>
    public class SystemMathHandler : SystemHandlerBase
    {
        public SystemMathHandler(
            StreamWriter asmWriter,
            Func<Asm68000StackSimulator, string> getAvailableRegister)
            : base(asmWriter, getAvailableRegister)
        {
        }

        public override bool IsMethod(JumpCS.Core.MethodMetadata method)
        {
            return method.OwningClass.FullName == "System.Math";
        }

        public override bool IsReflectionMethod(MethodBase method)
        {
            return method.DeclaringType?.FullName == "System.Math";
        }

        public override void HandleMethodCall(JumpCS.Core.MethodMetadata method, Asm68000StackSimulator stack)
        {
            // System.Math methods typically come from reflection, not compiled metadata
            AsmWriter?.WriteLine($"    ; TODO: System.Math.{method.Name}");
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, Asm68000StackSimulator stack)
        {
            string methodName = methodInfo.Name;
            var parameters = ((MethodInfo)methodInfo).GetParameters();
            int paramCount = parameters.Length;
            
            // Route to specific handler based on method name and parameter count
            if (methodName == "Round")
            {
                HandleMathRound(methodInfo, parameters, stack);
            }
            else if (methodName == "Abs")
            {
                HandleMathAbs(methodInfo, parameters, stack);
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
        private void HandleMathRound(MethodBase methodInfo, ParameterInfo[] parameters, Asm68000StackSimulator stack)
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
        private void HandleRoundDoubleWithDigits(Asm68000StackSimulator stack)
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
        private void HandleRoundDoubleNoDigits(Asm68000StackSimulator stack)
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
        private void HandleRoundDecimalNoDigits(Asm68000StackSimulator stack)
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
        private void HandleRoundDecimalWithDigits(Asm68000StackSimulator stack)
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
        private void HandleRoundDecimalWithMode(Asm68000StackSimulator stack)
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

        /// <summary>Handle System.Math.Abs</summary>
        private void HandleMathAbs(MethodBase methodInfo, ParameterInfo[] parameters, Asm68000StackSimulator stack)
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
                // Decimal.Abs - address on stack
                string decimalAddr = stack.Pop();
                AsmWriter?.WriteLine($"    ; Decimal.Abs({decimalAddr})");
                AsmWriter?.WriteLine($"    ; TODO: Implement decimal absolute value");
                
                string resultReg = GetAvailableRegister(stack);
                AsmWriter?.WriteLine($"    MOVE.L {decimalAddr},{resultReg}");
                stack.Push(resultReg);
            }
            else if (paramType == typeof(double))
            {
                // Pop low part for double
                string lowReg = stack.Pop();
                string valueReg = stack.Pop();
                AsmWriter?.WriteLine($"    ; Double precision absolute value");
                AsmWriter?.WriteLine($"    AND.L #0x7FFFFFFF,{valueReg}  ; Clear sign bit");
                string resultHigh = GetAvailableRegister(stack);
                string resultLow = GetAvailableRegister(stack);
                AsmWriter?.WriteLine($"    MOVE.L {valueReg},{resultHigh}");
                AsmWriter?.WriteLine($"    MOVE.L {lowReg},{resultLow}");
                stack.Push(resultHigh);
                stack.Push(resultLow);
            }
            else if (paramType == typeof(float))
            {
                string valueReg = stack.Pop();
                AsmWriter?.WriteLine($"    AND.L #0x7FFFFFFF,{valueReg}  ; Clear sign bit");
                stack.Push(valueReg);
            }
            else
            {
                // For integer types
                string valueReg = stack.Pop();
                AsmWriter?.WriteLine($"    ; Absolute value for {paramType.Name}");
                string resultReg = GetAvailableRegister(stack);
                AsmWriter?.WriteLine($"    MOVE.L {valueReg},{resultReg}");
                AsmWriter?.WriteLine($"    TST.L {resultReg}");
                string skipLabel = Guid.NewGuid().ToString().Substring(0, 8);
                AsmWriter?.WriteLine($"    BGE .Skip_{skipLabel}");
                AsmWriter?.WriteLine($"    NEG.L {resultReg}");
                AsmWriter?.WriteLine($".Skip_{skipLabel}:");
                stack.Push(resultReg);
            }
        }

        /// <summary>Handle System.Math.Truncate</summary>
        private void HandleMathTruncate(MethodBase methodInfo, ParameterInfo[] parameters, Asm68000StackSimulator stack)
        {
            string valueReg = stack.Pop();
            AsmWriter?.WriteLine($"    ; Truncate - stub (return value unchanged)");
            stack.Push(valueReg);
        }

        /// <summary>Handle System.Math.Floor</summary>
        private void HandleMathFloor(MethodBase methodInfo, ParameterInfo[] parameters, Asm68000StackSimulator stack)
        {
            string valueReg = stack.Pop();
            AsmWriter?.WriteLine($"    ; Floor - stub (return value unchanged)");
            stack.Push(valueReg);
        }

        /// <summary>Handle System.Math.Ceiling</summary>
        private void HandleMathCeiling(MethodBase methodInfo, ParameterInfo[] parameters, Asm68000StackSimulator stack)
        {
            string valueReg = stack.Pop();
            AsmWriter?.WriteLine($"    ; Ceiling - stub (return value unchanged)");
            stack.Push(valueReg);
        }
    }
}