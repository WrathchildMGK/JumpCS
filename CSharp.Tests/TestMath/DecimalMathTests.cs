namespace CSharp.Tests.TestMath
{
    /// <summary>
    /// Tests for decimal (128-bit) fixed-point arithmetic.
    /// Used for financial/precise calculations.
    /// </summary>
    public class DecimalMathTests
    {
        [Fact]
        public void Addition_PositiveNumbers()
        {
            decimal a = 42.50m;
            decimal b = 58.30m;
            decimal result = a + b;
            Assert.Equal(100.80m, result);
        }

        [Fact]
        public void Addition_NegativeNumbers()
        {
            decimal a = -42.50m;
            decimal b = -58.30m;
            decimal result = a + b;
            Assert.Equal(-100.80m, result);
        }

        [Fact]
        public void Addition_MixedSigns()
        {
            decimal a = 100.50m;
            decimal b = -42.30m;
            decimal result = a + b;
            Assert.Equal(58.20m, result);
        }

        [Fact]
        public void Subtraction_PositiveNumbers()
        {
            decimal a = 100.70m;
            decimal b = 42.30m;
            decimal result = a - b;
            Assert.Equal(58.40m, result);
        }

        [Fact]
        public void Subtraction_NegativeResult()
        {
            decimal a = 42.30m;
            decimal b = 100.70m;
            decimal result = a - b;
            Assert.Equal(-58.40m, result);
        }

        [Fact]
        public void Multiplication_PositiveNumbers()
        {
            decimal a = 12.50m;
            decimal b = 7.20m;
            decimal result = a * b;
            Assert.Equal(90.00m, result);
        }

        [Fact]
        public void Multiplication_ByZero()
        {
            decimal a = 42.50m;
            decimal b = 0.00m;
            decimal result = a * b;
            Assert.Equal(0.00m, result);
        }

        [Fact]
        public void Multiplication_NegativeNumbers()
        {
            decimal a = -12.50m;
            decimal b = -7.20m;
            decimal result = a * b;
            Assert.Equal(90.00m, result);
        }

        [Fact]
        public void Division_PositiveNumbers()
        {
            decimal a = 84.00m;
            decimal b = 7.00m;
            decimal result = a / b;
            Assert.Equal(12.00m, result);
        }

        [Fact]
        public void Division_WithPrecision()
        {
            decimal a = 85.00m;
            decimal b = 7.00m;
            decimal result = a / b;
            Assert.Equal(12.142857142857142857142857143m, result);
        }

        [Fact]
        public void Division_NegativeNumbers()
        {
            decimal a = -84.00m;
            decimal b = -7.00m;
            decimal result = a / b;
            Assert.Equal(12.00m, result);
        }

        [Fact]
        public void Division_MixedSigns()
        {
            decimal a = 84.00m;
            decimal b = -7.00m;
            decimal result = a / b;
            Assert.Equal(-12.00m, result);
        }

        [Fact]
        public void Remainder_PositiveNumbers()
        {
            decimal a = 85.00m;
            decimal b = 7.00m;
            decimal result = a % b;
            Assert.Equal(1.00m, result);
        }

        [Fact]
        public void Remainder_NegativeNumbers()
        {
            decimal a = -85.00m;
            decimal b = 7.00m;
            decimal result = a % b;
            Assert.Equal(-1.00m, result);
        }

        [Fact]
        public void UnaryMinus()
        {
            decimal a = 42.50m;
            decimal result = -a;
            Assert.Equal(-42.50m, result);
        }

        [Fact]
        public void UnaryPlus()
        {
            decimal a = -42.50m;
            decimal result = +a;
            Assert.Equal(-42.50m, result);
        }

        [Fact]
        public void Comparison_LessThan()
        {
            decimal a = 42.50m;
            decimal b = 58.30m;
            Assert.True(a < b);
        }

        [Fact]
        public void Comparison_GreaterThan()
        {
            decimal a = 58.30m;
            decimal b = 42.50m;
            Assert.True(a > b);
        }

        [Fact]
        public void Comparison_Equal()
        {
            decimal a = 42.50m;
            decimal b = 42.50m;
            Assert.True(a == b);
        }

        [Fact]
        public void Comparison_NotEqual()
        {
            decimal a = 42.50m;
            decimal b = 42.51m;
            Assert.True(a != b);
        }

        [Fact]
        public void Abs()
        {
            decimal a = -42.50m;
            decimal result = Math.Abs(a);
            Assert.Equal(42.50m, result);
        }

        [Fact]
        public void Round_ToNearestEven()
        {
            decimal a = 42.55m;
            decimal result = Math.Round(a, 1);
            Assert.Equal(42.6m, result);
        }

        [Fact]
        public void Round_AwayFromZero()
        {
            decimal a = 42.55m;
            decimal result = Math.Round(a, 1, MidpointRounding.AwayFromZero);
            Assert.Equal(42.6m, result);
        }

        [Fact]
        public void Truncate()
        {
            decimal a = 42.97m;
            decimal result = Math.Truncate(a);
            Assert.Equal(42m, result);
        }

        [Fact]
        public void Floor()
        {
            decimal a = 42.97m;
            decimal result = Math.Floor(a);
            Assert.Equal(42m, result);
        }

        [Fact]
        public void Ceiling()
        {
            decimal a = 42.01m;
            decimal result = Math.Ceiling(a);
            Assert.Equal(43m, result);
        }

        [Fact]
        public void DivideByZeroThrows()
        {
            decimal a = 42.50m;
            decimal b = 0.00m;
            Assert.Throws<DivideByZeroException>(() => _ = a / b);
        }

        [Fact]
        public void ChainedOperations()
        {
            decimal a = 10.50m;
            decimal b = 20.30m;
            decimal c = 3.00m;
            decimal result = (a + b) * c - 5.20m;
            Assert.Equal(87.20m, result);
        }

        [Fact]
        public void FinancialCalculation_CompoundInterest()
        {
            // Principal: 1000, Rate: 5%, Time: 2 years
            decimal principal = 1000.00m;
            decimal rate = 0.05m;
            decimal time = 2.00m;

            // Simple interest: A = P(1 + rt)
            decimal amount = principal * (1 + rate * time);
            Assert.Equal(1100.00m, amount);
        }

        [Fact]
        public void FinancialCalculation_PercentageIncrease()
        {
            decimal original = 200.00m;
            decimal percent = 15.00m;
            decimal increase = original * (percent / 100);
            decimal result = original + increase;

            Assert.Equal(230.00m, result);
        }

        [Fact]
        public void ConversionFromFloat()
        {
            float f = 42.5f;
            decimal result = (decimal)f;
            Assert.True(Math.Abs(result - 42.5m) < 0.01m);
        }

        [Fact]
        public void ConversionToFloat()
        {
            decimal d = 42.50m;
            float result = (float)d;
            Assert.Equal(42.5f, result, 1);
        }
    }
}