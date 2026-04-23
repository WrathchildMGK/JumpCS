using System.Reflection;
using JumpCS.Backend.Base;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;

namespace JumpCS.Backend.CC65.SystemTypes
{
    /// <summary>Handler for System.Math type operations - CC65 (6502) target</summary>
    public class SystemMathHandler : SystemHandlerBase, ISystemMathHandler
    {
        private readonly Func<string> getUniqueLabel;

        public SystemMathHandler(
            StreamWriter asmWriter,
            Func<IBackendStackSimulator, string> getAvailableRegister,
            Func<string> getUniqueLabel = null)
            : base(asmWriter, getAvailableRegister)
        {
            this.getUniqueLabel = getUniqueLabel ?? (() => $"L{System.Guid.NewGuid().ToString("N").Substring(0, 8)}");
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
            AsmWriter?.WriteLine($"    ; TODO: System.Math.{method.Name}");
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            string methodName = methodInfo.Name;
            var parameters = ((MethodInfo)methodInfo).GetParameters();
            int paramCount = parameters.Length;

            // Route to specific handler based on method name
            if (methodName == "Abs")
            {
                HandleAbs(methodInfo, parameters, stack);
            }
            else if (methodName == "Round")
            {
                HandleRound(methodInfo, parameters, stack);
            }
            else if (methodName == "Truncate")
            {
                HandleTruncate(methodInfo, parameters, stack);
            }
            else if (methodName == "Floor")
            {
                HandleFloor(methodInfo, parameters, stack);
            }
            else if (methodName == "Ceiling")
            {
                HandleCeiling(methodInfo, parameters, stack);
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
            else
            {
                AsmWriter?.WriteLine($"    ; TODO: System.Math.{methodName}");
            }
        }

        /// <summary>Math.Abs for various integer types</summary>
        private void HandleAbs(MethodBase methodInfo, ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            if (parameters.Length != 1)
                return;

            Type paramType = parameters[0].ParameterType;
            string typeName = paramType.Name;

            AsmWriter?.WriteLine($"    ; Math.Abs({typeName})");

            if (typeName == "Int32")
            {
                string operand = stack.Pop();
                AsmWriter?.WriteLine($"    JSR Math_Abs_Int32");
                stack.Push(operand);
            }
            else if (typeName == "Int64")
            {
                string operand = stack.Pop();
                AsmWriter?.WriteLine($"    JSR Math_Abs_Int64");
                stack.Push(operand);
            }
            else
            {
                // For other types, pop and push placeholder
                stack.Pop();
                AsmWriter?.WriteLine($"    LDA #0");
                stack.Push("A");
            }
        }

        /// <summary>Math.Round for integer types (typically no-op)</summary>
        private void HandleRound(MethodBase methodInfo, ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; Math.Round - for integers, this is typically identity");
            // For integers, rounding is a no-op
            // Result is already on stack
        }

        /// <summary>Math.Truncate for integer types (typically no-op)</summary>
        private void HandleTruncate(MethodBase methodInfo, ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; Math.Truncate - for integers, this is typically identity");
            // For integers, truncation is a no-op
        }

        /// <summary>Math.Floor for integer types (typically no-op)</summary>
        private void HandleFloor(MethodBase methodInfo, ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; Math.Floor - for integers, this is typically identity");
            // For integers, floor is a no-op
        }

        /// <summary>Math.Ceiling for integer types (typically no-op)</summary>
        private void HandleCeiling(MethodBase methodInfo, ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; Math.Ceiling - for integers, this is typically identity");
            // For integers, ceiling is a no-op
        }

        /// <summary>Math.Sqrt (delegates to library - requires floating point)</summary>
        private void HandleSqrt(IBackendStackSimulator stack)
        {
            string operand = stack.Pop();
            AsmWriter?.WriteLine($"    ; Math.Sqrt");
            AsmWriter?.WriteLine($"    JSR Math_Sqrt");
            stack.Push(operand);
        }

        /// <summary>Math.Pow (delegates to library - requires floating point)</summary>
        private void HandlePow(IBackendStackSimulator stack)
        {
            string exponent = stack.Pop();
            string baseVal = stack.Pop();
            AsmWriter?.WriteLine($"    ; Math.Pow");
            AsmWriter?.WriteLine($"    JSR Math_Pow");
            stack.Push(baseVal);
        }

        /// <summary>Math.Log (delegates to library - requires floating point)</summary>
        private void HandleLog(IBackendStackSimulator stack)
        {
            string operand = stack.Pop();
            AsmWriter?.WriteLine($"    ; Math.Log");
            AsmWriter?.WriteLine($"    JSR Math_Log");
            stack.Push(operand);
        }

        /// <summary>Math.Sin (delegates to library - requires floating point)</summary>
        private void HandleSin(IBackendStackSimulator stack)
        {
            string operand = stack.Pop();
            AsmWriter?.WriteLine($"    ; Math.Sin");
            AsmWriter?.WriteLine($"    JSR Math_Sin");
            stack.Push(operand);
        }

        /// <summary>Math.Cos (delegates to library - requires floating point)</summary>
        private void HandleCos(IBackendStackSimulator stack)
        {
            string operand = stack.Pop();
            AsmWriter?.WriteLine($"    ; Math.Cos");
            AsmWriter?.WriteLine($"    JSR Math_Cos");
            stack.Push(operand);
        }
    }
}