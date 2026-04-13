using JumpCS.Core;

namespace JumpCS.Backend.CC65;

/// <summary>XEGS cartridge size model</summary>
public static class CC65CartModel
{
    /// <summary>Total banks for the given memory model</summary>
    public static int TotalBanks(MemoryModel model) => model switch
    {
        MemoryModel.Small => 4,   // 32KB
        MemoryModel.Large => 8,   // 64KB
        MemoryModel.Huge => 16,   // 128KB
        _ => 16
    };

    /// <summary>Switchable banks (total minus the fixed bank)</summary>
    public static int SwitchableBanks(MemoryModel model) => TotalBanks(model) - 1;

    public static int TotalSizeKB(MemoryModel model) => TotalBanks(model) * 8;

    public static string ModelName(MemoryModel model) => model switch
    {
        MemoryModel.Small => "SMALL (32KB)",
        MemoryModel.Large => "LARGE (64KB)",
        MemoryModel.Huge => "HUGE (128KB)",
        _ => "UNKNOWN"
    };
}