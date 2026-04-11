using System.Reflection;
using System.Text;
using JumpCS.Core;

namespace JumpCS.Backend.SystemTypes
{
    /// <summary>Handler for System.Object type operations</summary>
    public class SystemObjectHandler : SystemHandlerBase
    {
        public SystemObjectHandler(
            StreamWriter asmWriter,
            Func<Asm68000StackSimulator, string> getAvailableRegister,
            Func<string> getUniqueLabel)
            : base(asmWriter, getAvailableRegister, getUniqueLabel)
        {
        }

        public override bool IsMethod(MethodMetadata method)
        {
            return method.OwningClass.FullName == "System.Object";
        }

        public override bool IsReflectionMethod(MethodBase method)
        {
            return method.DeclaringType?.FullName == "System.Object";
        }

        public override void HandleMethodCall(MethodMetadata method, Asm68000StackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; System.Object.{method.Name}");
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, Asm68000StackSimulator stack)
        {
            string methodName = methodInfo.Name;
            AsmWriter?.WriteLine($"    ; System.Object.{methodName} (inline)");

            if (methodName == "Equals")
            {
                HandleEquals(stack, methodInfo);
            }
            else if (methodName == "GetHashCode")
            {
                HandleGetHashCode(stack);
            }
            else if (methodName == "GetType")
            {
                HandleGetType(stack);
            }
            else if (methodName == "ToString")
            {
                HandleToString(stack);
            }
            else if (methodName == "ReferenceEquals")
            {
                HandleReferenceEquals(stack);
            }
            else
            {
                AsmWriter?.WriteLine($"    ; TODO: System.Object.{methodName}");
                var paramCount = methodInfo is MethodInfo mi ? mi.GetParameters().Length : 0;
                for (int i = 0; i < paramCount; i++)
                {
                    try { stack.Pop(); } catch { }
                }
                if (methodInfo is MethodInfo methodInfoTyped && methodInfoTyped.ReturnType != typeof(void))
                {
                    string resultReg = GetAvailableRegister(stack);
                    AsmWriter?.WriteLine($"    CLR.L {resultReg}");
                    stack.Push(resultReg);
                }
            }
        }

        private void HandleEquals(Asm68000StackSimulator stack, MethodBase methodInfo)
        {
            var parameters = (methodInfo as MethodInfo)?.GetParameters() ?? Array.Empty<ParameterInfo>();
            
            if (parameters.Length == 2)
            {
                // Static method: Equals(object a, object b)
                string objB = stack.Pop();
                string objA = stack.Pop();
                
                string resultReg = GetAvailableRegister(stack);
                string label = GetUniqueLabel();
                
                AsmWriter?.WriteLine($"    CMP.L {objB},{objA}");
                AsmWriter?.WriteLine($"    BEQ {label}_eq");
                AsmWriter?.WriteLine($"    CLR.L {resultReg}");
                AsmWriter?.WriteLine($"    BRA {label}_end");
                AsmWriter?.WriteLine($"{label}_eq:");
                AsmWriter?.WriteLine($"    MOVE.L #1,{resultReg}");
                AsmWriter?.WriteLine($"{label}_end:");
                
                stack.Push(resultReg);
            }
            else if (parameters.Length == 1)
            {
                // Instance method: this.Equals(object obj)
                string obj = stack.Pop();
                
                string resultReg = GetAvailableRegister(stack);
                AsmWriter?.WriteLine($"    ; Instance Equals({obj})");
                AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; TODO: Instance equals");
                
                stack.Push(resultReg);
            }
        }

        private void HandleGetHashCode(Asm68000StackSimulator stack)
        {
            string obj = stack.Pop();
            
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    ; GetHashCode({obj})");
            AsmWriter?.WriteLine($"    MOVE.L {obj},{resultReg}");
            AsmWriter?.WriteLine($"    ; TODO: Calculate hash code");
            
            stack.Push(resultReg);
        }

        private void HandleGetType(Asm68000StackSimulator stack)
        {
            string obj = stack.Pop();
            
            AsmWriter?.WriteLine($"    ; GetType({obj})");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; TODO: Get type");
            
            stack.Push(resultReg);
        }

        private void HandleToString(Asm68000StackSimulator stack)
        {
            string obj = stack.Pop();
            
            AsmWriter?.WriteLine($"    ; ToString({obj})");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    CLR.L {resultReg}     ; TODO: Convert to string");
            
            stack.Push(resultReg);
        }

        private void HandleReferenceEquals(Asm68000StackSimulator stack)
        {
            string objB = stack.Pop();
            string objA = stack.Pop();
            
            string resultReg = GetAvailableRegister(stack);
            string label = GetUniqueLabel();
            
            AsmWriter?.WriteLine($"    CMP.L {objB},{objA}");
            AsmWriter?.WriteLine($"    BEQ {label}_eq");
            AsmWriter?.WriteLine($"    CLR.L {resultReg}");
            AsmWriter?.WriteLine($"    BRA {label}_end");
            AsmWriter?.WriteLine($"{label}_eq:");
            AsmWriter?.WriteLine($"    MOVE.L #1,{resultReg}");
            AsmWriter?.WriteLine($"{label}_end:");
            
            stack.Push(resultReg);
        }
    }
}