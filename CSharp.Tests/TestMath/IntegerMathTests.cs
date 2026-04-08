using System.Numerics;

namespace CSharp.Tests.TestMath
{
    /// <summary>
    /// Tests for integer (32-bit) arithmetic operations.
    /// These serve as reference implementations for the MSIL-to-68000 compiler.
    /// </summary>
    public class IntegerMathTests
    {
        [Fact]
        public void Addition_PositiveNumbers()
        {
            int a = 42;
            int b = 58;
            int result = a + b;
            Assert.Equal(100, result);
        }

        [Fact]
        public void Addition_NegativeNumbers()
        {
            int a = -42;
            int b = -58;
            int result = a + b;
            Assert.Equal(-100, result);
        }

        [Fact]
        public void Addition_MixedSigns()
        {
            int a = 100;
            int b = -42;
            int result = a + b;
            Assert.Equal(58, result);
        }

        [Fact]
        public void Addition_Overflow()
        {
            int a = int.MaxValue;
            int b = 1;
            int result = unchecked(a + b);
            Assert.Equal(int.MinValue, result);
        }

        [Fact]
        public void Subtraction_PositiveNumbers()
        {
            int a = 100;
            int b = 42;
            int result = a - b;
            Assert.Equal(58, result);
        }

        [Fact]
        public void Subtraction_NegativeResult()
        {
            int a = 42;
            int b = 100;
            int result = a - b;
            Assert.Equal(-58, result);
        }

        [Fact]
        public void Subtraction_NegativeNumbers()
        {
            int a = -42;
            int b = -100;
            int result = a - b;
            Assert.Equal(58, result);
        }

        [Fact]
        public void Multiplication_PositiveNumbers()
        {
            int a = 12;
            int b = 7;
            int result = a * b;
            Assert.Equal(84, result);
        }

        [Fact]
        public void Multiplication_ByZero()
        {
            int a = 42;
            int b = 0;
            int result = a * b;
            Assert.Equal(0, result);
        }

        [Fact]
        public void Multiplication_NegativeNumbers()
        {
            int a = -12;
            int b = -7;
            int result = a * b;
            Assert.Equal(84, result);
        }

        [Fact]
        public void Multiplication_MixedSigns()
        {
            int a = 12;
            int b = -7;
            int result = a * b;
            Assert.Equal(-84, result);
        }

        [Fact]
        public void Division_PositiveNumbers()
        {
            int a = 84;
            int b = 7;
            int result = a / b;
            Assert.Equal(12, result);
        }

        [Fact]
        public void Division_WithRemainder()
        {
            int a = 85;
            int b = 7;
            int result = a / b;
            Assert.Equal(12, result);
        }

        [Fact]
        public void Division_NegativeNumbers()
        {
            int a = -84;
            int b = -7;
            int result = a / b;
            Assert.Equal(12, result);
        }

        [Fact]
        public void Division_MixedSigns()
        {
            int a = 84;
            int b = -7;
            int result = a / b;
            Assert.Equal(-12, result);
        }

        [Fact]
        public void Remainder_PositiveNumbers()
        {
            int a = 85;
            int b = 7;
            int result = a % b;
            Assert.Equal(1, result);
        }

        [Fact]
        public void Remainder_NegativeNumbers()
        {
            int a = -85;
            int b = 7;
            int result = a % b;
            Assert.Equal(-1, result);
        }

        [Fact]
        public void BitwiseAnd()
        {
            int a = 0b1010_1100;
            int b = 0b1100_0011;
            int result = a & b;
            Assert.Equal(0b1000_0000, result);
        }

        [Fact]
        public void BitwiseOr()
        {
            int a = 0b1010_1100;
            int b = 0b1100_0011;
            int result = a | b;
            Assert.Equal(0b1110_1111, result);
        }

        [Fact]
        public void BitwiseXor()
        {
            int a = 0b1010_1100;
            int b = 0b1100_0011;
            int result = a ^ b;
            Assert.Equal(0b0110_1111, result);
        }

        [Fact]
        public void LeftShift()
        {
            int a = 0b0000_0001;
            int result = a << 4;
            Assert.Equal(0b0001_0000, result);
        }

        [Fact]
        public void RightShift()
        {
            int a = 0b0001_0000;
            int result = a >> 4;
            Assert.Equal(0b0000_0001, result);
        }

        [Fact]
        public void UnaryMinus()
        {
            int a = 42;
            int result = -a;
            Assert.Equal(-42, result);
        }

        [Fact]
        public void ChainedOperations()
        {
            int a = 10;
            int b = 20;
            int c = 3;
            int result = (a + b) * c - 5;
            Assert.Equal(85, result);
        }

        [Fact]
        public void DivideByZeroThrows()
        {
            int a = 42;
            int b = 0;
            Assert.Throws<DivideByZeroException>(() => _ = a / b);
        }

        [Fact]
        public void ModuloByZeroThrows()
        {
            int a = 42;
            int b = 0;
            Assert.Throws<DivideByZeroException>(() => _ = a % b);
        }
    }
}