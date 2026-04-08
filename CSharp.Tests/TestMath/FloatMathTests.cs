namespace CSharp.Tests.TestMath
{
    /// <summary>
    /// Tests for single-precision (32-bit) floating-point arithmetic.
    /// </summary>
    public class FloatMathTests
    {
        private const float Tolerance = 0.00001f;

        [Fact]
        public void Addition_PositiveNumbers()
        {
            float a = 42.5f;
            float b = 58.3f;
            float result = a + b;
            Assert.Equal(100.8f, result, 2);
        }

        [Fact]
        public void Addition_NegativeNumbers()
        {
            float a = -42.5f;
            float b = -58.3f;
            float result = a + b;
            Assert.Equal(-100.8f, result, 2);
        }

        [Fact]
        public void Addition_MixedSigns()
        {
            float a = 100.5f;
            float b = -42.3f;
            float result = a + b;
            Assert.Equal(58.2f, result, 1);
        }

        [Fact]
        public void Subtraction_PositiveNumbers()
        {
            float a = 100.7f;
            float b = 42.3f;
            float result = a - b;
            Assert.Equal(58.4f, result, 1);
        }

        [Fact]
        public void Subtraction_NegativeResult()
        {
            float a = 42.3f;
            float b = 100.7f;
            float result = a - b;
            Assert.Equal(-58.4f, result, 1);
        }

        [Fact]
        public void Multiplication_PositiveNumbers()
        {
            float a = 12.5f;
            float b = 7.2f;
            float result = a * b;
            Assert.Equal(90.0f, result, 1);
        }

        [Fact]
        public void Multiplication_ByZero()
        {
            float a = 42.5f;
            float b = 0.0f;
            float result = a * b;
            Assert.Equal(0.0f, result);
        }

        [Fact]
        public void Multiplication_NegativeNumbers()
        {
            float a = -12.5f;
            float b = -7.2f;
            float result = a * b;
            Assert.Equal(90.0f, result, 1);
        }

        [Fact]
        public void Division_PositiveNumbers()
        {
            float a = 84.0f;
            float b = 7.0f;
            float result = a / b;
            Assert.Equal(12.0f, result);
        }

        [Fact]
        public void Division_NegativeNumbers()
        {
            float a = -84.0f;
            float b = -7.0f;
            float result = a / b;
            Assert.Equal(12.0f, result);
        }

        [Fact]
        public void Division_MixedSigns()
        {
            float a = 84.0f;
            float b = -7.0f;
            float result = a / b;
            Assert.Equal(-12.0f, result);
        }

        [Fact]
        public void Division_ByZeroPositive()
        {
            float a = 42.0f;
            float b = 0.0f;
            float result = a / b;
            Assert.True(float.IsPositiveInfinity(result));
        }

        [Fact]
        public void Division_ByZeroNegative()
        {
            float a = -42.0f;
            float b = 0.0f;
            float result = a / b;
            Assert.True(float.IsNegativeInfinity(result));
        }

        [Fact]
        public void Remainder_PositiveNumbers()
        {
            float a = 85.5f;
            float b = 7.0f;
            float result = a % b;
            Assert.InRange(result, 1.4f, 1.6f);
        }

        [Fact]
        public void UnaryMinus()
        {
            float a = 42.5f;
            float result = -a;
            Assert.Equal(-42.5f, result);
        }

        [Fact]
        public void Comparison_LessThan()
        {
            float a = 42.5f;
            float b = 58.3f;
            Assert.True(a < b);
        }

        [Fact]
        public void Comparison_GreaterThan()
        {
            float a = 58.3f;
            float b = 42.5f;
            Assert.True(a > b);
        }

        [Fact]
        public void Comparison_Equal()
        {
            float a = 42.5f;
            float b = 42.5f;
            Assert.True(a == b);
        }

        [Fact]
        public void SpecialValue_NaN()
        {
            float result = float.NaN;
            Assert.True(float.IsNaN(result));
        }

        [Fact]
        public void SpecialValue_Infinity()
        {
            float result = float.PositiveInfinity;
            Assert.True(float.IsInfinity(result));
        }

        [Fact]
        public void Sqrt()
        {
            float a = 144.0f;
            float result = (float)Math.Sqrt(a);
            Assert.Equal(12.0f, result);
        }

        [Fact]
        public void Abs()
        {
            float a = -42.5f;
            float result = Math.Abs(a);
            Assert.Equal(42.5f, result);
        }

        [Fact]
        public void ChainedOperations()
        {
            float a = 10.5f;
            float b = 20.3f;
            float c = 3.0f;
            float result = (a + b) * c - 5.2f;
            Assert.InRange(result, 87.19f, 87.21f);
        }
    }
}