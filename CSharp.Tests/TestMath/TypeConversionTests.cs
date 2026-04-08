namespace TestMath.Tests
{
    /// <summary>
    /// Tests for type conversions between numeric types.
    /// Important for MSIL conv_* instructions.
    /// </summary>
    public class TypeConversionTests
    {
        [Fact]
        public void IntToFloat()
        {
            int i = 42;
            float f = (float)i;
            Assert.Equal(42.0f, f);
        }

        [Fact]
        public void IntToDouble()
        {
            int i = 42;
            double d = (double)i;
            Assert.Equal(42.0, d);
        }

        [Fact]
        public void IntToDecimal()
        {
            int i = 42;
            decimal d = (decimal)i;
            Assert.Equal(42m, d);
        }

        [Fact]
        public void FloatToInt()
        {
            float f = 42.7f;
            int i = (int)f;
            Assert.Equal(42, i);
        }

        [Fact]
        public void FloatToDouble()
        {
            float f = 42.5f;
            double d = (double)f;
            Assert.Equal(42.5, d, 5);
        }

        [Fact]
        public void FloatToDecimal()
        {
            float f = 42.5f;
            decimal d = (decimal)f;
            Assert.True(Math.Abs(d - 42.5m) < 0.01m);
        }

        [Fact]
        public void DoubleToInt()
        {
            double d = 42.7;
            int i = (int)d;
            Assert.Equal(42, i);
        }

        [Fact]
        public void DoubleToFloat()
        {
            double d = 42.5;
            float f = (float)d;
            Assert.Equal(42.5f, f, 5);
        }

        [Fact]
        public void DoubleToDecimal()
        {
            double d = 42.5;
            decimal dec = (decimal)d;
            Assert.Equal(42.5m, dec);
        }

        [Fact]
        public void DecimalToInt()
        {
            decimal d = 42.7m;
            int i = (int)d;
            Assert.Equal(42, i);
        }

        [Fact]
        public void DecimalToFloat()
        {
            decimal d = 42.5m;
            float f = (float)d;
            Assert.Equal(42.5f, f, 1);
        }

        [Fact]
        public void DecimalToDouble()
        {
            decimal d = 42.5m;
            double dbl = (double)d;
            Assert.Equal(42.5, dbl, 5);
        }

        [Fact]
        public void ByteToInt()
        {
            byte b = 42;
            int i = (int)b;
            Assert.Equal(42, i);
        }

        [Fact]
        public void IntToByte_WithOverflow()
        {
            int i = 300;
            byte b = (byte)i;
            Assert.Equal(44, b); // 300 mod 256 = 44
        }

        [Fact]
        public void ShortToInt()
        {
            short s = 1000;
            int i = (int)s;
            Assert.Equal(1000, i);
        }

        [Fact]
        public void LongToInt()
        {
            long l = 42;
            int i = (int)l;
            Assert.Equal(42, i);
        }

        [Fact]
        public void IntToLong()
        {
            int i = 42;
            long l = (long)i;
            Assert.Equal(42L, l);
        }

        [Fact]
        public void NegativeIntToUnsigned()
        {
            int i = -1;
            uint ui = (uint)i;
            Assert.Equal(uint.MaxValue, ui);
        }

        [Fact]
        public void ChainedConversions()
        {
            int i = 42;
            float f = (float)i;
            double d = (double)f;
            decimal dec = (decimal)d;
            Assert.Equal(42m, dec);
        }
    }
}