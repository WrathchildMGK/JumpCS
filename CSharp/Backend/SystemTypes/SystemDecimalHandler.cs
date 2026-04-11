using System.Reflection;
using System.Text;
using JumpCS.Core;

namespace JumpCS.Backend.SystemTypes
{
    /// <summary>Handler for System.Decimal type operations</summary>
    public class SystemDecimalHandler
    {
        private readonly StreamWriter _asmWriter;
        private readonly Func<Asm68000StackSimulator, string> _getAvailableRegister;
        private readonly Func<string> _getUniqueLabel;

        // Register names
        private const string D0 = "D0";
        private const string D1 = "D1";
        private const string D2 = "D2";

        public SystemDecimalHandler(
            StreamWriter asmWriter,
            Func<Asm68000StackSimulator, string> getAvailableRegister,
            Func<string> getUniqueLabel)
        {
            _asmWriter = asmWriter;
            _getAvailableRegister = getAvailableRegister;
            _getUniqueLabel = getUniqueLabel;
        }

        public bool IsDecimalConstructor(MethodMetadata method)
        {
            return method.OwningClass.FullName == "System.Decimal" && method.IsConstructor;
        }

        public bool IsDecimalMethod(MethodMetadata method)
        {
            return method.OwningClass.FullName == "System.Decimal" && 
                   (method.Name == "op_Addition" || method.Name == "op_Subtraction" || 
                    method.Name == "Equals" || method.Name == ".ctor");
        }

        public bool IsReflectionDecimalMethod(MethodBase method)
        {
            return method.DeclaringType?.FullName == "System.Decimal";
        }

        public void HandleMethodCall(MethodMetadata method, Asm68000StackSimulator stack)
        {
            if (method.Name == "op_Addition")
            {
                HandleAddition(stack);
            }
            else if (method.Name == "op_Subtraction")
            {
                HandleSubtraction(stack);
            }
            else if (method.Name == "Equals")
            {
                HandleEquals(stack);
            }
            else
            {
                _asmWriter?.WriteLine($"    ; TODO: System.Decimal.{method.Name}");
            }
        }

        public void HandleReflectionMethodCall(MethodBase methodInfo, Asm68000StackSimulator stack)
        {
            string methodName = methodInfo.Name;
            _asmWriter?.WriteLine($"    ; System.Decimal.{methodName} (inline)");

            if (methodName == ".ctor")
            {
                HandleConstructor(methodInfo, stack);
            }
            else if (methodName == "op_Addition")
            {
                HandleAddition(stack);
            }
            else if (methodName == "op_Subtraction")
            {
                HandleSubtraction(stack);
            }
            else if (methodName == "op_Multiply")
            {
                HandleBinaryOperator(stack, "op_Multiply", "*");
            }
            else if (methodName == "op_Division")
            {
                HandleBinaryOperator(stack, "op_Division", "/");
            }
            else if (methodName == "op_Modulus")
            {
                HandleBinaryOperator(stack, "op_Modulus", "%");
            }
            else if (methodName == "op_UnaryNegation")
            {
                HandleUnaryOperator(stack, "op_UnaryNegation", "-");
            }
            else if (methodName == "op_LessThan")
            {
                HandleComparisonOperator(stack, "op_LessThan", "<");
            }
            else if (methodName == "op_GreaterThan")
            {
                HandleComparisonOperator(stack, "op_GreaterThan", ">");
            }
            else if (methodName == "op_LessThanOrEqual")
            {
                HandleComparisonOperator(stack, "op_LessThanOrEqual", "<=");
            }
            else if (methodName == "op_GreaterThanOrEqual")
            {
                HandleComparisonOperator(stack, "op_GreaterThanOrEqual", ">=");
            }
            else if (methodName == "op_Equality")
            {
                HandleComparisonOperator(stack, "op_Equality", "==");
            }
            else if (methodName == "op_Inequality")
            {
                HandleComparisonOperator(stack, "op_Inequality", "!=");
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
                _asmWriter?.WriteLine($"    ; TODO: System.Decimal.{methodName}");
                // Generic fallback
                if (methodInfo is MethodInfo mi)
                {
                    var paramCount = mi.GetParameters().Length;
                    for (int i = 0; i < paramCount; i++)
                    {
                        try { stack.Pop(); } catch { }
                    }
                    if (mi.ReturnType != typeof(void))
                    {
                        string resultReg = _getAvailableRegister(stack);
                        stack.Push(resultReg);
                    }
                }
            }
        }

        public void HandleNewObj(MethodBase methodInfo, Asm68000StackSimulator stack)
        {
            var parameters = methodInfo.GetParameters();
            _asmWriter?.WriteLine($"    ; System.Decimal newobj - create new instance ({parameters.Length} parameters)");

            var parameterValues = new List<string>();
            for (int i = 0; i < parameters.Length; i++)
            {
                try
                {
                    parameterValues.Add(stack.Pop());
                }
                catch
                {
                    _asmWriter?.WriteLine($"    ; WARNING: Could not pop parameter {i}");
                    parameterValues.Add("D0");
                }
            }
            parameterValues.Reverse();

            if (parameterValues.Count == 5)
            {
                string scale = parameterValues[4];
                string isNegative = parameterValues[3];
                string hi = parameterValues[2];
                string mid = parameterValues[1];
                string lo = parameterValues[0];

                string resultAddr = _getAvailableRegister(stack);
                _asmWriter?.WriteLine($"    LEA -32(A6),{resultAddr}  ; Allocate new Decimal instance");
                _asmWriter?.WriteLine($"    ; System.Decimal newobj inline");
                _asmWriter?.WriteLine($"    ; result @ {resultAddr}, lo={lo}, mid={mid}, hi={isNegative}, scale={scale}");

                string skipNegLabel = _getUniqueLabel();
                
                _asmWriter?.WriteLine($"    CLR.L D2                  ; Clear flags");
                _asmWriter?.WriteLine($"    AND.L #0xFF,{scale}      ; Ensure scale is 0-255");
                _asmWriter?.WriteLine($"    LSL.L #16,{scale}        ; Shift scale to bits 16-23");
                _asmWriter?.WriteLine($"    OR.L {scale},D2           ; Set scale in flags");
                
                _asmWriter?.WriteLine($"    TST.L {isNegative}        ; Check if negative");
                _asmWriter?.WriteLine($"    BEQ .SkipNegative_{skipNegLabel}");
                _asmWriter?.WriteLine($"    OR.L #0x80000000,D2      ; Set sign bit if negative");
                _asmWriter?.WriteLine($".SkipNegative_{skipNegLabel}:");

                _asmWriter?.WriteLine($"    MOVE.L D2,({resultAddr})    ; Store flags at offset 0");
                _asmWriter?.WriteLine($"    MOVE.L {hi},4({resultAddr}) ; Store high at offset 4");
                _asmWriter?.WriteLine($"    MOVE.L {lo},8({resultAddr}) ; Store low at offset 8");
                _asmWriter?.WriteLine($"    MOVE.L {mid},12({resultAddr}) ; Store mid at offset 12");
                
                _asmWriter?.WriteLine($"    ; newobj complete - push result address");
                stack.Push(resultAddr);
            }
            else
            {
                _asmWriter?.WriteLine($"    ; TODO: Decimal newobj with {parameterValues.Count} parameters (expected 5)");
                stack.Push("D0");
            }
        }

        private void HandleConstructor(MethodBase methodInfo, Asm68000StackSimulator stack)
        {
            var parameters = methodInfo.GetParameters();
            _asmWriter?.WriteLine($"    ; System.Decimal instance constructor (void) - {parameters.Length} parameters");

            var parameterValues = new List<string>();
            for (int i = 0; i < parameters.Length; i++)
            {
                try
                {
                    parameterValues.Add(stack.Pop());
                }
                catch
                {
                    _asmWriter?.WriteLine($"    ; WARNING: Could not pop parameter {i}");
                    parameterValues.Add("D0");
                }
            }
            parameterValues.Reverse();

            string thisAddr;
            try
            {
                thisAddr = stack.Pop();
            }
            catch
            {
                _asmWriter?.WriteLine($"    ; WARNING: Could not pop this");
                thisAddr = "D0";
            }

            if (parameterValues.Count == 5)
            {
                string scale = parameterValues[4];
                string isNegative = parameterValues[3];
                string hi = parameterValues[2];
                string mid = parameterValues[1];
                string lo = parameterValues[0];

                _asmWriter?.WriteLine($"    ; System.Decimal constructor inline");
                _asmWriter?.WriteLine($"    ; this @ {thisAddr}, lo={lo}, mid={mid}, hi={hi}, sign={isNegative}, scale={scale}");

                string skipNegLabel = _getUniqueLabel();
                
                _asmWriter?.WriteLine($"    CLR.L D2                  ; Clear flags");
                _asmWriter?.WriteLine($"    AND.L #0xFF,{scale}      ; Ensure scale is 0-255");
                _asmWriter?.WriteLine($"    LSL.L #16,{scale}        ; Shift scale to bits 16-23");
                _asmWriter?.WriteLine($"    OR.L {scale},D2           ; Set scale in flags");
                
                _asmWriter?.WriteLine($"    TST.L {isNegative}        ; Check if negative");
                _asmWriter?.WriteLine($"    BEQ .SkipNegative_{skipNegLabel}");
                _asmWriter?.WriteLine($"    OR.L #0x80000000,D2      ; Set sign bit if negative");
                _asmWriter?.WriteLine($".SkipNegative_{skipNegLabel}:");

                _asmWriter?.WriteLine($"    MOVE.L D2,({thisAddr})    ; Store flags at offset 0");
                _asmWriter?.WriteLine($"    MOVE.L {hi},4({thisAddr}) ; Store high at offset 4");
                _asmWriter?.WriteLine($"    MOVE.L {lo},8({thisAddr}) ; Store low at offset 8");
                _asmWriter?.WriteLine($"    MOVE.L {mid},12({thisAddr}) ; Store mid at offset 12");
                
                _asmWriter?.WriteLine($"    ; Decimal constructor complete (void - nothing pushed)");
                
                stack.Clear();
            }
            else
            {
                _asmWriter?.WriteLine($"    ; TODO: Decimal constructor with {parameterValues.Count} parameters (expected 5)");
                stack.Clear();
            }
        }

        private void HandleAddition(Asm68000StackSimulator stack)
        {
            _asmWriter?.WriteLine($"    ; System.Decimal op_Addition inline (simplified)");
            
            string rightAddr = stack.Pop();
            string leftAddr = stack.Pop();
            
            string resultAddr = _getAvailableRegister(stack);
            _asmWriter?.WriteLine($"    LEA -16(A6),{resultAddr}  ; Allocate result space");

            _asmWriter?.WriteLine($"    MOVE.L 8({leftAddr}),D0   ; Load left low");
            _asmWriter?.WriteLine($"    MOVE.L 8({rightAddr}),D1  ; Load right low");
            _asmWriter?.WriteLine($"    ADD.L D1,D0               ; Add low parts");
            _asmWriter?.WriteLine($"    MOVE.L D0,8({resultAddr}) ; Store result low");

            _asmWriter?.WriteLine($"    ; TODO: Complete decimal addition with carry");

            stack.Push(resultAddr);
        }

        private void HandleSubtraction(Asm68000StackSimulator stack)
        {
            _asmWriter?.WriteLine($"    ; System.Decimal op_Subtraction inline (simplified)");
            
            string rightAddr = stack.Pop();
            string leftAddr = stack.Pop();
            
            string resultAddr = _getAvailableRegister(stack);
            _asmWriter?.WriteLine($"    LEA -16(A6),{resultAddr}  ; Allocate result space");

            _asmWriter?.WriteLine($"    MOVE.L 8({leftAddr}),D0   ; Load left low");
            _asmWriter?.WriteLine($"    MOVE.L 8({rightAddr}),D1  ; Load right low");
            _asmWriter?.WriteLine($"    SUB.L D1,D0               ; Subtract low parts");
            _asmWriter?.WriteLine($"    MOVE.L D0,8({resultAddr}) ; Store result low");

            _asmWriter?.WriteLine($"    ; TODO: Complete decimal subtraction with borrow");

            stack.Push(resultAddr);
        }

        private void HandleBinaryOperator(Asm68000StackSimulator stack, string operatorName, string symbol)
        {
            string val2 = stack.Pop();
            string val1 = stack.Pop();
            _asmWriter?.WriteLine($"    ; TODO: {val1} {symbol} {val2}");
            string resultReg = _getAvailableRegister(stack);
            stack.Push(resultReg);
        }

        private void HandleUnaryOperator(Asm68000StackSimulator stack, string operatorName, string symbol)
        {
            string val = stack.Pop();
            string resultReg = _getAvailableRegister(stack);
            _asmWriter?.WriteLine($"    NEG.L {val}     ; Negate");
            if (resultReg != val)
            {
                _asmWriter?.WriteLine($"    MOVE.L {val},{resultReg}");
            }
            stack.Push(resultReg);
        }

        private void HandleComparisonOperator(Asm68000StackSimulator stack, string operatorName, string symbol)
        {
            string val2 = stack.Pop();
            string val1 = stack.Pop();
            _asmWriter?.WriteLine($"    ; TODO: {val1} {symbol} {val2}");
            string resultReg = _getAvailableRegister(stack);
            stack.Push(resultReg);
        }

        private void HandleCompareTo(Asm68000StackSimulator stack)
        {
            string val2 = stack.Pop();
            string val1 = stack.Pop();
            _asmWriter?.WriteLine($"    ; TODO: {val1}.CompareTo({val2})");
            string resultReg = _getAvailableRegister(stack);
            stack.Push(resultReg);
        }

        private void HandleEquals(Asm68000StackSimulator stack)
        {
            _asmWriter?.WriteLine($"    ; System.Decimal Equals inline");
            
            string rightAddr = stack.Pop();
            string leftAddr = stack.Pop();

            string resultReg = _getAvailableRegister(stack);
            
            string notEqualLabel = _getUniqueLabel();
            string doneLabel = _getUniqueLabel();

            _asmWriter?.WriteLine($"    MOVE.L #1,{resultReg}     ; Assume equal");
            
            _asmWriter?.WriteLine($"    MOVE.L ({leftAddr}),D0    ; Load left flags");
            _asmWriter?.WriteLine($"    CMP.L ({rightAddr}),D0    ; Compare flags");
            _asmWriter?.WriteLine($"    BNE .NotEqual_{notEqualLabel}");

            _asmWriter?.WriteLine($"    MOVE.L 4({leftAddr}),D0   ; Load left high");
            _asmWriter?.WriteLine($"    CMP.L 4({rightAddr}),D0   ; Compare high");
            _asmWriter?.WriteLine($"    BNE .NotEqual_{notEqualLabel}");

            _asmWriter?.WriteLine($"    MOVE.L 8({leftAddr}),D0   ; Load left low");
            _asmWriter?.WriteLine($"    CMP.L 8({rightAddr}),D0   ; Compare low");
            _asmWriter?.WriteLine($"    BNE .NotEqual_{notEqualLabel}");

            _asmWriter?.WriteLine($"    MOVE.L 12({leftAddr}),D0  ; Load left mid");
            _asmWriter?.WriteLine($"    CMP.L 12({rightAddr}),D0  ; Compare mid");
            _asmWriter?.WriteLine($"    BNE .NotEqual_{notEqualLabel}");

            _asmWriter?.WriteLine($"    BRA .EqualsDone_{doneLabel}");

            _asmWriter?.WriteLine($".NotEqual_{notEqualLabel}:");
            _asmWriter?.WriteLine($"    CLR.L {resultReg}         ; Not equal = false");

            _asmWriter?.WriteLine($".EqualsDone_{doneLabel}:");
            
            stack.Push(resultReg);
        }

        /// <summary>Handle System.Decimal method - checks type and routes appropriately</summary>
        public bool TryHandleDecimalMethod(
            MethodMetadata method,
            Asm68000StackSimulator stack)
        {
            if (!IsDecimalMethod(method))
                return false;

            HandleMethodCall(method, stack);
            return true;
        }

        /// <summary>Handle System.Decimal method via reflection - checks type and routes appropriately</summary>
        public bool TryHandleDecimalMethodByReflection(
            MethodBase methodInfo,
            Asm68000StackSimulator stack)
        {
            if (!IsReflectionDecimalMethod(methodInfo))
                return false;

            HandleReflectionMethodCall(methodInfo, stack);
            return true;
        }

        /// <summary>Handle System.Decimal newobj - checks type and routes appropriately</summary>
        public bool TryHandleDecimalNewObj(
            MethodBase methodInfo,
            Asm68000StackSimulator stack)
        {
            if (methodInfo?.DeclaringType?.FullName != "System.Decimal")
                return false;

            HandleNewObj(methodInfo, stack);
            return true;
        }
    }
}