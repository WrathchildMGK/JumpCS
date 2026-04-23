using System.Reflection;
using JumpCS.Backend.Interfaces;
using JumpCS.Core;

namespace JumpCS.Backend.Asm68000.Opcodes
{
    public class Ldsfld : IOpcodeTranslation
    {
        public void Translate(object? operand, IBackendSupport support)
        {
            if (operand is not int fieldToken)
            {
                support.AsmWriter.WriteLine($"    ; ERROR: Invalid operand for ldsfld");
                return;
            }

            string targetReg = support.Stack.AllocateDataRegister();

            try
            {
                // Attempt to resolve the field via reflection
                var module = support.Method.OwningClass.ReflectionType?.Module;
                if (module == null)
                {
                    support.AsmWriter.WriteLine($"    CLR.L {targetReg}  ; TODO: No module context for field token {fieldToken:X8}");
                    support.Stack.Push(targetReg);
                    return;
                }

                FieldInfo? fieldInfo = null;
                try
                {
                    fieldInfo = module.ResolveField(fieldToken);
                }
                catch
                {
                    // Field resolution failed
                }

                if (fieldInfo != null)
                {
                    string fieldLabel = $"STATIC_{fieldInfo.DeclaringType?.Name}_{fieldInfo.Name}";
                    
                    // Check if this is a system type field that needs special handling
                    if (fieldInfo.DeclaringType?.Name == "Decimal")
                    {
                        support.AsmWriter.WriteLine($"    ; Load Decimal static field: {fieldInfo.DeclaringType.Name}.{fieldInfo.Name}");
                        support.AsmWriter.WriteLine($"    LEA {fieldLabel},A0");
                        support.AsmWriter.WriteLine($"    MOVE.L (A0),{targetReg}");
                    }
                    else if (fieldInfo.DeclaringType?.Name == "Double")
                    {
                        support.AsmWriter.WriteLine($"    ; Load Double static field: {fieldInfo.DeclaringType.Name}.{fieldInfo.Name}");
                        support.AsmWriter.WriteLine($"    LEA {fieldLabel},A0");
                        support.AsmWriter.WriteLine($"    MOVE.L (A0),{targetReg}");
                    }
                    else if (fieldInfo.DeclaringType?.Name == "Math")
                    {
                        // Math constants like PI, E
                        support.AsmWriter.WriteLine($"    LEA {fieldLabel},A0");
                        support.AsmWriter.WriteLine($"    MOVE.L (A0),{targetReg}  ; Math constant: {fieldInfo.Name}");
                    }
                    else
                    {
                        // Generic static field load
                        support.AsmWriter.WriteLine($"    LEA {fieldLabel},A0");
                        support.AsmWriter.WriteLine($"    MOVE.L (A0),{targetReg}  ; Load static field {fieldInfo.DeclaringType?.Name}.{fieldInfo.Name}");
                    }
                }
                else
                {
                    support.AsmWriter.WriteLine($"    CLR.L {targetReg}  ; TODO: Unresolved static field token {fieldToken:X8}");
                }
            }
            catch (Exception ex)
            {
                support.AsmWriter.WriteLine($"    CLR.L {targetReg}  ; TODO: Exception resolving static field token {fieldToken:X8}: {ex.Message}");
            }

            support.Stack.Push(targetReg);
        }
    }
}