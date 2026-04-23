using System.Reflection;
using JumpCS.Backend.Base;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;

namespace JumpCS.Backend.Asm68000.SystemTypes
{
    /// <summary>Handler for System.Object type operations</summary>
    public class SystemObjectHandler : SystemHandlerBase, ISystemObjectHandler
    {
        public SystemObjectHandler(
            StreamWriter asmWriter,
            Func<IBackendStackSimulator, string> getAvailableRegister,
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

        public override void HandleMethodCall(MethodMetadata method, IBackendStackSimulator stack)
        {
            AsmWriter?.WriteLine($"    ; System.Object.{method.Name}");
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            string methodName = methodInfo.Name;
            AsmWriter?.WriteLine($"    ; System.Object.{methodName} (library call)");

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

        /// <summary>Object.Equals - instance or static comparison</summary>
        private void HandleEquals(IBackendStackSimulator stack, MethodBase methodInfo)
        {
            var parameters = (methodInfo as MethodInfo)?.GetParameters() ?? Array.Empty<ParameterInfo>();

            if (parameters.Length == 2)
            {
                // Static method: Object.Equals(object a, object b)
                string objB = stack.Pop();
                string objA = stack.Pop();

                AsmWriter?.WriteLine($"    MOVE.L {objA},D0");
                AsmWriter?.WriteLine($"    MOVE.L {objB},D1");
                AsmWriter?.WriteLine($"    JSR Object_Equals_Static  ; Library function");

                string resultReg = GetAvailableRegister(stack);
                AsmWriter?.WriteLine($"    MOVE.L D0,{resultReg}");
                stack.Push(resultReg);
            }
            else if (parameters.Length == 1)
            {
                // Instance method: this.Equals(object obj)
                string obj = stack.Pop();
                string self = stack.Pop();

                AsmWriter?.WriteLine($"    MOVE.L {self},D0");
                AsmWriter?.WriteLine($"    MOVE.L {obj},D1");
                AsmWriter?.WriteLine($"    JSR Object_Equals_Instance  ; Library function");

                string resultReg = GetAvailableRegister(stack);
                AsmWriter?.WriteLine($"    MOVE.L D0,{resultReg}");
                stack.Push(resultReg);
            }
        }

        /// <summary>Object.GetHashCode - returns hash code for object</summary>
        private void HandleGetHashCode(IBackendStackSimulator stack)
        {
            string obj = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {obj},D0");
            AsmWriter?.WriteLine($"    JSR Object_GetHashCode     ; Library function");

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L D0,{resultReg}");
            stack.Push(resultReg);
        }

        /// <summary>Object.GetType - returns type information for object</summary>
        private void HandleGetType(IBackendStackSimulator stack)
        {
            string obj = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {obj},D0");
            AsmWriter?.WriteLine($"    JSR Object_GetType         ; Library function");

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L D0,{resultReg}      ; Type object address");
            stack.Push(resultReg);
        }

        /// <summary>Object.ToString - converts object to string representation</summary>
        private void HandleToString(IBackendStackSimulator stack)
        {
            string obj = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {obj},D0");
            AsmWriter?.WriteLine($"    JSR Object_ToString        ; Library function");

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L D0,{resultReg}      ; String object address");
            stack.Push(resultReg);
        }

        /// <summary>Object.ReferenceEquals - compares object references for equality</summary>
        private void HandleReferenceEquals(IBackendStackSimulator stack)
        {
            string objB = stack.Pop();
            string objA = stack.Pop();

            AsmWriter?.WriteLine($"    MOVE.L {objA},D0");
            AsmWriter?.WriteLine($"    MOVE.L {objB},D1");
            AsmWriter?.WriteLine($"    JSR Object_ReferenceEquals ; Library function");

            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L D0,{resultReg}");
            stack.Push(resultReg);
        }
    }
}