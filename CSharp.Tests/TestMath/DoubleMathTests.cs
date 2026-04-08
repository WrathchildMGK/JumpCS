namespace CSharp.Tests.TestMath
{
    /// <summary>
    /// Tests for double-precision (64-bit) floating-point arithmetic.
    /// </summary>
    public class DoubleMathTests
    {
        private const double Tolerance = 0.00001;

        [Fact]
        public void Addition_PositiveNumbers()
        {
            double a = 42.5;
            double b = 58.3;
            double result = a + b;
            Assert.Equal(100.8, result, 2);
        }

        [Fact]
        public void Addition_NegativeNumbers()
        {
            double a = -42.5;
            double b = -58.3;
            double result = a + b;
            Assert.Equal(-100.8, result, 2);
        }

        [Fact]
        public void Addition_MixedSigns()
        {
            double a = 100.5;
            double b = -42.3;
            double result = a + b;
            Assert.Equal(58.2, result, 1);
        }

        [Fact]
        public void Subtraction_PositiveNumbers()
        {
            double a = 100.7;
            double b = 42.3;
            double result = a - b;
            Assert.Equal(58.4, result, 1);
        }

        [Fact]
        public void Subtraction_NegativeResult()
        {
            double a = 42.3;
            double b = 100.7;
            double result = a - b;
            Assert.Equal(-58.4, result, 1);
        }

        [Fact]
        public void Multiplication_PositiveNumbers()
        {
            double a = 12.5;
            double b = 7.2;
            double result = a * b;
            Assert.Equal(90.0, result, 1);
        }

        [Fact]
        public void Multiplication_ByZero()
        {
            double a = 42.5;
            double b = 0.0;
            double result = a * b;
            Assert.Equal(0.0, result);
        }

        [Fact]
        public void Multiplication_NegativeNumbers()
        {
            double a = -12.5;
            double b = -7.2;
            double result = a * b;
            Assert.Equal(90.0, result, 1);
        }

        [Fact]
        public void Division_PositiveNumbers()
        {
            double a = 84.0;
            double b = 7.0;
            double result = a / b;
            Assert.Equal(12.0, result);
        }

        [Fact]
        public void Division_NegativeNumbers()
        {
            double a = -84.0;
            double b = -7.0;
            double result = a / b;
            Assert.Equal(12.0, result);
        }

        [Fact]
        public void Division_MixedSigns()
        {
            double a = 84.0;
            double b = -7.0;
            double result = a / b;
            Assert.Equal(-12.0, result);
        }

        [Fact]
        public void Division_ByZeroPositive()
        {
            double a = 42.0;
            double b = 0.0;
            double result = a / b;
            Assert.True(double.IsPositiveInfinity(result));
        }

        [Fact]
        public void Division_ByZeroNegative()
        {
            double a = -42.0;
            double b = 0.0;
            double result = a / b;
            Assert.True(double.IsNegativeInfinity(result));
        }

        [Fact]
        public void Remainder_PositiveNumbers()
        {
            double a = 85.5;
            double b = 7.0;
            double result = a % b;
            Assert.InRange(result, 1.4, 1.6);
        }

        [Fact]
        public void UnaryMinus()
        {
            double a = 42.5;
            double result = -a;
            Assert.Equal(-42.5, result);
        }

        [Fact]
        public void Comparison_LessThan()
        {
            double a = 42.5;
            double b = 58.3;
            Assert.True(a < b);
        }

        [Fact]
        public void Comparison_GreaterThan()
        {
            double a = 58.3;
            double b = 42.5;
            Assert.True(a > b);
        }

        [Fact]
        public void Comparison_Equal()
        {
            double a = 42.5;
            double b = 42.5;
            Assert.True(a == b);
        }

        [Fact]
        public void SpecialValue_NaN()
        {
            double result = double.NaN;
            Assert.True(double.IsNaN(result));
        }

        [Fact]
        public void SpecialValue_Infinity()
        {
            double result = double.PositiveInfinity;
            Assert.True(double.IsInfinity(result));
        }

        [Fact]
        public void Sqrt()
        {
            double a = 144.0;
            double result = Math.Sqrt(a);
            Assert.Equal(12.0, result);
        }

        [Fact]
        public void Abs()
        {
            double a = -42.5;
            double result = Math.Abs(a);
            Assert.Equal(42.5, result);
        }

        [Fact]
        public void Pow()
        {
            double a = 2.0;
            double b = 8.0;
            double result = Math.Pow(a, b);
            Assert.Equal(256.0, result);
        }

        [Fact]
        public void Log()
        {
            double a = Math.E;
            double result = Math.Log(a);
            Assert.Equal(1.0, result, 10);
        }

        [Fact]
        public void Trigonometric_Sin()
        {
            double result = Math.Sin(Math.PI / 2);
            Assert.Equal(1.0, result, 10);
        }

        [Fact]
        public void Trigonometric_Cos()
        {
            double result = Math.Cos(0.0);
            Assert.Equal(1.0, result, 10);
        }

        [Fact]
        public void ChainedOperations()
        {
            double a = 10.5;
            double b = 20.3;
            double c = 3.0;
            double result = (a + b) * c - 5.2;
            Assert.InRange(result, 87.19, 87.21);
        }
    }
}