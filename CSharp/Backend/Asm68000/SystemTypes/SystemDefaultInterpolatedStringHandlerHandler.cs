using System.Reflection;
using JumpCS.Backend.Base;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;

namespace JumpCS.Backend.Asm68000.SystemTypes
{
    /// <summary>Handler for System.Runtime.CompilerServices.DefaultInterpolatedStringHandler</summary>
    public class SystemDefaultInterpolatedStringHandlerHandler : SystemHandlerBase, ISystemDefaultInterpolatedStringHandlerHandler
    {
        public SystemDefaultInterpolatedStringHandlerHandler(
            StreamWriter asmWriter,
            Func<IBackendStackSimulator, string> getAvailableRegister)
            : base(asmWriter, getAvailableRegister)
        {
        }

        public override bool IsMethod(Core.MethodMetadata method)
        {
            return method.OwningClass.FullName == "System.Runtime.CompilerServices.DefaultInterpolatedStringHandler";
        }

        public override bool IsReflectionMethod(MethodBase method)
        {
            return method.DeclaringType?.FullName == "System.Runtime.CompilerServices.DefaultInterpolatedStringHandler";
        }

        public override void HandleMethodCall(Core.MethodMetadata method, IBackendStackSimulator stack)
        {
            // Metadata methods typically not used - comes from reflection
            AsmWriter?.WriteLine($"    ; TODO: DefaultInterpolatedStringHandler.{method.Name}");
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            string methodName = methodInfo.Name;
            var parameters = ((MethodInfo)methodInfo).GetParameters();
            int paramCount = parameters.Length;

            AsmWriter?.WriteLine($"    ; System.Runtime.CompilerServices.DefaultInterpolatedStringHandler.{methodName}");

            // Route to specific handler based on method name
            if (methodName == ".ctor")
            {
                HandleConstructor(parameters, stack);
            }
            else if (methodName == "AppendLiteral")
            {
                HandleAppendLiteral(parameters, stack);
            }
            else if (methodName == "AppendFormatted")
            {
                HandleAppendFormatted(parameters, stack);
            }
            else if (methodName == "ToStringAndClear")
            {
                HandleToStringAndClear(parameters, stack);
            }
            else
            {
                AsmWriter?.WriteLine($"    ; TODO: DefaultInterpolatedStringHandler.{methodName}");
                for (int i = 0; i < paramCount; i++)
                {
                    try { stack.Pop(); }
                    catch { break; }
                }
            }
        }

        private void HandleConstructor(ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            // .ctor(struct&, int capacity, int formattedCount)
            // Pop capacity and formattedCount parameters
            // Note: struct ref (implicit via ldloca.s) is NOT popped
            for (int i = 1; i < parameters.Length; i++)
            {
                try { stack.Pop(); }
                catch { }
            }

            AsmWriter?.WriteLine($"    JSR __dih_ctor  ; DefaultInterpolatedStringHandler..ctor");
        }

        private void HandleAppendLiteral(ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            // AppendLiteral(struct&, string literal)
            // Pop string literal parameter
            // Struct ref remains for chaining
            for (int i = 0; i < parameters.Length; i++)
            {
                try { stack.Pop(); }
                catch { }
            }

            AsmWriter?.WriteLine($"    JSR __dih_append_literal  ; DefaultInterpolatedStringHandler.AppendLiteral");
        }

        private void HandleAppendFormatted(ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            // AppendFormatted(struct&, value, [alignment], [format])
            // Pop all parameters except struct ref
            for (int i = 0; i < parameters.Length; i++)
            {
                try { stack.Pop(); }
                catch { }
            }

            AsmWriter?.WriteLine($"    JSR __dih_append_formatted  ; DefaultInterpolatedStringHandler.AppendFormatted");
        }

        private void HandleToStringAndClear(ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            // ToStringAndClear(struct&) -> string
            // Pop struct ref, push result string
            for (int i = 0; i < parameters.Length; i++)
            {
                try { stack.Pop(); }
                catch { }
            }

            AsmWriter?.WriteLine($"    JSR __dih_to_string_and_clear  ; DefaultInterpolatedStringHandler.ToStringAndClear");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L D0,{resultReg}  ; Return interpolated string result");
            stack.Push(resultReg);
        }
    }
}