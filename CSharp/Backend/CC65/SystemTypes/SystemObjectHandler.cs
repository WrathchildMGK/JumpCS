using System.Reflection;
using JumpCS.Backend.Base;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;

namespace JumpCS.Backend.CC65.SystemTypes
{
    /// <summary>Handler for System.Object type operations - CC65 (6502) target</summary>
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
            AsmWriter?.WriteLine($"    ; TODO: System.Object.{method.Name}");
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            string methodName = methodInfo.Name;
            AsmWriter?.WriteLine($"    ; System.Object.{methodName}");

            if (methodName == "Equals")
            {
                HandleEquals(stack, methodInfo);
            }
            else if (methodName == "ReferenceEquals")
            {
                HandleReferenceEquals(stack);
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
            else
            {
                AsmWriter?.WriteLine($"    ; TODO: System.Object.{methodName}");
                PopMethodParameters(methodInfo, stack);
            }
        }

        public void HandleEquals(IBackendStackSimulator stack, MethodBase methodInfo)
        {
            var parameters = ((MethodInfo)methodInfo).GetParameters();

            if (parameters.Length == 2)
            {
                // Static method: Object.Equals(object a, object b)
                string objB = stack.Pop();
                string objA = stack.Pop();
                AsmWriter?.WriteLine($"    JSR Object_Equals");
            }
            else if (parameters.Length == 1)
            {
                // Instance method: this.Equals(object obj)
                string obj = stack.Pop();
                AsmWriter?.WriteLine($"    JSR Object_InstanceEquals");
            }
        }

        public void HandleReferenceEquals(IBackendStackSimulator stack)
        {
            string objB = stack.Pop();
            string objA = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Object_ReferenceEquals");
        }

        public void HandleGetHashCode(IBackendStackSimulator stack)
        {
            string instance = stack.Pop();
            AsmWriter?.WriteLine($"    JSR Object_GetHashCode");
        }

        public void HandleGetType(IBackendStackSimulator stack)
        {
            string instance = stack.Pop();
            AsmWriter?.WriteLine($"    ; TODO: GetType requires metadata access");
            AsmWriter?.WriteLine($"    JSR Object_GetType");
        }

        public void HandleToString(IBackendStackSimulator stack)
        {
            string instance = stack.Pop();
            AsmWriter?.WriteLine($"    ; TODO: ToString requires virtual dispatch");
            AsmWriter?.WriteLine($"    JSR Object_ToString");
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