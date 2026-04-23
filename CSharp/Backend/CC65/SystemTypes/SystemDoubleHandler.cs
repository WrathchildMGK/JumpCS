using System.Reflection;
using JumpCS.Backend.Base;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;

namespace JumpCS.Backend.CC65.SystemTypes
{
    /// <summary>Handler for System.Double type operations - CC65 (6502) target</summary>
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
            AsmWriter?.WriteLine($"    ; TODO: System.Double.{method.Name}");
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            string methodName = methodInfo.Name;
            AsmWriter?.WriteLine($"    ; System.Double.{methodName}");

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
                AsmWriter?.WriteLine($"    ; TODO: System.Double.{methodName}");
                PopMethodParameters(methodInfo, stack);
            }
        }

        public void HandleAddition(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    ; Double Addition (CC65 runtime)");
            AsmWriter?.WriteLine($"    JSR __adddf3     ; Delegate to CC65 runtime");
        }

        public void HandleSubtraction(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    ; Double Subtraction (CC65 runtime)");
            AsmWriter?.WriteLine($"    JSR __subdf3     ; Delegate to CC65 runtime");
        }

        public void HandleMultiply(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    ; Double Multiply (CC65 runtime)");
            AsmWriter?.WriteLine($"    JSR __muldf3     ; Delegate to CC65 runtime");
        }

        public void HandleDivision(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    ; Double Division (CC65 runtime)");
            AsmWriter?.WriteLine($"    JSR __divdf3     ; Delegate to CC65 runtime");
        }

        public void HandleRemainder(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    ; Double Remainder (CC65 runtime)");
            AsmWriter?.WriteLine($"    JSR fmod         ; Delegate to CC65 runtime");
        }

        public void HandleUnaryNegation(IBackendStackSimulator stack)
        {
            string operand = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Double_Negate");
        }

        public void HandleEquality(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Double_Equals");
        }

        public void HandleInequality(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Double_NotEquals");
        }

        public void HandleLessThan(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Double_LessThan");
        }

        public void HandleGreaterThan(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Double_GreaterThan");
        }

        public void HandleLessThanOrEqual(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Double_LessThanOrEqual");
        }

        public void HandleGreaterThanOrEqual(IBackendStackSimulator stack)
        {
            string right = stack.Pop();
            string left = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Double_GreaterThanOrEqual");
        }

        public void HandleEquals(IBackendStackSimulator stack)
        {
            string obj = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Double_InstanceEquals");
        }

        public void HandleIsNaN(IBackendStackSimulator stack)
        {
            string operand = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Double_IsNaN");
        }

        public void HandleIsInfinity(IBackendStackSimulator stack)
        {
            string operand = stack.Pop();   
            AsmWriter?.WriteLine($"    JSR Double_IsInfinity");
        }

        public void HandleIsPositiveInfinity(IBackendStackSimulator stack)
        {
            string operand = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Double_IsPositiveInfinity");
        }

        public void HandleIsNegativeInfinity(IBackendStackSimulator stack)
        {
            string operand = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Double_IsNegativeInfinity");
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