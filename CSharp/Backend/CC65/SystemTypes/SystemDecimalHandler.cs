using System.Reflection;
using JumpCS.Backend.Base;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;

namespace JumpCS.Backend.CC65.SystemTypes
{
    /// <summary>Handler for System.Decimal type operations - CC65 (6502) target</summary>
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
                    method.Name == "op_Multiply" || method.Name == "op_Division" ||
                    method.Name == "op_Modulus" || method.Name == "op_UnaryNegation" ||
                    method.Name == "op_LessThan" || method.Name == "op_GreaterThan" ||
                    method.Name == "op_LessThanOrEqual" || method.Name == "op_GreaterThanOrEqual" ||
                    method.Name == "op_Equality" || method.Name == "op_Inequality" ||
                    method.Name == "Equals" || method.Name == "CompareTo" ||
                    method.Name == "op_Implicit" || method.Name == "op_Explicit" ||
                    method.Name == ".ctor");
        }

        public override bool IsReflectionMethod(MethodBase method)
        {
            return method.DeclaringType?.FullName == "System.Decimal";
        }

        public override void HandleMethodCall(MethodMetadata method, IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; TODO: System.Decimal.{method.Name}");
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            string methodName = methodInfo.Name;
            AsmWriter?.WriteLine($"    ; System.Decimal.{methodName}");

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
                HandleMultiply(stack);
            }
            else if (methodName == "op_Division")
            {
                HandleDivision(stack);
            }
            else if (methodName == "op_Modulus")
            {
                HandleModulus(stack);
            }
            else if (methodName == "op_UnaryNegation")
            {
                HandleUnaryNegation(stack);
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
            else if (methodName == "op_Equality")
            {
                HandleEquality(stack);
            }
            else if (methodName == "op_Inequality")
            {
                HandleInequality(stack);
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
                PopMethodParameters(methodInfo, stack);
            }
        }

        public void HandleAddition(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Decimal_Add");
        }

        public void HandleSubtraction(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Decimal_Subtract");
        }

        public void HandleMultiply(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Decimal_Multiply");
        }

        public void HandleDivision(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Decimal_Divide");
        }

        public void HandleModulus(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Decimal_Modulus");
        }

        public void HandleUnaryNegation(IBackendStackSimulator stack)
        {
            string operand = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Decimal_Negate");
        }

        public void HandleLessThan(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Decimal_LessThan");
        }

        public void HandleGreaterThan(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Decimal_GreaterThan");
        }

        public void HandleLessThanOrEqual(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Decimal_LessThanOrEqual");
        }

        public void HandleGreaterThanOrEqual(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Decimal_GreaterThanOrEqual");
        }

        public void HandleEquality(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Decimal_Equals");
        }

        public void HandleInequality(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Decimal_NotEquals");
        }

        public void HandleEquals(IBackendStackSimulator stack)
        {
            string obj = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Decimal_InstanceEquals");
        }

        public void HandleCompareTo(IBackendStackSimulator stack)
        {
            string obj = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Decimal_CompareTo");
        }

        private void HandleOpImplicit(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            string source = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Decimal_FromValue");
        }

        private void HandleOpExplicit(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            string source = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Decimal_ToValue");
        }

        private void HandleConstructor(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            if (methodInfo is MethodInfo mi)
            {
                var paramCount = mi.GetParameters().Length;
                AsmWriter?.WriteLine($"    ; Decimal constructor - {paramCount} parameters");
                
                if (paramCount > 0)
                {
                    AsmWriter?.WriteLine($"    JSR Decimal_Constructor");
                }
            }
        }

        private void PopMethodParameters(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            if (methodInfo is MethodInfo mi)
            {
                var paramCount = mi.GetParameters().Length;
                for (int i = 0; i < paramCount; i++)
                {
                    try { stack.Pop(); } catch { }
                }
                if (mi.ReturnType != typeof(void))
                {
                    AsmWriter?.WriteLine($"    LDA #0");
                    stack.Push("A");
                }
            }
        }
    }
}