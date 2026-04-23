using System.Reflection;
using JumpCS.Backend.Interfaces;
using JumpCS.Core;

namespace JumpCS.Backend.Asm68000.Opcodes
{
    public class Newobj : IOpcodeTranslation
    {
        public void Translate(object? operand, IBackendSupport support)
        {
            if (operand is not int methodToken)
            {
                support.AsmWriter.WriteLine($"    ; ERROR: Invalid operand for newobj");
                return;
            }

            // Get the calling class from the current method
            var callingClass = support.Method.OwningClass;

            // Try to resolve the constructor
            var reflectionMethod = support.TryResolveFrameworkMethod(callingClass, methodToken);
            
            if (reflectionMethod?.DeclaringType != null)
            {
                string typeName = reflectionMethod.DeclaringType.Name;

                // Delegate to appropriate system handler based on type
                if (typeName == "Decimal")
                {
                    if (!support.DecimalHandler.TryHandleNewObj(reflectionMethod, support.Stack))
                    {
                        support.AsmWriter.WriteLine($"    ; TODO: Decimal newobj with specific parameters");
                        support.Stack.AllocateDataRegister(); // Allocate result
                    }
                }
                else if (typeName == "Double")
                {
                    support.AsmWriter.WriteLine($"    ; Double newobj - allocate space");
                    string resultReg = support.Stack.AllocateDataRegister();
                    support.AsmWriter.WriteLine($"    MOVE.L #0,{resultReg}  ; TODO: Initialize Double");
                    support.Stack.Push(resultReg);
                }
                else if (typeName == "Single")
                {
                    support.AsmWriter.WriteLine($"    ; Single (float) newobj - allocate space");
                    string resultReg = support.Stack.AllocateDataRegister();
                    support.AsmWriter.WriteLine($"    MOVE.L #0,{resultReg}  ; TODO: Initialize Single");
                    support.Stack.Push(resultReg);
                }
                else if (typeName == "Int32" || typeName == "Int64")
                {
                    support.AsmWriter.WriteLine($"    ; {typeName} newobj - allocate space");
                    string resultReg = support.Stack.AllocateDataRegister();
                    support.AsmWriter.WriteLine($"    MOVE.L #0,{resultReg}  ; TODO: Initialize {typeName}");
                    support.Stack.Push(resultReg);
                }
                else
                {
                    support.AsmWriter.WriteLine($"    ; TODO: newobj {reflectionMethod.DeclaringType.FullName}::{reflectionMethod.Name}");
                    string resultReg = support.Stack.AllocateDataRegister();
                    support.Stack.Push(resultReg);
                }
                return;
            }

            // Unknown constructor - generic stub
            support.AsmWriter.WriteLine($"    ; TODO: newobj {methodToken:X8} (unknown type/constructor)");
            string reg = support.Stack.AllocateDataRegister();
            support.Stack.Push(reg); // Allocate result register
        }
    }
}