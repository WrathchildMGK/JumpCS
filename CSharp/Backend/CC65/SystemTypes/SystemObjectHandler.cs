using System.Reflection;
using JumpCS.Backend.Base;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;

namespace JumpCS.Backend.CC65.SystemTypes
{
    /// <summary>Handler for System.Object type operations — CC65 C output</summary>
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
            AsmWriter?.WriteLine($"    /* System.Object.{method.Name} */");
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            string methodName = methodInfo.Name;

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
                AsmWriter?.WriteLine($"    /* TODO: System.Object.{methodName} */");
                var paramCount = methodInfo is MethodInfo mi ? mi.GetParameters().Length : 0;
                for (int i = 0; i < paramCount; i++)
                {
                    try { stack.Pop(); } catch { }
                }
                if (methodInfo is MethodInfo methodInfoTyped && methodInfoTyped.ReturnType != typeof(void))
                {
                    string resultReg = GetAvailableRegister(stack);
                    AsmWriter?.WriteLine($"    {resultReg} = 0; /* TODO: System.Object.{methodName} */");
                    stack.Push(resultReg);
                }
            }
        }

        private void HandleEquals(IBackendStackSimulator stack, MethodBase methodInfo)
        {
            var parameters = (methodInfo as MethodInfo)?.GetParameters() ?? Array.Empty<ParameterInfo>();

            if (parameters.Length == 2)
            {
                // Static method: Object.Equals(object a, object b)
                string objB = stack.Pop();
                string objA = stack.Pop();
                string resultReg = GetAvailableRegister(stack);
                AsmWriter?.WriteLine($"    {resultReg} = ({objA} == {objB}) ? 1 : 0;");
                stack.Push(resultReg);
            }
            else if (parameters.Length == 1)
            {
                // Instance method: this.Equals(object obj)
                string obj = stack.Pop();
                string instance = stack.Pop();
                string resultReg = GetAvailableRegister(stack);
                AsmWriter?.WriteLine($"    {resultReg} = ({instance} == {obj}) ? 1 : 0;");
                stack.Push(resultReg);
            }
        }

        private void HandleGetHashCode(IBackendStackSimulator stack)
        {
            // For integer types, the value itself is a reasonable hash
            string obj = stack.Pop();
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    {resultReg} = {obj}; /* GetHashCode — identity for integers */");
            stack.Push(resultReg);
        }

        private void HandleGetType(IBackendStackSimulator stack)
        {
            if (stack.StackDepth > 0)
                stack.Pop(); // pop 'this'
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    {resultReg} = 0; /* GetType — not supported on 6502 */");
            stack.Push(resultReg);
        }

        private void HandleToString(IBackendStackSimulator stack)
        {
            if (stack.StackDepth > 0)
                stack.Pop(); // pop 'this'
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    {resultReg} = 0; /* ToString — not supported on 6502 */");
            stack.Push(resultReg);
        }

        private void HandleReferenceEquals(IBackendStackSimulator stack)
        {
            // ReferenceEquals — same as Equals for value types
            string objB = stack.Pop();
            string objA = stack.Pop();
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    {resultReg} = ({objA} == {objB}) ? 1 : 0;");
            stack.Push(resultReg);
        }
    }
}