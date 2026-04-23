using System.Reflection;
using JumpCS.Backend.Base;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;

namespace JumpCS.Backend.Asm68000.SystemTypes
{
    /// <summary>Handler for System.Console type operations</summary>
    public class SystemConsoleHandler : SystemHandlerBase, ISystemConsoleHandler
    {
        public SystemConsoleHandler(
            StreamWriter asmWriter,
            Func<IBackendStackSimulator, string> getAvailableRegister)
            : base(asmWriter, getAvailableRegister)
        {
        }

        public override bool IsMethod(Core.MethodMetadata method)
        {
            return method.OwningClass.FullName == "System.Console";
        }

        public override bool IsReflectionMethod(MethodBase method)
        {
            return method.DeclaringType?.FullName == "System.Console";
        }

        public override void HandleMethodCall(Core.MethodMetadata method, IBackendStackSimulator stack)
        {
            // Console methods typically come from reflection, not compiled metadata
            AsmWriter?.WriteLine($"    ; TODO: System.Console.{method.Name}");
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            string methodName = methodInfo.Name;
            var parameters = ((MethodInfo)methodInfo).GetParameters();
            int paramCount = parameters.Length;

            AsmWriter?.WriteLine($"    ; System.Console.{methodName} - {paramCount} parameters");

            // Pop all parameters from stack
            for (int i = 0; i < paramCount; i++)
            {
                try
                {
                    stack.Pop();
                }
                catch (Exception ex)
                {
                    AsmWriter?.WriteLine($"    ; WARNING: Could not pop parameter {i}: {ex.Message}");
                }
            }

            // Emit appropriate console function call
            if (methodName == "WriteLine")
            {
                HandleWriteLine(parameters, stack);
            }
            else if (methodName == "Write")
            {
                HandleWrite(parameters, stack);
            }
            else if (methodName == "ReadLine")
            {
                HandleReadLine(stack);
            }
            else if (methodName == "Read")
            {
                HandleRead(stack);
            }
            else
            {
                AsmWriter?.WriteLine($"    ; TODO: Console.{methodName}");
            }
        }

        private void HandleWriteLine(ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            if (parameters.Length == 0)
            {
                // WriteLine() - no args, just newline
                AsmWriter?.WriteLine($"    JSR __console_writeline_empty  ; Console.WriteLine()");
            }
            else if (parameters.Length == 1)
            {
                if (parameters[0].ParameterType == typeof(string))
                {
                    // WriteLine(string) - most common
                    AsmWriter?.WriteLine($"    JSR __console_writeline  ; Console.WriteLine(string)");
                }
                else if (parameters[0].ParameterType == typeof(int))
                {
                    AsmWriter?.WriteLine($"    JSR __console_writeline_int  ; Console.WriteLine(int)");
                }
                else if (parameters[0].ParameterType == typeof(double))
                {
                    AsmWriter?.WriteLine($"    JSR __console_writeline_double  ; Console.WriteLine(double)");
                }
                else
                {
                    AsmWriter?.WriteLine($"    JSR __console_writeline  ; Console.WriteLine(object)");
                }
            }
            else if (parameters.Length == 2 && parameters[0].ParameterType == typeof(string))
            {
                // WriteLine(string format, object arg0)
                AsmWriter?.WriteLine($"    JSR __console_writeline_format  ; Console.WriteLine(string, object)");
            }
            else
            {
                AsmWriter?.WriteLine($"    JSR __console_writeline  ; Console.WriteLine (generic)");
            }
        }

        private void HandleWrite(ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            if (parameters.Length == 1)
            {
                if (parameters[0].ParameterType == typeof(string))
                {
                    AsmWriter?.WriteLine($"    JSR __console_write  ; Console.Write(string)");
                }
                else if (parameters[0].ParameterType == typeof(int))
                {
                    AsmWriter?.WriteLine($"    JSR __console_write_int  ; Console.Write(int)");
                }
                else if (parameters[0].ParameterType == typeof(double))
                {
                    AsmWriter?.WriteLine($"    JSR __console_write_double  ; Console.Write(double)");
                }
                else
                {
                    AsmWriter?.WriteLine($"    JSR __console_write  ; Console.Write(object)");
                }
            }
            else
            {
                AsmWriter?.WriteLine($"    JSR __console_write  ; Console.Write (generic)");
            }
        }

        private void HandleReadLine(IBackendStackSimulator stack)
        {
            // ReadLine() -> string
            AsmWriter?.WriteLine($"    JSR __console_readline  ; Console.ReadLine()");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L D0,{resultReg}  ; Store returned string");
            stack.Push(resultReg);
        }

        private void HandleRead(IBackendStackSimulator stack)
        {
            // Read() -> int
            AsmWriter?.WriteLine($"    JSR __console_read  ; Console.Read()");
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    MOVE.L D0,{resultReg}  ; Store returned int");
            stack.Push(resultReg);
        }
    }
}