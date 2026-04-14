using System.Reflection;
using JumpCS.Backend.Interfaces;
using JumpCS.Core;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>call / callvirt — invoke a method</summary>
public class Call : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is not int methodToken) return;

        var targetMethod = support.ResolveMethodToken(support.Method.OwningClass, methodToken);

        if (targetMethod != null)
        {
            string funcName = CC65BackEnd.GetCFunctionName(targetMethod.OwningClass, targetMethod);
            bool isVoid = targetMethod.Signature.EndsWith(")V");

            support.EmitComment($"call {targetMethod.OwningClass.FullName}.{targetMethod.Name}");

            string methodKey = CC65MethodBank.GetMethodKey(targetMethod.OwningClass, targetMethod);
            CC65MethodBank methodBank = ((CC65Support)support).MethodBank;
            if (methodBank.Assignments.TryGetValue(methodKey, out var assign))
            {
                if (isVoid)
                {
                    support.Emit($"call_banked({assign.MethodId}); /* {funcName} */");
                }
                else
                {
                    string temp = support.Stack.AllocateDataRegister();
                    support.Emit($"{temp} = call_banked({assign.MethodId}); /* {funcName} */");
                    support.Stack.Push(temp);
                }
            }
            else
            {
                support.EmitComment($"WARNING: method not assigned to bank: {funcName}");
            }
        }
        else
        {
            var reflectionMethod = support.TryResolveFrameworkMethod(support.Method.OwningClass, methodToken);

            if (reflectionMethod != null)
            {
                if (support.ObjectHandler.IsReflectionMethod(reflectionMethod))
                {
                    support.ObjectHandler.HandleReflectionMethodCall(reflectionMethod, support.Stack);
                }
                else
                {
                    support.EmitComment($"TODO: framework call {reflectionMethod.DeclaringType?.Name}::{reflectionMethod.Name}");

                    var paramCount = reflectionMethod is MethodInfo mi ? mi.GetParameters().Length : 0;
                    for (int i = 0; i < paramCount && support.Stack.StackDepth > 0; i++)
                        support.Stack.Pop();

                    if (reflectionMethod is MethodInfo info && info.ReturnType != typeof(void))
                    {
                        string temp = support.Stack.AllocateDataRegister();
                        support.Emit($"{temp} = 0; /* TODO: framework return */");
                        support.Stack.Push(temp);
                    }
                }
            }
            else
            {
                support.EmitComment($"WARNING: unresolved method token 0x{methodToken:X8}");
            }
        }
    }
}