using JumpCS.Backend.Asm68000;
using JumpCS.Backend.Base;
using JumpCS.Backend.CC65.SystemTypes;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;
using System.Collections;
using System.Reflection;

namespace JumpCS.Backend.CC65;

/// <summary>Shared context for CC65 opcode translation</summary>
public class CC65Support : SupportBase
{
    private readonly CC65MethodBank _methodBank;

    public CC65Support(
        MsilIterator iterator,
        MethodMetadata method,
        CC65StackSimulator stack,
        CC65LabelMapper labels,
        StreamWriter writer,
        CC65MethodBank methodBank,
        Func<ClassMetadata, int, MethodMetadata?> resolveMethodToken,
        Func<ClassMetadata, int, MethodBase?> tryResolveFrameworkMethod) :
        base(iterator, method, stack, labels, writer, resolveMethodToken, tryResolveFrameworkMethod)
    {
        _methodBank = methodBank;
    }

    // --- Public accessors (consistent naming with Asm68000Support) ---

    public CC65MethodBank MethodBank => _methodBank;

    public override ISystemObjectHandler ObjectHandler => new SystemObjectHandler(
            AsmWriter,
            (stack) => stack.AllocateDataRegister(),
            () => GetUniqueLabel()
        );

    // --- Label generation ---

    public string GetUniqueLabel() => Labels.GetUniqueLabel();

    // --- Code emission helpers ---

    public override void Emit(string line) => AsmWriter.WriteLine($"    {line}");

    public override void EmitComment(string comment) => Emit($"/* {comment} */");

    public override void EmitLabel(string label) => AsmWriter.WriteLine($"  {label}:");

    public override void EmitBlank() => AsmWriter.WriteLine();

    /// <summary>Emit: type temp = expr; and push temp onto eval stack</summary>
    public override string EmitAssign(string expr, bool isWide = false)
    {
        string temp = Stack.AllocateDataRegister();
        Emit($"{CC65TypeMapper.StackType} {temp} = ({CC65TypeMapper.StackType})({expr});");
        Stack.Push(temp, isWide);
        return temp;
    }

    /// <summary>Emit: temp = expr; reusing an existing variable, push onto stack</summary>
    public override void EmitReassign(string varName, string expr)
    {
        Emit($"{varName} = ({CC65TypeMapper.StackType})({expr});");
    }
}