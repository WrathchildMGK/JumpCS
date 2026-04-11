using System.Reflection;
using System.Text;
using JumpCS.Core;

namespace JumpCS.Backend.SystemTypes
{
    /// <summary>Handler for System.Single (float) type operations</summary>
    public class SystemFloatHandler : SystemHandlerBase
    {
        public SystemFloatHandler(
            StreamWriter asmWriter,
            Func<Asm68000StackSimulator, string> getAvailableRegister,
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
                    method.Name == "op_UnaryNegation" || method.Name == "Equals");
        }

        public override bool IsReflectionMethod(MethodBase method)
        {
            return method.DeclaringType?.FullName == "System.Single";
        }

        public override void HandleMethodCall(MethodMetadata method, Asm68000StackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; TODO: System.Single.{method.Name}");
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, Asm68000StackSimulator stack)
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

        private void HandleAddition(Asm68000StackSimulator stack)
        {
            // Single addition: pop two singles (2 regs total: D0 and D1), add them
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Single addition stub: {left} + {right}");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L {left},{resultReg}     ; Stub result");
            stack.Push(resultReg);
        }

        private void HandleSubtraction(Asm68000StackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Single subtraction stub: {left} - {right}");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L {left},{resultReg}     ; Stub result");
            stack.Push(resultReg);
        }

        private void HandleMultiply(Asm68000StackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Single multiply stub: {left} * {right}");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L {left},{resultReg}     ; Stub result");
            stack.Push(resultReg);
        }

        private void HandleDivision(Asm68000StackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Single division stub: {left} / {right}");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L {left},{resultReg}     ; Stub result");
            stack.Push(resultReg);
        }

        private void HandleUnaryNegation(Asm68000StackSimulator stack)
        {
            string val = stack.Pop();

            AsmWriter?.WriteLine($"    ; Single unary negation stub: -{val}");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L {val},{resultReg}");
            AsmWriter?.WriteLine($"    BCHG #31,{resultReg}   ; Flip sign bit");
            stack.Push(resultReg);
        }

        private void HandleEquality(Asm68000StackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Single equality comparison stub");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; TODO: Compare {left} == {right}");
            stack.Push(resultReg);
        }

        private void HandleInequality(Asm68000StackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Single inequality comparison stub");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L #1,{resultReg}  ; TODO: Compare {left} != {right}");
            stack.Push(resultReg);
        }

        private void HandleLessThan(Asm68000StackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Single less than comparison stub");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; TODO: Compare {left} < {right}");
            stack.Push(resultReg);
        }

        private void HandleGreaterThan(Asm68000StackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Single greater than comparison stub");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; TODO: Compare {left} > {right}");
            stack.Push(resultReg);
        }

        private void HandleLessThanOrEqual(Asm68000StackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Single less than or equal comparison stub");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; TODO: Compare {left} <= {right}");
            stack.Push(resultReg);
        }

        private void HandleGreaterThanOrEqual(Asm68000StackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();

            AsmWriter?.WriteLine($"    ; Single greater than or equal comparison stub");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; TODO: Compare {left} >= {right}");
            stack.Push(resultReg);
        }

        private void HandleEquals(Asm68000StackSimulator stack)
        {
            string objRef = stack.Pop();
            AsmWriter?.WriteLine($"    ; Single.Equals({objRef}) stub");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; TODO: Equals comparison");
            stack.Push(resultReg);
        }
    }
}