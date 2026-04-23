using System.Reflection;
using JumpCS.Backend.Base;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;

namespace JumpCS.Backend.CC65.SystemTypes
{
    /// <summary>Handler for System.Console type operations in CC65 backend</summary>
    public class SystemConsoleHandler : SystemHandlerBase, ISystemConsoleHandler
    {
        public SystemConsoleHandler(
            StreamWriter asmWriter,
            Func<IBackendStackSimulator, string> getAvailableRegister)
            : base(asmWriter, getAvailableRegister)
        {
        }

        public override bool IsMethod(MethodMetadata method)
        {
            return method.OwningClass.FullName == "System.Console";
        }

        public override bool IsReflectionMethod(MethodBase method)
        {
            return method.DeclaringType?.FullName == "System.Console";
        }

        public override void HandleMethodCall(MethodMetadata method, IBackendStackSimulator stack)
        {
            // Console methods typically come from reflection, not compiled metadata
            AsmWriter?.WriteLine($"    /* TODO: System.Console.{method.Name} */");
        }

        public override void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            string methodName = methodInfo.Name;
            var parameters = ((MethodInfo)methodInfo).GetParameters();
            int paramCount = parameters.Length;

            AsmWriter?.WriteLine($"    /* System.Console.{methodName} - {paramCount} parameters */");

            // Pop all parameters from stack
            for (int i = 0; i < paramCount; i++)
            {
                try
                {
                    stack.Pop();
                }
                catch (Exception ex)
                {
                    AsmWriter?.WriteLine($"    /* WARNING: Could not pop parameter {i}: {ex.Message} */");
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
                AsmWriter?.WriteLine($"    /* TODO: Console.{methodName} */");
            }
        }

        private void HandleWriteLine(ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            if (parameters.Length == 0)
            {
                // WriteLine() - no args, just newline
                AsmWriter?.WriteLine($"    __console_writeline_empty();  /* Console.WriteLine() */");
            }
            else if (parameters.Length == 1)
            {
                if (parameters[0].ParameterType == typeof(string))
                {
                    // WriteLine(string) - most common
                    AsmWriter?.WriteLine($"    __console_writeline(s0);  /* Console.WriteLine(string) */");
                }
                else if (parameters[0].ParameterType == typeof(int))
                {
                    AsmWriter?.WriteLine($"    __console_writeline_int(s0);  /* Console.WriteLine(int) */");
                }
                else if (parameters[0].ParameterType == typeof(double))
                {
                    AsmWriter?.WriteLine($"    __console_writeline_double(s0);  /* Console.WriteLine(double) */");
                }
                else
                {
                    AsmWriter?.WriteLine($"    __console_writeline(s0);  /* Console.WriteLine(object) */");
                }
            }
            else if (parameters.Length == 2 && parameters[0].ParameterType == typeof(string))
            {
                // WriteLine(string format, object arg0)
                AsmWriter?.WriteLine($"    __console_writeline_format(s1, s0);  /* Console.WriteLine(string, object) */");
            }
            else
            {
                AsmWriter?.WriteLine($"    __console_writeline(s0);  /* Console.WriteLine (generic) */");
            }
        }

        private void HandleWrite(ParameterInfo[] parameters, IBackendStackSimulator stack)
        {
            if (parameters.Length == 1)
            {
                if (parameters[0].ParameterType == typeof(string))
                {
                    AsmWriter?.WriteLine($"    __console_write(s0);  /* Console.Write(string) */");
                }
                else if (parameters[0].ParameterType == typeof(int))
                {
                    AsmWriter?.WriteLine($"    __console_write_int(s0);  /* Console.Write(int) */");
                }
                else if (parameters[0].ParameterType == typeof(double))
                {
                    AsmWriter?.WriteLine($"    __console_write_double(s0);  /* Console.Write(double) */");
                }
                else
                {
                    AsmWriter?.WriteLine($"    __console_write(s0);  /* Console.Write(object) */");
                }
            }
            else
            {
                AsmWriter?.WriteLine($"    __console_write(s0);  /* Console.Write (generic) */");
            }
        }

        private void HandleReadLine(IBackendStackSimulator stack)
        {
            // ReadLine() -> string
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    {resultReg} = __console_readline();  /* Console.ReadLine() */");
            stack.Push(resultReg);
        }

        private void HandleRead(IBackendStackSimulator stack)
        {
            // Read() -> int
            string resultReg = GetAvailableRegister(stack);
            AsmWriter?.WriteLine($"    {resultReg} = __console_read();  /* Console.Read() */");
            stack.Push(resultReg);
        }
    }
}