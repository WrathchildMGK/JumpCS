using System.Reflection;
using System.Text;
using JumpCS.Core;

namespace JumpCS.Backend.SystemTypes
{
    /// <summary>Handler for System.Double type operations</summary>
    public class SystemDoubleHandler : SystemHandlerBase
    {
        public SystemDoubleHandler(
            StreamWriter asmWriter,
            Func<Asm68000StackSimulator, string> getAvailableRegister,
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
                    method.Name == "op_UnaryNegation" || method.Name == "Equals");
        }

        public override bool IsReflectionMethod(MethodBase method)
        {
            return method.DeclaringType?.FullName == "System.Double";
        }

        public override void HandleMethodCall(MethodMetadata method, Asm68000StackSimulator stack)
        {
            // Compiled Double methods (if any) would be handled here
            AsmWriter?.WriteLine($"    ; TODO: System.Double.{method.Name}");
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, Asm68000StackSimulator stack)
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

        private void HandleAddition(Asm68000StackSimulator stack)
        {
            // Double addition: pop two doubles (4 regs total: D0/D1 and D2/D3), add them
            string right_lo = stack.Pop();  // Low word of second double
            string right_hi = stack.Pop();  // High word of second double
            string left_lo = stack.Pop();   // Low word of first double
            string left_hi = stack.Pop();   // High word of first double

            // For now, stub implementation - just return left value
            AsmWriter?.WriteLine($"    ; Double addition stub: {left_hi}/{left_lo} + {right_hi}/{right_lo}");
            stack.Push(left_hi);
            stack.Push(left_lo);
        }

        private void HandleSubtraction(Asm68000StackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    ; Double subtraction stub: {left_hi}/{left_lo} - {right_hi}/{right_lo}");
            stack.Push(left_hi);
            stack.Push(left_lo);
        }

        private void HandleMultiply(Asm68000StackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    ; Double multiply stub: {left_hi}/{left_lo} * {right_hi}/{right_lo}");
            stack.Push(left_hi);
            stack.Push(left_lo);
        }

        private void HandleDivision(Asm68000StackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    ; Double division stub: {left_hi}/{left_lo} / {right_hi}/{right_lo}");
            stack.Push(left_hi);
            stack.Push(left_lo);
        }

        private void HandleUnaryNegation(Asm68000StackSimulator stack)
        {
            string val_lo = stack.Pop();
            string val_hi = stack.Pop();

            // Negate the sign bit (bit 63)
            AsmWriter?.WriteLine($"    ; Double unary negation stub: -{val_hi}/{val_lo}");
            stack.Push(val_hi);
            stack.Push(val_lo);
        }

        private void HandleEquality(Asm68000StackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    ; Double equality comparison stub");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; TODO: Compare {left_hi}/{left_lo} == {right_hi}/{right_lo}");
            stack.Push(resultReg);
        }

        private void HandleInequality(Asm68000StackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    ; Double inequality comparison stub");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L #1,{resultReg}  ; TODO: Compare {left_hi}/{left_lo} != {right_hi}/{right_lo}");
            stack.Push(resultReg);
        }

        private void HandleLessThan(Asm68000StackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    ; Double less than comparison stub");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; TODO: Compare {left_hi}/{left_lo} < {right_hi}/{right_lo}");
            stack.Push(resultReg);
        }

        private void HandleGreaterThan(Asm68000StackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    ; Double greater than comparison stub");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; TODO: Compare {left_hi}/{left_lo} > {right_hi}/{right_lo}");
            stack.Push(resultReg);
        }

        private void HandleLessThanOrEqual(Asm68000StackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    ; Double less than or equal comparison stub");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; TODO: Compare {left_hi}/{left_lo} <= {right_hi}/{right_lo}");
            stack.Push(resultReg);
        }

        private void HandleGreaterThanOrEqual(Asm68000StackSimulator stack)
        {
            string right_lo = stack.Pop();
            string right_hi = stack.Pop();
            string left_lo = stack.Pop();
            string left_hi = stack.Pop();

            AsmWriter?.WriteLine($"    ; Double greater than or equal comparison stub");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; TODO: Compare {left_hi}/{left_lo} >= {right_hi}/{right_lo}");
            stack.Push(resultReg);
        }

        private void HandleEquals(Asm68000StackSimulator stack)
        {
            // Decimal.Equals(object) - pop object, compare with this
            string objRef = stack.Pop();
            AsmWriter?.WriteLine($"    ; Double.Equals({objRef}) stub");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; TODO: Equals comparison");
            stack.Push(resultReg);
        }
    }
}