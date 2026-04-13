namespace JumpCS.Backend.CC65;

/// <summary>Maps .NET/MSIL types to cc65 C types for the 6502</summary>
public static class CC65TypeMapper
{
    /*
     * cc65 type sizes (6502):
     *   char          = 8 bits
     *   int           = 16 bits
     *   long          = 32 bits
     *   unsigned long = 32 bits
     *
     * MSIL evaluation stack always widens to int32 minimum.
     * We use int32_t (cc65 long) for eval stack slots for correctness.
     * Local variables use the narrowest type that matches the C# declaration.
     */

    /// <summary>C type for eval stack slots (MSIL always widens to int32)</summary>
    public const string StackType = "int32_t";

    /// <summary>Map a .NET type name to a cc65 C type</summary>
    public static string ToCType(string dotNetTypeName) => dotNetTypeName switch
    {
        "Void" => "void",
        "Boolean" => "uint8_t",
        "SByte" => "int8_t",
        "Byte" => "uint8_t",
        "Int16" => "int16_t",
        "UInt16" => "uint16_t",
        "Int32" => "int32_t",
        "UInt32" => "uint32_t",
        "Char" => "uint8_t",    // Atari ATASCII is 8-bit
        _ => "int32_t"          // fallback for unsupported types
    };

    /// <summary>Map a method signature return type character to a C type</summary>
    public static string ReturnTypeFromSignature(string signature) =>
        signature.EndsWith(")V") ? "void" : StackType;

    /// <summary>Is this a type we currently support?</summary>
    public static bool IsSupported(string dotNetTypeName) => dotNetTypeName switch
    {
        "Void" or "Boolean" or "SByte" or "Byte" or
        "Int16" or "UInt16" or "Int32" or "UInt32" or "Char" => true,
        _ => false
    };

    /// <summary>Size in bytes of the C type on 6502</summary>
    public static int SizeOf(string dotNetTypeName) => dotNetTypeName switch
    {
        "Boolean" or "SByte" or "Byte" or "Char" => 1,
        "Int16" or "UInt16" => 2,
        "Int32" or "UInt32" => 4,
        _ => 4
    };
}