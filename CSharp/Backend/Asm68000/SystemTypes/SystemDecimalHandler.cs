using System.Reflection;
using JumpCS.Backend.Base;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;

namespace JumpCS.Backend.Asm68000.SystemTypes
{
    /// <summary>Handler for System.Decimal type operations</summary>
    public class SystemDecimalHandler : SystemHandlerBase, ISystemDecimalHandler
    {
        public SystemDecimalHandler(
            StreamWriter asmWriter,
            Func<IBackendStackSimulator, string> getAvailableRegister,
            Func<string> getUniqueLabel)
            : base(asmWriter, getAvailableRegister, getUniqueLabel)
        {
        }

        public override bool IsMethod(MethodMetadata method)
        {
            return method.OwningClass.FullName == "System.Decimal" &&
                   (method.Name == "op_Addition" || method.Name == "op_Subtraction" ||
                    method.Name == "Equals" || method.Name == ".ctor");
        }

        public override bool IsReflectionMethod(MethodBase method)
        {
            return method.DeclaringType?.FullName == "System.Decimal";
        }

        public override void HandleMethodCall(MethodMetadata method, IBackendStackSimulator stack)
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
                AsmWriter?.WriteLine($"    ; TODO: System.Decimal.{method.Name}");
            }
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            string methodName = methodInfo.Name;
            AsmWriter?.WriteLine($"    ; System.Decimal.{methodName} (inline)");

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
                HandleOpLessThan(stack);
            }
            else if (methodName == "op_GreaterThan")
            {
                HandleOpGreaterThan(stack);
            }
            else if (methodName == "op_LessThanOrEqual")
            {
                HandleOpLessThanOrEqual(stack);
            }
            else if (methodName == "op_GreaterThanOrEqual")
            {
                HandleOpGreaterThanOrEqual(stack);
            }
            else if (methodName == "op_Equality")
            {
                HandleOpEquality(stack);
            }
            else if (methodName == "op_Inequality")
            {
                HandleOpInequality(stack);
            }
            else if (methodName == "Equals")
            {
                HandleEquals(stack);
            }
            else if (methodName == "CompareTo")
            {
                HandleCompareTo(stack);
            }
            else if (methodName == "op_Implicit")
            {
                HandleOpImplicit(methodInfo, stack);
            }
            else if (methodName == "op_Explicit")
            {
                HandleOpExplicit(methodInfo, stack);
            }
            else
            {
                AsmWriter?.WriteLine($"    ; TODO: System.Decimal.{methodName}");
                if (methodInfo is MethodInfo mi)
                {
                    var paramCount = mi.GetParameters().Length;
                    for (int i = 0; i < paramCount; i++)
                    {
                        try { stack.Pop(); } catch { }
                    }
                    if (mi.ReturnType != typeof(void))
                    {
                        string resultReg = stack.AllocateDataRegister();
                        stack.Push(resultReg);
                    }
                }
            }
        }

        public override void HandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            var parameters = methodInfo.GetParameters();
            AsmWriter?.WriteLine($"    ; System.Decimal newobj - create new instance ({parameters.Length} parameters)");

            var parameterValues = new List<string>();
            for (int i = 0; i < parameters.Length; i++)
            {
                try
                {
                    parameterValues.Add(stack.Pop());
                }
                catch
                {
                    AsmWriter?.WriteLine($"    ; WARNING: Could not pop parameter {i}");
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

                string resultAddrReg = stack.AllocateAddressRegister();
                AsmWriter?.WriteLine($"    LEA -32(A6),{resultAddrReg}  ; Allocate new Decimal instance");
                AsmWriter?.WriteLine($"    ; System.Decimal newobj inline");
                AsmWriter?.WriteLine($"    ; result @ {resultAddrReg}, lo={lo}, mid={mid}, hi={hi}, sign={isNegative}, scale={scale}");

                string skipNegLabel = GetUniqueLabel();
                string dataReg = stack.AllocateDataRegister();

                AsmWriter?.WriteLine($"    CLR.L {dataReg}           ; Clear flags");
                AsmWriter?.WriteLine($"    AND.L #0xFF,{scale}      ; Ensure scale is 0-255");
                AsmWriter?.WriteLine($"    LSL.L #16,{scale}        ; Shift scale to bits 16-23");
                AsmWriter?.WriteLine($"    OR.L {scale},{dataReg}   ; Set scale in flags");

                AsmWriter?.WriteLine($"    TST.L {isNegative}        ; Check if negative");
                AsmWriter?.WriteLine($"    BEQ .SkipNegative_{skipNegLabel}");
                AsmWriter?.WriteLine($"    OR.L #0x80000000,{dataReg} ; Set sign bit if negative");
                AsmWriter?.WriteLine($".SkipNegative_{skipNegLabel}:");

                AsmWriter?.WriteLine($"    MOVE.L {dataReg},({resultAddrReg})      ; Store flags at offset 0");
                AsmWriter?.WriteLine($"    MOVE.L {hi},4({resultAddrReg})          ; Store high at offset 4");
                AsmWriter?.WriteLine($"    MOVE.L {lo},8({resultAddrReg})          ; Store low at offset 8");
                AsmWriter?.WriteLine($"    MOVE.L {mid},12({resultAddrReg})        ; Store mid at offset 12");

                AsmWriter?.WriteLine($"    ; newobj complete - convert address to data register for stack");
                string resultValue = stack.AllocateDataRegister();
                AsmWriter?.WriteLine($"    MOVE.L {resultAddrReg},{resultValue}   ; Convert address to data register");
                stack.ReleaseAddressRegister(resultAddrReg);
                stack.ReleaseDataRegister(dataReg);

                stack.Push(resultValue);
            }
            else
            {
                AsmWriter?.WriteLine($"    ; TODO: Decimal newobj with {parameterValues.Count} parameters (expected 5)");
                string resultReg = stack.AllocateDataRegister();
                stack.Push(resultReg);
            }
        }

        private void HandleConstructor(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            var parameters = methodInfo.GetParameters();
            AsmWriter?.WriteLine($"    ; System.Decimal instance constructor (void) - {parameters.Length} parameters");

            var parameterValues = new List<string>();
            for (int i = 0; i < parameters.Length; i++)
            {
                try
                {
                    parameterValues.Add(stack.Pop());
                }
                catch
                {
                    AsmWriter?.WriteLine($"    ; WARNING: Could not pop parameter {i}");
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
                AsmWriter?.WriteLine($"    ; WARNING: Could not pop this");
                thisAddr = "D0";
            }

            if (parameterValues.Count == 5)
            {
                string scale = parameterValues[4];
                string isNegative = parameterValues[3];
                string hi = parameterValues[2];
                string mid = parameterValues[1];
                string lo = parameterValues[0];

                // Use address register for this pointer
                string thisAddrReg = stack.AllocateAddressRegister();
                AsmWriter?.WriteLine($"    MOVE.L {thisAddr},{thisAddrReg} ; {thisAddrReg} = address of this");
                AsmWriter?.WriteLine($"    ; System.Decimal constructor inline");
                AsmWriter?.WriteLine($"    ; this @ {thisAddrReg}, lo={lo}, mid={mid}, hi={hi}, sign={isNegative}, scale={scale}");

                string skipNegLabel = GetUniqueLabel();
                string dataReg = stack.AllocateDataRegister();

                AsmWriter?.WriteLine($"    CLR.L {dataReg}           ; Clear flags");
                AsmWriter?.WriteLine($"    AND.L #0xFF,{scale}      ; Ensure scale is 0-255");
                AsmWriter?.WriteLine($"    LSL.L #16,{scale}        ; Shift scale to bits 16-23");
                AsmWriter?.WriteLine($"    OR.L {scale},{dataReg}   ; Set scale in flags");

                AsmWriter?.WriteLine($"    TST.L {isNegative}        ; Check if negative");
                AsmWriter?.WriteLine($"    BEQ .SkipNegative_{skipNegLabel}");
                AsmWriter?.WriteLine($"    OR.L #0x80000000,{dataReg} ; Set sign bit if negative");
                AsmWriter?.WriteLine($".SkipNegative_{skipNegLabel}:");

                AsmWriter?.WriteLine($"    MOVE.L {dataReg},({thisAddrReg})   ; Store flags at offset 0");
                AsmWriter?.WriteLine($"    MOVE.L {hi},4({thisAddrReg})       ; Store high at offset 4");
                AsmWriter?.WriteLine($"    MOVE.L {lo},8({thisAddrReg})       ; Store low at offset 8");
                AsmWriter?.WriteLine($"    MOVE.L {mid},12({thisAddrReg})     ; Store mid at offset 12");

                AsmWriter?.WriteLine($"    ; Decimal constructor complete (void - nothing pushed)");

                stack.ReleaseAddressRegister(thisAddrReg);
                stack.ReleaseDataRegister(dataReg);
                stack.Clear();
            }
            else
            {
                AsmWriter?.WriteLine($"    ; TODO: Decimal constructor with {parameterValues.Count} parameters (expected 5)");
                stack.Clear();
            }
        }

        // ===== Decimal Addition with proper address register discipline =====
        private void HandleAddition(IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; System.Decimal op_Addition inline");

            string rightAddr = stack.Pop();
            string leftAddr = stack.Pop();

            // Use address registers for struct addresses
            string leftAddrReg = stack.AllocateAddressRegister();
            string rightAddrReg = stack.AllocateAddressRegister();
            string resultAddrReg = stack.AllocateAddressRegister();

            AsmWriter?.WriteLine($"    MOVE.L {leftAddr},{leftAddrReg}    ; {leftAddrReg} = address of left operand");
            AsmWriter?.WriteLine($"    MOVE.L {rightAddr},{rightAddrReg}  ; {rightAddrReg} = address of right operand");
            AsmWriter?.WriteLine($"    LEA -32(A6),{resultAddrReg}        ; {resultAddrReg} = address of result");

            string dataReg = stack.AllocateDataRegister();
            
            // Simple addition of low parts (simplified implementation)
            AsmWriter?.WriteLine($"    MOVE.L 8({leftAddrReg}),{dataReg}   ; Load left low");
            AsmWriter?.WriteLine($"    ADD.L 8({rightAddrReg}),{dataReg}   ; Add right low");
            AsmWriter?.WriteLine($"    MOVE.L {dataReg},8({resultAddrReg}) ; Store result low");

            // Copy flags from left operand (keeping scale and sign)
            AsmWriter?.WriteLine($"    MOVE.L ({leftAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    MOVE.L {dataReg},({resultAddrReg})");
            
            // Copy high and mid parts from left
            AsmWriter?.WriteLine($"    MOVE.L 4({leftAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    MOVE.L {dataReg},4({resultAddrReg})");
            AsmWriter?.WriteLine($"    MOVE.L 12({leftAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    MOVE.L {dataReg},12({resultAddrReg})");

            stack.ReleaseAddressRegister(leftAddrReg);
            stack.ReleaseAddressRegister(rightAddrReg);
            stack.ReleaseDataRegister(dataReg);

            string resultReg = stack.AllocateDataRegister();
            AsmWriter?.WriteLine($"    MOVE.L {resultAddrReg},{resultReg}");
            stack.ReleaseAddressRegister(resultAddrReg);
            stack.Push(resultReg);
        }

        private void HandleSubtraction(IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; System.Decimal op_Subtraction inline");

            string rightAddr = stack.Pop();
            string leftAddr = stack.Pop();

            string leftAddrReg = stack.AllocateAddressRegister();
            string rightAddrReg = stack.AllocateAddressRegister();
            string resultAddrReg = stack.AllocateAddressRegister();

            AsmWriter?.WriteLine($"    MOVE.L {leftAddr},{leftAddrReg}");
            AsmWriter?.WriteLine($"    MOVE.L {rightAddr},{rightAddrReg}");
            AsmWriter?.WriteLine($"    LEA -32(A6),{resultAddrReg}");

            string dataReg = stack.AllocateDataRegister();
            
            // Simple subtraction of low parts
            AsmWriter?.WriteLine($"    MOVE.L 8({leftAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    SUB.L 8({rightAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    MOVE.L {dataReg},8({resultAddrReg})");

            // Copy flags and other parts
            AsmWriter?.WriteLine($"    MOVE.L ({leftAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    MOVE.L {dataReg},({resultAddrReg})");
            AsmWriter?.WriteLine($"    MOVE.L 4({leftAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    MOVE.L {dataReg},4({resultAddrReg})");
            AsmWriter?.WriteLine($"    MOVE.L 12({leftAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    MOVE.L {dataReg},12({resultAddrReg})");

            stack.ReleaseAddressRegister(leftAddrReg);
            stack.ReleaseAddressRegister(rightAddrReg);
            stack.ReleaseDataRegister(dataReg);

            string resultReg = stack.AllocateDataRegister();
            AsmWriter?.WriteLine($"    MOVE.L {resultAddrReg},{resultReg}");
            stack.ReleaseAddressRegister(resultAddrReg);
            stack.Push(resultReg);
        }

        // ===== BINARY OPERATORS (NEW) - Call external library functions =====
        private void HandleBinaryOperator(IBackendStackSimulator stack, string operatorName, string symbol)
        {
            AsmWriter?.WriteLine($"    ; System.Decimal.{operatorName} (library call)");
            
            string rightAddr = stack.Pop();
            string leftAddr = stack.Pop();

            // Move addresses into address registers
            string leftAddrReg = stack.AllocateAddressRegister();
            string rightAddrReg = stack.AllocateAddressRegister();

            AsmWriter?.WriteLine($"    MOVE.L {leftAddr},{leftAddrReg}    ; A0 = address of left operand");
            AsmWriter?.WriteLine($"    MOVE.L {rightAddr},{rightAddrReg}  ; A1 = address of right operand");

            // Map operator to method name
            string methodSuffix = operatorName switch
            {
                "op_Multiply" => "Multiply",
                "op_Division" => "Divide",
                "op_Modulus" => "Modulus",
                _ => throw new InvalidOperationException($"Unknown binary operator: {operatorName}")
            };

            // Emit library call - pass left in A0, right in A1
            AsmWriter?.WriteLine($"    MOVE.L {leftAddrReg},A0");
            AsmWriter?.WriteLine($"    MOVE.L {rightAddrReg},A1");
            AsmWriter?.WriteLine($"    JSR System_Decimal_{methodSuffix}");
            AsmWriter?.WriteLine($"    ; Result Decimal now at A6-32");

            stack.ReleaseAddressRegister(leftAddrReg);
            stack.ReleaseAddressRegister(rightAddrReg);

            // Push result address onto stack
            string resultReg = stack.AllocateDataRegister();
            AsmWriter?.WriteLine($"    LEA -32(A6),{resultReg}  ; Load result address");
            stack.Push(resultReg);
        }

        // ===== UNARY OPERATORS (NEW) - Call external library functions =====
        private void HandleUnaryOperator(IBackendStackSimulator stack, string operatorName, string symbol)
        {
            AsmWriter?.WriteLine($"    ; System.Decimal.{operatorName} (library call)");
            
            string operandAddr = stack.Pop();

            // Move address into A0
            string operandAddrReg = stack.AllocateAddressRegister();

            AsmWriter?.WriteLine($"    MOVE.L {operandAddr},{operandAddrReg}  ; A0 = address of operand");

            // Map operator to method name
            string methodSuffix = operatorName switch
            {
                "op_UnaryNegation" => "Negate",
                _ => throw new InvalidOperationException($"Unknown unary operator: {operatorName}")
            };

            // Emit library call
            AsmWriter?.WriteLine($"    MOVE.L {operandAddrReg},A0");
            AsmWriter?.WriteLine($"    JSR System_Decimal_{methodSuffix}");
            AsmWriter?.WriteLine($"    ; Result Decimal now at A6-32");

            stack.ReleaseAddressRegister(operandAddrReg);

            // Push result address onto stack
            string resultReg = stack.AllocateDataRegister();
            AsmWriter?.WriteLine($"    LEA -32(A6),{resultReg}  ; Load result address");
            stack.Push(resultReg);
        }

        /// <summary>Implement Decimal op_LessThan - returns 1 if left < right, else 0</summary>
        private void HandleOpLessThan(IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; System.Decimal op_LessThan inline");

            string rightAddr = stack.Pop();
            string leftAddr = stack.Pop();

            string leftAddrReg = stack.AllocateAddressRegister();
            string rightAddrReg = stack.AllocateAddressRegister();

            AsmWriter?.WriteLine($"    MOVE.L {leftAddr},{leftAddrReg}    ; {leftAddrReg} = address of left operand");
            AsmWriter?.WriteLine($"    MOVE.L {rightAddr},{rightAddrReg}  ; {rightAddrReg} = address of right operand");

            string resultReg = stack.AllocateDataRegister();
            string dataReg = stack.AllocateDataRegister();

            string lessThanLabel = GetUniqueLabel();
            string doneLabel = GetUniqueLabel();

            AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; Assume not less than (default: 0)");

            // Compare flags/signs at offset 0 to determine sign
            AsmWriter?.WriteLine($"    MOVE.L ({leftAddrReg}),{dataReg}    ; Load left flags");
            AsmWriter?.WriteLine($"    MOVE.L ({rightAddrReg}),D4          ; Load right flags");
            AsmWriter?.WriteLine($"    TST.L {dataReg}                     ; Check left sign (bit 31)");
            AsmWriter?.WriteLine($"    BPL .LeftPositive_{lessThanLabel}");

            // Left is negative - check if right is positive
            AsmWriter?.WriteLine($"    TST.L D4");
            AsmWriter?.WriteLine($"    BMI .BothNegative_{lessThanLabel}   ; Both negative, compare magnitude");
            AsmWriter?.WriteLine($"    MOVE.L #1,{resultReg}              ; Left negative, right positive: left < right");
            AsmWriter?.WriteLine($"    BRA .Done_{doneLabel}");

            AsmWriter?.WriteLine($".LeftPositive_{lessThanLabel}:");
            // Left is positive - check if right is negative
            AsmWriter?.WriteLine($"    TST.L D4");
            AsmWriter?.WriteLine($"    BMI .Done_{doneLabel}              ; Left positive, right negative: left >= right (return 0)");

            AsmWriter?.WriteLine($".BothNegative_{lessThanLabel}:");
            // Both same sign - compare magnitude (high, mid, low from most to least significant)
            // Compare high at offset 4
            AsmWriter?.WriteLine($"    MOVE.L 4({leftAddrReg}),{dataReg}   ; Load left high");
            AsmWriter?.WriteLine($"    CMP.L 4({rightAddrReg}),{dataReg}   ; Compare high");
            AsmWriter?.WriteLine($"    BLT .IsLessThan_{lessThanLabel}");
            AsmWriter?.WriteLine($"    BGT .Done_{doneLabel}              ; If left high > right high, not less");

            // High parts equal, compare mid at offset 12
            AsmWriter?.WriteLine($"    MOVE.L 12({leftAddrReg}),{dataReg}  ; Load left mid");
            AsmWriter?.WriteLine($"    CMP.L 12({rightAddrReg}),{dataReg}  ; Compare mid");
            AsmWriter?.WriteLine($"    BLT .IsLessThan_{lessThanLabel}");
            AsmWriter?.WriteLine($"    BGT .Done_{doneLabel}");

            // Mid parts equal, compare low at offset 8
            AsmWriter?.WriteLine($"    MOVE.L 8({leftAddrReg}),{dataReg}   ; Load left low");
            AsmWriter?.WriteLine($"    CMP.L 8({rightAddrReg}),{dataReg}   ; Compare low");
            AsmWriter?.WriteLine($"    BLT .IsLessThan_{lessThanLabel}");
            AsmWriter?.WriteLine($"    BRA .Done_{doneLabel}");

            AsmWriter?.WriteLine($".IsLessThan_{lessThanLabel}:");
            AsmWriter?.WriteLine($"    MOVE.L #1,{resultReg}              ; Left < Right");

            AsmWriter?.WriteLine($".Done_{doneLabel}:");

            stack.ReleaseAddressRegister(leftAddrReg);
            stack.ReleaseAddressRegister(rightAddrReg);
            stack.ReleaseDataRegister(dataReg);

            stack.Push(resultReg);
        }

        /// <summary>Implement Decimal op_GreaterThan - returns 1 if left > right, else 0</summary>
        private void HandleOpGreaterThan(IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; System.Decimal op_GreaterThan inline");

            string rightAddr = stack.Pop();
            string leftAddr = stack.Pop();

            string leftAddrReg = stack.AllocateAddressRegister();
            string rightAddrReg = stack.AllocateAddressRegister();

            AsmWriter?.WriteLine($"    MOVE.L {leftAddr},{leftAddrReg}    ; {leftAddrReg} = address of left operand");
            AsmWriter?.WriteLine($"    MOVE.L {rightAddr},{rightAddrReg}  ; {rightAddrReg} = address of right operand");

            string resultReg = stack.AllocateDataRegister();
            string dataReg = stack.AllocateDataRegister();

            string greaterThanLabel = GetUniqueLabel();
            string doneLabel = GetUniqueLabel();

            AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; Assume not greater than (default: 0)");

            // Compare flags/signs at offset 0
            AsmWriter?.WriteLine($"    MOVE.L ({leftAddrReg}),{dataReg}    ; Load left flags");
            AsmWriter?.WriteLine($"    MOVE.L ({rightAddrReg}),D4          ; Load right flags");
            AsmWriter?.WriteLine($"    TST.L {dataReg}                     ; Check left sign");
            AsmWriter?.WriteLine($"    BMI .LeftNegative_{greaterThanLabel}");

            // Left is positive - check if right is negative
            AsmWriter?.WriteLine($"    TST.L D4");
            AsmWriter?.WriteLine($"    BPL .BothPositive_{greaterThanLabel} ; Both positive, compare magnitude");
            AsmWriter?.WriteLine($"    MOVE.L #1,{resultReg}              ; Left positive, right negative: left > right");
            AsmWriter?.WriteLine($"    BRA .Done_{doneLabel}");

            AsmWriter?.WriteLine($".LeftNegative_{greaterThanLabel}:");
            // Left is negative - right must be negative or equal
            AsmWriter?.WriteLine($"    TST.L D4");
            AsmWriter?.WriteLine($"    BPL .Done_{doneLabel}              ; Left negative, right positive: left < right (return 0)");

            AsmWriter?.WriteLine($".BothPositive_{greaterThanLabel}:");
            // Both same sign - compare magnitude
            // Compare high at offset 4
            AsmWriter?.WriteLine($"    MOVE.L 4({leftAddrReg}),{dataReg}   ; Load left high");
            AsmWriter?.WriteLine($"    CMP.L 4({rightAddrReg}),{dataReg}   ; Compare high");
            AsmWriter?.WriteLine($"    BGT .IsGreaterThan_{greaterThanLabel}");
            AsmWriter?.WriteLine($"    BLT .Done_{doneLabel}");

            // High parts equal, compare mid at offset 12
            AsmWriter?.WriteLine($"    MOVE.L 12({leftAddrReg}),{dataReg}  ; Load left mid");
            AsmWriter?.WriteLine($"    CMP.L 12({rightAddrReg}),{dataReg}  ; Compare mid");
            AsmWriter?.WriteLine($"    BGT .IsGreaterThan_{greaterThanLabel}");
            AsmWriter?.WriteLine($"    BLT .Done_{doneLabel}");

            // Mid parts equal, compare low at offset 8
            AsmWriter?.WriteLine($"    MOVE.L 8({leftAddrReg}),{dataReg}   ; Load left low");
            AsmWriter?.WriteLine($"    CMP.L 8({rightAddrReg}),{dataReg}   ; Compare low");
            AsmWriter?.WriteLine($"    BGT .IsGreaterThan_{greaterThanLabel}");
            AsmWriter?.WriteLine($"    BRA .Done_{doneLabel}");

            AsmWriter?.WriteLine($".IsGreaterThan_{greaterThanLabel}:");
            AsmWriter?.WriteLine($"    MOVE.L #1,{resultReg}              ; Left > Right");

            AsmWriter?.WriteLine($".Done_{doneLabel}:");

            stack.ReleaseAddressRegister(leftAddrReg);
            stack.ReleaseAddressRegister(rightAddrReg);
            stack.ReleaseDataRegister(dataReg);

            stack.Push(resultReg);
        }

        /// <summary>Implement Decimal op_LessThanOrEqual - returns 1 if left <= right, else 0</summary>
        private void HandleOpLessThanOrEqual(IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; System.Decimal op_LessThanOrEqual inline");

            string rightAddr = stack.Pop();
            string leftAddr = stack.Pop();

            string leftAddrReg = stack.AllocateAddressRegister();
            string rightAddrReg = stack.AllocateAddressRegister();

            AsmWriter?.WriteLine($"    MOVE.L {leftAddr},{leftAddrReg}    ; {leftAddrReg} = address of left operand");
            AsmWriter?.WriteLine($"    MOVE.L {rightAddr},{rightAddrReg}  ; {rightAddrReg} = address of right operand");

            string resultReg = stack.AllocateDataRegister();
            string dataReg = stack.AllocateDataRegister();

            string leLabel = GetUniqueLabel();
            string doneLabel = GetUniqueLabel();

            AsmWriter?.WriteLine($"    MOVE.L #1,{resultReg}  ; Assume true (default: 1)");

            // Compare flags/signs
            AsmWriter?.WriteLine($"    MOVE.L ({leftAddrReg}),{dataReg}    ; Load left flags");
            AsmWriter?.WriteLine($"    MOVE.L ({rightAddrReg}),D4          ; Load right flags");
            AsmWriter?.WriteLine($"    TST.L {dataReg}                     ; Check left sign (bit 31)");
            AsmWriter?.WriteLine($"    BPL .LeftPositive_{leLabel}");

            // Left negative
            AsmWriter?.WriteLine($"    TST.L D4");
            AsmWriter?.WriteLine($"    BPL .Done_{doneLabel}              ; Left < positive, result true (return 1)");
            AsmWriter?.WriteLine($"    BRA .CompareMagnitude_{leLabel}");

            AsmWriter?.WriteLine($".LeftPositive_{leLabel}:");
            // Left positive
            AsmWriter?.WriteLine($"    TST.L D4");
            AsmWriter?.WriteLine($"    BMI .SetFalse_{leLabel}            ; Left > negative, result false");

            AsmWriter?.WriteLine($".CompareMagnitude_{leLabel}:");
            // Both same sign - compare magnitude
            AsmWriter?.WriteLine($"    MOVE.L 4({leftAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    CMP.L 4({rightAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    BGT .SetFalse_{leLabel}");
            AsmWriter?.WriteLine($"    BLT .Done_{doneLabel}");

            AsmWriter?.WriteLine($"    MOVE.L 12({leftAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    CMP.L 12({rightAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    BGT .SetFalse_{leLabel}");
            AsmWriter?.WriteLine($"    BLT .Done_{doneLabel}");

            AsmWriter?.WriteLine($"    MOVE.L 8({leftAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    CMP.L 8({rightAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    BGT .SetFalse_{leLabel}");
            AsmWriter?.WriteLine($"    BRA .Done_{doneLabel}");

            AsmWriter?.WriteLine($".SetFalse_{leLabel}:");
            AsmWriter?.WriteLine($"    CLR.L {resultReg}");

            AsmWriter?.WriteLine($".Done_{doneLabel}:");

            stack.ReleaseAddressRegister(leftAddrReg);
            stack.ReleaseAddressRegister(rightAddrReg);
            stack.ReleaseDataRegister(dataReg);

            stack.Push(resultReg);
        }

        /// <summary>Implement Decimal op_GreaterThanOrEqual - returns 1 if left >= right, else 0</summary>
        private void HandleOpGreaterThanOrEqual(IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; System.Decimal op_GreaterThanOrEqual inline");

            string rightAddr = stack.Pop();
            string leftAddr = stack.Pop();

            string leftAddrReg = stack.AllocateAddressRegister();
            string rightAddrReg = stack.AllocateAddressRegister();

            AsmWriter?.WriteLine($"    MOVE.L {leftAddr},{leftAddrReg}");
            AsmWriter?.WriteLine($"    MOVE.L {rightAddr},{rightAddrReg}");

            string resultReg = stack.AllocateDataRegister();
            string dataReg = stack.AllocateDataRegister();

            string geLabel = GetUniqueLabel();
            string doneLabel = GetUniqueLabel();

            AsmWriter?.WriteLine($"    MOVE.L #1,{resultReg}");

            // Compare flags
            AsmWriter?.WriteLine($"    MOVE.L ({leftAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    MOVE.L ({rightAddrReg}),D4");
            AsmWriter?.WriteLine($"    TST.L {dataReg}");
            AsmWriter?.WriteLine($"    BMI .LeftNegative_{geLabel}");

            // Left positive
            AsmWriter?.WriteLine($"    TST.L D4");
            AsmWriter?.WriteLine($"    BMI .Done_{doneLabel}");
            AsmWriter?.WriteLine($"    BRA .CompareMagnitude_{geLabel}");

            AsmWriter?.WriteLine($".LeftNegative_{geLabel}:");
            // Left negative
            AsmWriter?.WriteLine($"    TST.L D4");
            AsmWriter?.WriteLine($"    BPL .SetFalse_{geLabel}");

            AsmWriter?.WriteLine($".CompareMagnitude_{geLabel}:");
            AsmWriter?.WriteLine($"    MOVE.L 4({leftAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    CMP.L 4({rightAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    BLT .SetFalse_{geLabel}");
            AsmWriter?.WriteLine($"    BGT .Done_{doneLabel}");

            AsmWriter?.WriteLine($"    MOVE.L 12({leftAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    CMP.L 12({rightAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    BLT .SetFalse_{geLabel}");
            AsmWriter?.WriteLine($"    BGT .Done_{doneLabel}");

            AsmWriter?.WriteLine($"    MOVE.L 8({leftAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    CMP.L 8({rightAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    BLT .SetFalse_{geLabel}");
            AsmWriter?.WriteLine($"    BRA .Done_{doneLabel}");

            AsmWriter?.WriteLine($".SetFalse_{geLabel}:");
            AsmWriter?.WriteLine($"    CLR.L {resultReg}");

            AsmWriter?.WriteLine($".Done_{doneLabel}:");

            stack.ReleaseAddressRegister(leftAddrReg);
            stack.ReleaseAddressRegister(rightAddrReg);
            stack.ReleaseDataRegister(dataReg);

            stack.Push(resultReg);
        }

        /// <summary>Implement Decimal op_Equality - returns 1 if equal, else 0</summary>
        private void HandleOpEquality(IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; System.Decimal op_Equality inline");

            string rightAddr = stack.Pop();
            string leftAddr = stack.Pop();

            string leftAddrReg = stack.AllocateAddressRegister();
            string rightAddrReg = stack.AllocateAddressRegister();

            AsmWriter?.WriteLine($"    MOVE.L {leftAddr},{leftAddrReg}");
            AsmWriter?.WriteLine($"    MOVE.L {rightAddr},{rightAddrReg}");

            string resultReg = stack.AllocateDataRegister();
            string dataReg = stack.AllocateDataRegister();

            string notEqualLabel = GetUniqueLabel();
            string doneLabel = GetUniqueLabel();

            AsmWriter?.WriteLine($"    MOVE.L #1,{resultReg}     ; Assume equal (default: 1)");

            // Compare all four fields
            AsmWriter?.WriteLine($"    MOVE.L ({leftAddrReg}),{dataReg}    ; Compare flags");
            AsmWriter?.WriteLine($"    CMP.L ({rightAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    BNE .NotEqual_{notEqualLabel}");

            AsmWriter?.WriteLine($"    MOVE.L 4({leftAddrReg}),{dataReg}   ; Compare high");
            AsmWriter?.WriteLine($"    CMP.L 4({rightAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    BNE .NotEqual_{notEqualLabel}");

            AsmWriter?.WriteLine($"    MOVE.L 8({leftAddrReg}),{dataReg}   ; Compare low");
            AsmWriter?.WriteLine($"    CMP.L 8({rightAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    BNE .NotEqual_{notEqualLabel}");

            AsmWriter?.WriteLine($"    MOVE.L 12({leftAddrReg}),{dataReg}  ; Compare mid");
            AsmWriter?.WriteLine($"    CMP.L 12({rightAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    BNE .NotEqual_{notEqualLabel}");

            AsmWriter?.WriteLine($"    BRA .Done_{doneLabel}");

            AsmWriter?.WriteLine($".NotEqual_{notEqualLabel}:");
            AsmWriter?.WriteLine($"    CLR.L {resultReg}");

            AsmWriter?.WriteLine($".Done_{doneLabel}:");

            stack.ReleaseAddressRegister(leftAddrReg);
            stack.ReleaseAddressRegister(rightAddrReg);
            stack.ReleaseDataRegister(dataReg);

            stack.Push(resultReg);
        }

        /// <summary>Implement Decimal op_Inequality - returns 1 if not equal, else 0</summary>
        private void HandleOpInequality(IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; System.Decimal op_Inequality inline");

            string rightAddr = stack.Pop();
            string leftAddr = stack.Pop();

            string leftAddrReg = stack.AllocateAddressRegister();
            string rightAddrReg = stack.AllocateAddressRegister();

            AsmWriter?.WriteLine($"    MOVE.L {leftAddr},{leftAddrReg}");
            AsmWriter?.WriteLine($"    MOVE.L {rightAddr},{rightAddrReg}");

            string resultReg = stack.AllocateDataRegister();
            string dataReg = stack.AllocateDataRegister();

            string equalLabel = GetUniqueLabel();
            string doneLabel = GetUniqueLabel();

            AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; Assume equal (default: 0)");

            // Compare all four fields
            AsmWriter?.WriteLine($"    MOVE.L ({leftAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    CMP.L ({rightAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    BNE .NotEqual_{equalLabel}");

            AsmWriter?.WriteLine($"    MOVE.L 4({leftAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    CMP.L 4({rightAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    BNE .NotEqual_{equalLabel}");

            AsmWriter?.WriteLine($"    MOVE.L 8({leftAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    CMP.L 8({rightAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    BNE .NotEqual_{equalLabel}");

            AsmWriter?.WriteLine($"    MOVE.L 12({leftAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    CMP.L 12({rightAddrReg}),{dataReg}");
            AsmWriter?.WriteLine($"    BNE .NotEqual_{equalLabel}");

            AsmWriter?.WriteLine($"    BRA .Done_{doneLabel}");

            AsmWriter?.WriteLine($".NotEqual_{equalLabel}:");
            AsmWriter?.WriteLine($"    MOVE.L #1,{resultReg}");

            AsmWriter?.WriteLine($".Done_{doneLabel}:");

            stack.ReleaseAddressRegister(leftAddrReg);
            stack.ReleaseAddressRegister(rightAddrReg);
            stack.ReleaseDataRegister(dataReg);

            stack.Push(resultReg);
        }

        private void HandleEquals(IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; System.Decimal.Equals inline");
            HandleOpEquality(stack);
        }

        private void HandleCompareTo(IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; System.Decimal.CompareTo inline");
            // For now, return 0 (equal) - can be enhanced later
            string resultReg = stack.AllocateDataRegister();
            AsmWriter?.WriteLine($"    CLR.L {resultReg}");
            stack.Push(resultReg);
        }

        private void HandleOpImplicit(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; Decimal.op_Implicit (inline)");
            if (stack.StackDepth > 0)
            {
                string val = stack.Pop();
                AsmWriter?.WriteLine($"    MOVE.L {val},D0       ; Decimal.op_Implicit: convert to decimal (simplified)");
                stack.ReleaseDataRegister(val);
            }
            stack.Push("D0");
        }

        private void HandleOpExplicit(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; Decimal.op_Explicit (inline)");
            if (stack.StackDepth > 0)
            {
                string val = stack.Pop();
                AsmWriter?.WriteLine($"    MOVE.L {val},D0       ; Decimal.op_Explicit: convert from decimal (simplified)");
                stack.ReleaseDataRegister(val);
            }

            if (methodInfo is MethodInfo mi && (mi.ReturnType == typeof(double) || mi.ReturnType == typeof(long)))
            {
                AsmWriter?.WriteLine($"    CLR.L D1              ; Decimal.op_Explicit: low word (simplified 64-bit)");
                stack.Push("D0", isDoubleWord: true);
                stack.Push("D1", isDoubleWord: true);
            }
            else
            {
                stack.Push("D0");
            }
        }
    }
}