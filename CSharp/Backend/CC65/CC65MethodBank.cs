using JumpCS.Core;

namespace JumpCS.Backend.CC65;

/// <summary>Assigns methods to ROM banks for the XEGS cartridge</summary>
public class CC65MethodBank
{
    /*
     * Atari XEGS Memory Map:
     * $0000-$00FF  Zero Page (limited — cc65 runtime + a few app vars)
     * $0100-$01FF  6502 Hardware Stack
     * $0200-$1FFF  Atari reserved for Disk Operating System
     * $2000-$5FFF  Free RAM (globals, heap, software stack)
     * $6000-$7FFF  Atari reserved (display list, screen memory)
     * $8000-$9FFF  Switchable ROM bank (0–14, generated method code)
     * $A000-$BFFF  Fixed ROM bank (bank 15, kernel/dispatcher)
     * $C000-$FFFF  Atari OS and H/W chips
     * $D500        Bank select register
     */

    public const int BankSize = 0x2000;          // 8KB per bank
    public const int SwitchableStart = 0x8000;   // $8000
    public const int SwitchableEnd = 0x9FFF;     // $9FFF
    public const int FixedStart = 0xA000;        // $A000
    public const int FixedEnd = 0xBFFF;          // $BFFF
    public const int RamStart = 0x2000;          // $2000
    public const int RamEnd = 0x5FFF;            // $5FFF
    public const int RamSize = RamEnd - RamStart + 1; // 16KB
    public const int BankSelectRegister = 0xD500;

    private readonly MemoryModel _model;
    private readonly Dictionary<string, BankAssignment> _assignments = new();
    private int _currentBank = 0;
    private int _currentOffset = 0;

    public CC65MethodBank(MemoryModel model)
    {
        _model = model;
    }

    public IReadOnlyDictionary<string, BankAssignment> Assignments => _assignments;
    public int BanksUsed => _assignments.Count > 0 ? _currentBank + 1 : 0;

    /// <summary>Assign a method to a bank, advancing to next bank if full</summary>
    public BankAssignment AssignMethod(ClassMetadata cls, MethodMetadata method, int estimatedSize)
    {
        int maxSwitchable = CC65CartModel.SwitchableBanks(_model);

        if (_currentOffset + estimatedSize > BankSize)
        {
            _currentBank++;
            _currentOffset = 0;
        }

        if (_currentBank >= maxSwitchable)
        {
            throw new InvalidOperationException(
                $"Method {cls.FullName}.{method.Name} exceeds {CC65CartModel.ModelName(_model)} cartridge capacity " +
                $"({maxSwitchable} switchable banks × {BankSize / 1024}KB). " +
                $"Consider using a larger memory model (-m or -h).");
        }

        string key = GetMethodKey(cls, method);
        int methodId = _assignments.Count;
        var assignment = new BankAssignment(methodId, _currentBank, _currentOffset, estimatedSize);
        _assignments[key] = assignment;
        _currentOffset += estimatedSize;

        return assignment;
    }

    /// <summary>Estimate compiled code size for a method (rough heuristic)</summary>
    public static int EstimateMethodSize(MethodMetadata method)
    {
        // Each MSIL instruction generates ~6-10 bytes of 6502 code on average
        // 32-bit operations are especially expensive on 6502
        int codeSize = (method.Code?.Length ?? 0) * 8;
        return Math.Max(codeSize, 32); // minimum 32 bytes per method
    }

    public static string GetMethodKey(ClassMetadata cls, MethodMetadata method)
        => $"{cls.FullName}.{method.Name}{method.Signature}";
}

public record BankAssignment(int MethodId, int Bank, int OffsetInBank, int EstimatedSize);