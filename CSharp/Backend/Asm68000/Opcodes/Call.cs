using System.Reflection;
using JumpCS;
using JumpCS.Backend.Interfaces;
using JumpCS.Core;
namespace JumpCS.Backend.Asm68000.Opcodes;
// BUILD ERROR: needs _method, _decimalHandler, _mathHandler, _doubleHandler, _floatHandler, _integerHandler, ResolveMethodToken, TryResolveFrameworkMethod
public class Call : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is int methodToken)
        {
            var targetMethod = support.ResolveMethodToken(support.Method.OwningClass, methodToken);
            if (targetMethod != null)
            {
                if (support.DecimalHandler.TryHandleMethod(targetMethod, support.Stack)) { }
                else
                {
                    string methodLabel = targetMethod.OwningClass.GetMethodLabel(targetMethod);
                    support.AsmWriter.WriteLine($"    ; Call {targetMethod.OwningClass.FullName}.{targetMethod.Name}{targetMethod.Signature}");
                    support.AsmWriter.WriteLine($"    JSR {methodLabel}");
                    if (targetMethod.Signature != "()V" && !targetMethod.Signature.EndsWith(")V"))
                    {
                        support.Stack.Push("D0");
                        if (Program.CodeOptions?.Verbosity > 1)
                            support.AsmWriter.WriteLine($"    ; Return value pushed (non-void method)");
                    }
                }
            }
            else
            {
                var reflectionMethod = support.TryResolveFrameworkMethod(support.Method.OwningClass, methodToken);
                if (reflectionMethod != null)
                {
                    if (support.DecimalHandler.TryHandleReflectionMethod(reflectionMethod, support.Stack)) { }
                    else if (support.MathHandler.TryHandleReflectionMethod(reflectionMethod, support.Stack)) { }
                    else if (support.DoubleHandler.TryHandleReflectionMethod(reflectionMethod, support.Stack)) { }
                    else if (support.FloatHandler.TryHandleReflectionMethod(reflectionMethod, support.Stack)) { }
                    else if (support.IntegerHandler.TryHandleReflectionMethod(reflectionMethod, support.Stack)) { }
                    else
                    {
                        support.AsmWriter.WriteLine($"    ; Framework method: {reflectionMethod.DeclaringType?.FullName}::{reflectionMethod.Name}");
                        support.AsmWriter.WriteLine($"    ; TODO: Implement framework call");
                        var paramCount = reflectionMethod is MethodInfo mi ? mi.GetParameters().Length : 0;
                        for (int i = 0; i < paramCount; i++) { try { support.Stack.Pop(); } catch { } }
                        if (reflectionMethod is MethodInfo methodInfo && methodInfo.ReturnType != typeof(void))
                        {
                            string resultReg = support.Stack.AllocateDataRegister();
                            support.Stack.Push(resultReg);
                        }
                    }
                }
                else
                {
                    support.AsmWriter.WriteLine($"    ; WARNING: Unresolved method token {methodToken:X8}");
                    support.AsmWriter.WriteLine($"    ; JSR UNKNOWN_METHOD_{methodToken:X8}  ; UNRESOLVED");
                }
            }
        }
    }
}