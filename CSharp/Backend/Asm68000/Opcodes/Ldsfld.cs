using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
// BUILD ERROR: needs _method — will be resolved later
public class Ldsfld : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is int fieldToken)
        {
            string targetReg = support.Stack.AllocateDataRegister();
            try
            {
                var fieldInfo = support.Method.OwningClass.ReflectionType?.Module?.ResolveField(fieldToken);
                if (fieldInfo != null)
                {
                    string fieldLabel = $"STATIC_{fieldInfo.DeclaringType?.Name}_{fieldInfo.Name}";
                    support.AsmWriter.WriteLine($"    MOVE.L {fieldLabel},{targetReg}  ; Load static field {fieldInfo.DeclaringType?.Name}.{fieldInfo.Name}");
                }
                else { support.AsmWriter.WriteLine($"    CLR.L {targetReg}  ; TODO: Unresolved static field token {fieldToken:X8}"); }
            }
            catch { support.AsmWriter.WriteLine($"    CLR.L {targetReg}  ; TODO: Could not resolve static field token {fieldToken:X8}"); }
            support.Stack.Push(targetReg);
        }
    }
}