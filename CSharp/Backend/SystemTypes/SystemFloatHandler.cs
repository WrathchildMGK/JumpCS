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

        private void HandleSubtraction(Asm68000StackSimulator stack)
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

        private void HandleMultiply(Asm68000StackSimulator stack)
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

        private void HandleDivision(Asm68000StackSimulator stack)
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

        private void HandleUnaryNegation(Asm68000StackSimulator stack)
        {
            string val = stack.Pop();

            // Flip the sign bit (bit 31 of the IEEE 754 float)
            AsmWriter?.WriteLine($"    MOVE.L {val},D0       ; Value");
            AsmWriter?.WriteLine($"    EORI.L #$80000000,D0  ; Flip sign bit");
            
            stack.ReleaseDataRegister(val);
            
            stack.Push("D0");
        }

        private void HandleEquality(Asm68000StackSimulator stack)
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

        private void HandleInequality(Asm68000StackSimulator stack)
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

        private void HandleLessThan(Asm68000StackSimulator stack)
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

        private void HandleGreaterThan(Asm68000StackSimulator stack)
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

        private void HandleLessThanOrEqual(Asm68000StackSimulator stack)
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

        private void HandleGreaterThanOrEqual(Asm68000StackSimulator stack)
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

        private void HandleEquals(Asm68000StackSimulator stack)
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
    }
}