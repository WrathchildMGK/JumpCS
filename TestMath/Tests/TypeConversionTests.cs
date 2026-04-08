namespace JumpCS.TestMath.Tests
{
    /// <summary>
    /// Tests for type conversions between numeric types.
    /// Important for MSIL conv_* instructions.
    /// </summary>
    public static class TypeConversionTests
    {
        public static void IntToFloat()
        {
            int i = 42;
            float f = (float)i;
            bool success = float.Equals(42.0f, f);
        }

        public static void IntToDouble()
        {
            int i = 42;
            double d = (double)i;
            bool success = double.Equals(42.0, d);
        }

        public static void IntToDecimal()
        {
            int i = 42;
            decimal d = (decimal)i;
            bool success = decimal.Equals(42m, d);
        }

        public static void FloatToInt()
        {
            float f = 42.7f;
            int i = (int)f;
            bool success = int.Equals(42, i);
        }

        public static void FloatToDouble()
        {
            float f = 42.5f;
            double d = (double)f;
            bool success = double.Equals(42.5, Math.Round(d, 5));
        }

        public static void FloatToDecimal()
        {
            float f = 42.5f;
            decimal d = (decimal)f;
            bool success = (Math.Abs(d - 42.5m) < 0.01m);
        }

        public static void DoubleToInt()
        {
            double d = 42.7;
            int i = (int)d;
            bool success = int.Equals(42, i);
        }

        public static void DoubleToFloat()
        {
            double d = 42.5;
            float f = (float)d;
            bool success = float.Equals(42.5f, Math.Round(f, 5));
        }

        public static void DoubleToDecimal()
        {
            double d = 42.5;
            decimal dec = (decimal)d;
            bool success = decimal.Equals(42.5m, dec);
        }

        public static void DecimalToInt()
        {
            decimal d = 42.7m;
            int i = (int)d;
            bool success = int.Equals(42, i);
        }

        public static void DecimalToFloat()
        {
            decimal d = 42.5m;
            float f = (float)d;
            bool success = float.Equals(42.5f, Math.Round(f, 1));
        }

        public static void DecimalToDouble()
        {
            decimal d = 42.5m;
            double dbl = (double)d;
            bool success = double.Equals(42.5, Math.Round(dbl, 5));
        }

        public static void ByteToInt()
        {
            byte b = 42;
            int i = (int)b;
            bool success = int.Equals(42, i);
        }

        public static void IntToByte_WithOverflow()
        {
            int i = 300;
            byte b = (byte)i;
            bool success = byte.Equals(44, b); // 300 mod 256 = 44
        }

        public static void ShortToInt()
        {
            short s = 1000;
            int i = (int)s;
            bool success = int.Equals(1000, i);
        }

        public static void LongToInt()
        {
            long l = 42;
            int i = (int)l;
            bool success = int.Equals(42, i);
        }

        public static void IntToLong()
        {
            int i = 42;
            long l = (long)i;
            bool success = long.Equals(42L, l);
        }

        public static void NegativeIntToUnsigned()
        {
            int i = -1;
            uint ui = (uint)i;
            bool success = uint.Equals(uint.MaxValue, ui);
        }

        public static void ChainedConversions()
        {
            int i = 42;
            float f = (float)i;
            double d = (double)f;
            decimal dec = (decimal)d;
            bool success = decimal.Equals(42m, dec);
        }
    }
}