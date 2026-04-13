using JumpCS.Backend.Interfaces;
namespace JumpCS.Backend.Asm68000.Opcodes;
// BUILD ERROR: needs _method, _decimalHandler, TryResolveFrameworkMethod
public class Newobj : IOpcodeTranslation
{
    public void Translate(object? operand, IBackendSupport support)
    {
        if (operand is int methodToken)
        {
            var reflectionMethod = support.TryResolveFrameworkMethod(support.Method.OwningClass, methodToken);
            if (!support.DecimalHandler.TryHandleNewObj(reflectionMethod, support.Stack))
            {
                support.AsmWriter.WriteLine($"    ; TODO: newobj {methodToken:X8}");
            }
        }
    }
}