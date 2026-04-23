using System.Reflection;
using JumpCS.Backend.Core;
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

            var callingClass = support.Method.OwningClass;

            var userMethod = support.ResolveMethodToken(callingClass, methodToken);
            if (userMethod != null)
            {
                HandleUserMethod(userMethod, support);
                return;
            }

            var frameworkMethod = support.TryResolveFrameworkMethod(callingClass, methodToken);
            if (frameworkMethod != null)
            {
                HandleFrameworkMethod(frameworkMethod, support);
                return;
            }

            HandleUnknownMethod(methodToken, support);
        }

        private void HandleUserMethod(MethodMetadata method, IBackendSupport support)
        {
            string methodLabel = $"{method.OwningClass.FullName}_{method.Name}";
            
            int paramCount = ExtractParameterCount(method.Signature);
            
            for (int i = 0; i < paramCount; i++)
            {
                try { support.Stack.Pop(); }
                catch { }
            }

            support.AsmWriter.WriteLine($"    ; Call {method.OwningClass.FullName}::{method.Name}");
            support.AsmWriter.WriteLine($"    JSR {methodLabel}");

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
            
            // Check if framework method is supported
            if (!FrameworkMethodRegistry.IsSupported(method))
            {
                support.AsmWriter.WriteLine($"    ; ERROR: Unsupported framework method: {fullName}");
                support.AsmWriter.WriteLine($"    ; Not in FrameworkMethodRegistry");
                
                var paramCount = (method as MethodInfo)?.GetParameters().Length ?? 0;
                for (int i = 0; i < paramCount; i++)
                {
                    try { support.Stack.Pop(); }
                    catch { break; }
                }
                return;
            }

            support.AsmWriter.WriteLine($"    ; Framework call: {fullName}");

            // Try direct library function implementation first
            if (FrameworkMethodRegistry.TryGetDirectImplementation(method, out var implInfo))
            {
                // Pop parameters
                for (int i = 0; i < implInfo.ParameterCount; i++)
                {
                    try { support.Stack.Pop(); }
                    catch { }
                }
                
                // Emit library call
                support.AsmWriter.WriteLine($"    JSR {implInfo.LibraryFunction}");
                
                // Push return value if applicable
                if (implInfo.HasReturnValue)
                {
                    try
                    {
                        string resultReg = support.Stack.AllocateDataRegister();
                        support.Stack.Push(resultReg);
                    }
                    catch { }
                }
            }
            else
            {
                // Handled by system type handler - delegate to appropriate one
                if (support is Asm68000.Asm68000Support asm68kSupport)
                {
                    if (method.DeclaringType?.FullName == "System.Console")
                    {
                        asm68kSupport.ConsoleHandler.HandleReflectionMethodCall(method, support.Stack);
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
                    else if (method.DeclaringType?.Name == "Object")
                    {
                        support.ObjectHandler.HandleReflectionMethodCall(method, support.Stack);
                    }
                    else if (method.DeclaringType?.Name == "Math")
                    {
                        support.MathHandler.HandleReflectionMethodCall(method, support.Stack);
                    }
                    else
                    {
                        support.AsmWriter.WriteLine($"    ; TODO: {fullName}");
                    }
                }
            }
        }

        private void HandleUnknownMethod(int methodToken, IBackendSupport support)
        {
            support.AsmWriter.WriteLine($"    ; ERROR: Unknown method token {methodToken:X8}");
            
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