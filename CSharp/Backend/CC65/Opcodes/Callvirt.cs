using System.Reflection;
using JumpCS.Backend.Core;
using JumpCS.Backend.Interfaces;
using JumpCS.Core;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>callvirt — invoke a virtual method</summary>
public class Callvirt : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is not int methodToken) return;

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
        // For callvirt, we have 'this' + parameters
        int paramCount = ExtractParameterCount(method.Signature) + 1;  // +1 for this

        support.EmitComment($"callvirt {method.OwningClass.FullName}.{method.Name}");

        string methodKey = CC65MethodBank.GetMethodKey(method.OwningClass, method);
        CC65MethodBank methodBank = ((CC65Support)support).MethodBank;

        if (methodBank.Assignments.TryGetValue(methodKey, out var assign))
        {
            // Pop this + parameters from stack
            for (int i = 0; i < paramCount && support.Stack.StackDepth > 0; i++)
                support.Stack.Pop();

            bool isVoid = method.Signature.EndsWith(")V");
            if (isVoid)
            {
                support.Emit($"call_banked({assign.MethodId}); /* virtual {method.Name} */");
            }
            else
            {
                string temp = support.Stack.AllocateDataRegister();
                support.Emit($"{temp} = call_banked({assign.MethodId}); /* virtual {method.Name} */");
                support.Stack.Push(temp);
            }
        }
        else
        {
            support.EmitComment($"ERROR: method not assigned to bank: {method.Name}");
        }
    }

    private void HandleFrameworkMethod(MethodBase method, IBackendSupport support)
    {
        string fullName = $"{method.DeclaringType?.FullName}::{method.Name}";

        // Check if framework method is supported
        if (!FrameworkMethodRegistry.IsSupported(method))
        {
            support.EmitComment($"ERROR: Unsupported framework method: {fullName}");
            support.EmitComment($"Not in FrameworkMethodRegistry");

            // Pop this + parameters
            var paramCount = ((method as MethodInfo)?.GetParameters().Length ?? 0) + 1;
            for (int i = 0; i < paramCount && support.Stack.StackDepth > 0; i++)
                support.Stack.Pop();
            return;
        }

        support.EmitComment($"Virtual framework call: {fullName}");

        // Try direct library function implementation first
        if (FrameworkMethodRegistry.TryGetDirectImplementation(method, out var implInfo))
        {
            // Pop this + parameters
            var paramCount = ((method as MethodInfo)?.GetParameters().Length ?? 0) + 1;
            for (int i = 0; i < paramCount && support.Stack.StackDepth > 0; i++)
                support.Stack.Pop();

            support.Emit($"/* Direct library call: {implInfo.LibraryFunction} */");
            // TODO: CC65 needs to resolve library function to method ID and use call_banked

            if (implInfo.HasReturnValue)
            {
                string temp = support.Stack.AllocateDataRegister();
                support.Emit($"{temp} = 0; /* TODO: return from {implInfo.LibraryFunction} */");
                support.Stack.Push(temp);
            }
        }
        else
        {
            // Handled by system type handler - delegate to appropriate one
            var handler = FrameworkMethodRegistry.GetSystemHandler(method);
            if (handler != null)
            {
                handler.HandleReflectionMethodCall(method, support.Stack);
            }
            else
            {
                support.EmitComment($"ERROR: No handler for {fullName}");
            }
        }
    }

    private void HandleUnknownMethod(int methodToken, IBackendSupport support)
    {
        support.EmitComment($"ERROR: unresolved method token 0x{methodToken:X8}");
    }

    private static int ExtractParameterCount(string signature)
    {
        // Signature format: "(params)return"
        int startIdx = signature.IndexOf('(');
        int endIdx = signature.IndexOf(')');
        if (startIdx < 0 || endIdx < 0) return 0;

        string paramPart = signature.Substring(startIdx + 1, endIdx - startIdx - 1);
        int count = 0;
        int i = 0;
        while (i < paramPart.Length)
        {
            if (paramPart[i] == 'L')
            {
                // Object type: L...;
                int semiIdx = paramPart.IndexOf(';', i);
                if (semiIdx >= 0) i = semiIdx + 1;
                else break;
            }
            else if (paramPart[i] == '[')
            {
                // Array type: skip [, then process element type
                i++;
                if (i < paramPart.Length)
                {
                    if (paramPart[i] == 'L')
                    {
                        int semiIdx = paramPart.IndexOf(';', i);
                        if (semiIdx >= 0) i = semiIdx + 1;
                        else break;
                    }
                    else i++;
                }
            }
            else
            {
                i++;
            }
            count++;
        }
        return count;
    }
}