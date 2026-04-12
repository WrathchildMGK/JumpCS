using JumpCS.Backend;
namespace CSharp.Backend.Asm68000Opcodes;
// BUILD ERROR: needs _method, _decimalHandler, TryResolveFrameworkMethod
public class Newobj : IOpcodeTranslation
{
    public void Translate(object? operand, Asm68000Support support)
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