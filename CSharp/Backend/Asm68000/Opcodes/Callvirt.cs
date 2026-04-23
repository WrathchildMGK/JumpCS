using System.Reflection;
using JumpCS.Backend.Interfaces;
using JumpCS.Core;

namespace JumpCS.Backend.Asm68000.Opcodes
{
    public class Callvirt : IOpcodeTranslation
    {
        public void Translate(object? operand, IBackendSupport support)
        {
            if (operand is not int methodToken)
            {
                support.AsmWriter.WriteLine($"    ; ERROR: Invalid operand for callvirt");
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
            
            // Parse signature to get parameter count (callvirt includes 'this')
            int paramCount = ExtractParameterCount(method.Signature) + 1;  // +1 for this
            
            // Pop this + parameters from stack
            for (int i = 0; i < paramCount; i++)
            {
                try { support.Stack.Pop(); }
                catch { }
            }

            support.AsmWriter.WriteLine($"    ; Virtual call {method.OwningClass.FullName}::{method.Name}");
            support.AsmWriter.WriteLine($"    JSR {methodLabel}  ; Virtual dispatch");

            // Push return value if method is non-void
            if (!IsVoidSignature(method.Signature))
            {
                try
                {
                    string resultReg = support.Stack.AllocateDataRegister();
                    support.Stack.Push(resultReg);
                }
                catch { }
            }
        }

        private void HandleFrameworkMethod(MethodBase method, IBackendSupport support)
        {
            string fullName = $"{method.DeclaringType?.FullName}::{method.Name}";
            
            // Pop this + parameters
            var paramCount = ((method as MethodInfo)?.GetParameters().Length ?? 0) + 1;
            for (int i = 0; i < paramCount; i++)
            {
                try { support.Stack.Pop(); }
                catch { }
            }

            support.AsmWriter.WriteLine($"    ; Virtual framework call: {fullName}");
            support.AsmWriter.WriteLine($"    ; TODO: Virtual dispatch for {fullName}");

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
            support.AsmWriter.WriteLine($"    ; TODO: Unknown virtual method token {methodToken:X8}");
            
            // Conservative: assume this + 2 parameters + 1 return value
            for (int i = 0; i < 3; i++)
            {
                try { support.Stack.Pop(); }
                catch { break; }
            }
            
            // Assume returns value
            try
            {
                support.Stack.Push(support.Stack.AllocateDataRegister());
            }
            catch { }
        }

        /// <summary>
        /// Extract parameter count from MSIL signature descriptor.
        /// Format: (param1 param2 ...)returnType
        /// Example: (II)Z → 2 parameters
        /// </summary>
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
                
                // Skip array indicators
                if (c == '[')
                {
                    while (i < paramSection.Length && paramSection[i] != ']')
                        i++;
                    i++;
                    continue;
                }

                // Count primitive types (single char)
                if ("IJZCBDFV".IndexOf(c) >= 0)
                {
                    count++;
                    i++;
                }
                // Handle object/class references (L...;)
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

        /// <summary>
        /// Check if method signature indicates void return type.
        /// Format: (...)returnType
        /// Void is indicated by )V at the end.
        /// </summary>
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