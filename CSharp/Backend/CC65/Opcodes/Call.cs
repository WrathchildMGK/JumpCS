using System.Reflection;
using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65.Opcodes;

/// <summary>call / callvirt — invoke a method</summary>
public class Call : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        var s = (CC65Support)support;
        if (operand is not int methodToken) return;

        var targetMethod = s.ResolveMethodToken(s.Method.OwningClass, methodToken);

        if (targetMethod != null)
        {
            string funcName = CC65BackEnd.GetCFunctionName(targetMethod.OwningClass, targetMethod);
            bool isVoid = targetMethod.Signature.EndsWith(")V");

            s.EmitComment($"call {targetMethod.OwningClass.FullName}.{targetMethod.Name}");

            string methodKey = CC65MethodBank.GetMethodKey(targetMethod.OwningClass, targetMethod);
            if (s.MethodBank.Assignments.TryGetValue(methodKey, out var assign))
            {
                if (isVoid)
                {
                    s.Emit($"call_banked({assign.MethodId}); /* {funcName} */");
                }
                else
                {
                    string temp = s.Stack.AllocateDataRegister();
                    s.Emit($"{CC65TypeMapper.StackType} {temp} = call_banked({assign.MethodId}); /* {funcName} */");
                    s.Stack.Push(temp);
                }
            }
            else
            {
                s.Emit($"/* WARNING: method not assigned to bank: {funcName} */");
            }
        }
        else
        {
            var reflectionMethod = s.TryResolveFrameworkMethod(s.Method.OwningClass, methodToken);

            if (reflectionMethod != null)
            {
                s.Emit($"/* TODO: framework call {reflectionMethod.DeclaringType?.Name}::{reflectionMethod.Name} */");

                var paramCount = reflectionMethod is MethodInfo mi ? mi.GetParameters().Length : 0;
                for (int i = 0; i < paramCount && s.Stack.StackDepth > 0; i++)
                    s.Stack.Pop();

                if (reflectionMethod is MethodInfo info && info.ReturnType != typeof(void))
                {
                    string temp = s.Stack.AllocateDataRegister();
                    s.Emit($"{CC65TypeMapper.StackType} {temp} = 0; /* TODO: framework return */");
                    s.Stack.Push(temp);
                }
            }
            else
            {
                s.Emit($"/* WARNING: unresolved method token 0x{methodToken:X8} */");
            }
        }
    }
}