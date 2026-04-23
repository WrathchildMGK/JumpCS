using System.Reflection;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;

namespace JumpCS.Backend.Asm68000.Opcodes
{
    public class Call : IOpcodeTranslation
    {
        public void Translate(object? operand, IBackendSupport support)
        {
            if (operand is not int methodToken)
            {
                support.AsmWriter.WriteLine($"    ; ERROR: Invalid operand for call");
                return;
            }

            // Get the calling class from the current method
            var callingClass = support.Method.OwningClass;

            // Try to resolve user method first
            var userMethod = support.ResolveMethodToken(callingClass, methodToken);
            if (userMethod != null)
            {
                HandleUserMethod(userMethod, support);
                return;
            }

            // Try framework method
            var frameworkMethod = support.TryResolveFrameworkMethod(callingClass, methodToken);
            if (frameworkMethod != null)
            {
                HandleFrameworkMethod(frameworkMethod, support);
                return;
            }

            // Unknown method
            HandleUnknownMethod(methodToken, support);
        }

        private void HandleUserMethod(MethodMetadata method, IBackendSupport support)
        {
            string methodLabel = $"{method.OwningClass.FullName}_{method.Name}";
            
            // Parse signature to get parameter count
            int paramCount = ExtractParameterCount(method.Signature);
            
            // Pop parameters from stack
            for (int i = 0; i < paramCount; i++)
            {
                try { support.Stack.Pop(); }
                catch { }
            }

            support.AsmWriter.WriteLine($"    ; Call {method.OwningClass.FullName}::{method.Name}");
            support.AsmWriter.WriteLine($"    JSR {methodLabel}");

            // Push return value if method is non-void
            if (!IsVoidSignature(method.Signature))
            {
                try
                {
                    string resultReg = support.Stack.AllocateDataRegister();
                    support.AsmWriter.WriteLine($"    ; Return value in D0");
                    support.Stack.Push(resultReg);
                }
                catch { }
            }
        }

        private void HandleFrameworkMethod(MethodBase method, IBackendSupport support)
        {
            string fullName = $"{method.DeclaringType?.FullName}::{method.Name}";
            
            support.AsmWriter.WriteLine($"    ; Framework call: {fullName}");
            
            // Cast support to Asm68000Support to access console and DIH handlers
            if (support is Asm68000.Asm68000Support asm68kSupport)
            {
                // Delegate to appropriate system handler based on type
                if (method.DeclaringType?.FullName == "System.Console")
                {
                    asm68kSupport.ConsoleHandler.HandleReflectionMethodCall(method, support.Stack);
                    return;
                }
                else if (method.DeclaringType?.FullName == "System.Runtime.CompilerServices.DefaultInterpolatedStringHandler")
                {
                    asm68kSupport.DefaultInterpolatedStringHandlerHandler.HandleReflectionMethodCall(method, support.Stack);
                    return;
                }
            }

            // Fall back to existing handlers
            if (method.DeclaringType?.Name == "Math")
            {
                support.MathHandler.HandleReflectionMethodCall(method, support.Stack);
            }
            else if (method.DeclaringType?.Name == "Decimal")
            {
                support.DecimalHandler.HandleReflectionMethodCall(method, support.Stack);
            }
            else if (method.DeclaringType?.Name == "Double")
            {
                support.DoubleHandler.HandleReflectionMethodCall(method, support.Stack);
            }
            else if (method.DeclaringType?.Name == "Single")
            {
                support.FloatHandler.HandleReflectionMethodCall(method, support.Stack);
            }
            else if (method.DeclaringType?.Name == "Int32" || method.DeclaringType?.Name == "Int64")
            {
                support.IntegerHandler.HandleReflectionMethodCall(method, support.Stack);
            }
            else if (method.DeclaringType?.Name == "IDisposable")
            {
                support.AsmWriter.WriteLine($"    ; TODO: IDisposable.{method.Name}");
            }
            else
            {
                support.AsmWriter.WriteLine($"    ; TODO: {fullName}");
                // Pop parameters conservatively
                var paramCount = (method as MethodInfo)?.GetParameters().Length ?? 0;
                for (int i = 0; i < paramCount; i++)
                {
                    try { support.Stack.Pop(); }
                    catch { break; }
                }
            }
            
            // Push return value if method is non-void
            var returnType = (method as MethodInfo)?.ReturnType;
            if (returnType != null && returnType != typeof(void))
            {
                try
                {
                    string resultReg = support.Stack.AllocateDataRegister();
                    support.Stack.Push(resultReg);
                }
                catch { }
            }
        }

        private void HandleUnknownMethod(int methodToken, IBackendSupport support)
        {
            support.AsmWriter.WriteLine($"    ; TODO: Unknown method token {methodToken:X8}");
            
            for (int i = 0; i < 2; i++)
            {
                try { support.Stack.Pop(); }
                catch { break; }
            }
            
            try
            {
                support.Stack.Push(support.Stack.AllocateDataRegister());
            }
            catch { }
        }

        private int ExtractParameterCount(string signature)
        {
            if (string.IsNullOrEmpty(signature) || !signature.StartsWith("("))
                return 0;

            int parenEnd = signature.IndexOf(')');
            if (parenEnd <= 1)
                return 0;

            string paramSection = signature.Substring(1, parenEnd - 1);
            if (string.IsNullOrEmpty(paramSection))
                return 0;

            int count = 0;
            int i = 0;
            while (i < paramSection.Length)
            {
                char c = paramSection[i];
                
                if (c == '[')
                {
                    while (i < paramSection.Length && paramSection[i] != ']')
                        i++;
                    i++;
                    continue;
                }

                if ("IJZCBDFV".IndexOf(c) >= 0)
                {
                    count++;
                    i++;
                }
                else if (c == 'L')
                {
                    count++;
                    while (i < paramSection.Length && paramSection[i] != ';')
                        i++;
                    i++;
                }
                else
                {
                    i++;
                }
            }

            return count;
        }

        private bool IsVoidSignature(string signature)
        {
            if (string.IsNullOrEmpty(signature))
                return true;

            int parenEnd = signature.IndexOf(')');
            if (parenEnd < 0 || parenEnd >= signature.Length - 1)
                return true;

            return signature[parenEnd + 1] == 'V';
        }
    }
}