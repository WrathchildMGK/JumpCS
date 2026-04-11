using System.Reflection;
using System.Text;

namespace JumpCS.Backend.SystemTypes
{
    /// <summary>Handler for System.Math type operations</summary>
    public class SystemMathHandler : SystemHandlerBase
    {
        public SystemMathHandler(
            StreamWriter asmWriter,
            Func<Asm68000StackSimulator, string> getAvailableRegister)
            : base(asmWriter, getAvailableRegister)
        {
        }

        public override bool IsMethod(JumpCS.Core.MethodMetadata method)
        {
            return method.OwningClass.FullName == "System.Math";
        }

        public override bool IsReflectionMethod(MethodBase method)
        {
            return method.DeclaringType?.FullName == "System.Math";
        }

        public override void HandleMethodCall(JumpCS.Core.MethodMetadata method, Asm68000StackSimulator stack)
        {
            // System.Math methods typically come from reflection, not compiled metadata
            AsmWriter?.WriteLine($"    ; TODO: System.Math.{method.Name}");
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, Asm68000StackSimulator stack)
        {
            string methodName = methodInfo.Name;
            var parameters = ((MethodInfo)methodInfo).GetParameters();
            int paramCount = parameters.Length;
            
            AsmWriter?.WriteLine($"    ; System.Math.{methodName} - {paramCount} parameters (stub)");

            // Pop all arguments
            for (int i = 0; i < paramCount; i++)
            {
                try
                {
                    stack.Pop();
                }
                catch (Exception ex)
                {
                    AsmWriter?.WriteLine($"    ; WARNING: Could not pop argument {i}: {ex.Message}");
                }
            }

            // Push return value if non-void
            var returnType = ((MethodInfo)methodInfo).ReturnType;
            if (returnType != typeof(void))
            {
                string resultReg = GetAvailableRegister(stack);
                AsmWriter?.WriteLine($"    MOVE.L #0,{resultReg}     ; TODO: {methodName} result");
                stack.Push(resultReg);
            }
        }
    }
}