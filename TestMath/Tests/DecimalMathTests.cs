namespace JumpCS.TestMath.Tests
{
    /// <summary>
    /// Tests for decimal (128-bit) fixed-point arithmetic.
    /// Used for financial/precise calculations.
    /// </summary>
    public static class DecimalMathTests
    {
        public static void Addition_PositiveNumbers()
        {
            decimal a = 42.50m;
            decimal b = 58.30m;
            decimal result = a + b;
            bool success = Decimal.Equals(100.80m, result);
        }

        public static void Addition_NegativeNumbers()
        {
            decimal a = -42.50m;
            decimal b = -58.30m;
            decimal result = a + b;
            bool success = Decimal.Equals(-100.80m, result);
        }

        public static void Addition_MixedSigns()
        {
            decimal a = 100.50m;
            decimal b = -42.30m;
            decimal result = a + b;
            bool success = Decimal.Equals(58.20m, result);
        }

        public static void Subtraction_PositiveNumbers()
        {
            decimal a = 100.70m;
            decimal b = 42.30m;
            decimal result = a - b;
            bool success = Decimal.Equals(58.40m, result);
        }

        public static void Subtraction_NegativeResult()
        {
            decimal a = 42.30m;
            decimal b = 100.70m;
            decimal result = a - b;
            bool success = Decimal.Equals(-58.40m, result);
        }

        public static void Multiplication_PositiveNumbers()
        {
            decimal a = 12.50m;
            decimal b = 7.20m;
            decimal result = a * b;
            bool success = Decimal.Equals(90.00m, result);
        }

        public static void Multiplication_ByZero()
        {
            decimal a = 42.50m;
            decimal b = 0.00m;
            decimal result = a * b;
            bool success = Decimal.Equals(0.00m, result);
        }

        public static void Multiplication_NegativeNumbers()
        {
            decimal a = -12.50m;
            decimal b = -7.20m;
            decimal result = a * b;
            bool success = Decimal.Equals(90.00m, result);
        }

        public static void Division_PositiveNumbers()
        {
            decimal a = 84.00m;
            decimal b = 7.00m;
            decimal result = a / b;
            bool success = Decimal.Equals(12.00m, result);
        }

        public static void Division_WithPrecision()
        {
            decimal a = 85.00m;
            decimal b = 7.00m;
            decimal result = a / b;
            bool success = Decimal.Equals(12.142857142857142857142857143m, result);
        }

        public static void Division_NegativeNumbers()
        {
            decimal a = -84.00m;
            decimal b = -7.00m;
            decimal result = a / b;
            bool success = Decimal.Equals(12.00m, result);
        }

        public static void Division_MixedSigns()
        {
            decimal a = 84.00m;
            decimal b = -7.00m;
            decimal result = a / b;
            bool success = Decimal.Equals(-12.00m, result);
        }

        public static void Remainder_PositiveNumbers()
        {
            decimal a = 85.00m;
            decimal b = 7.00m;
            decimal result = a % b;
            bool success = Decimal.Equals(1.00m, result);
        }

        public static void Remainder_NegativeNumbers()
        {
            decimal a = -85.00m;
            decimal b = 7.00m;
            decimal result = a % b;
            bool success = Decimal.Equals(-1.00m, result);
        }

        public static void UnaryMinus()
        {
            decimal a = 42.50m;
            decimal result = -a;
            bool success = Decimal.Equals(-42.50m, result);
        }

        public static void UnaryPlus()
        {
            decimal a = -42.50m;
            decimal result = +a;
            bool success = Decimal.Equals(-42.50m, result);
        }

        public static void Comparison_LessThan()
        {
            decimal a = 42.50m;
            decimal b = 58.30m;
            bool success = (a < b);
        }

        public static void Comparison_GreaterThan()
        {
            decimal a = 58.30m;
            decimal b = 42.50m;
            bool success = (a > b);
        }

        public static void Comparison_Equal()
        {
            decimal a = 42.50m;
            decimal b = 42.50m;
            bool success = (a == b);
        }

        public static void Comparison_NotEqual()
        {
            decimal a = 42.50m;
            decimal b = 42.51m;
            bool success = (a != b);
        }

        public static void Abs()
        {
            decimal a = -42.50m;
            decimal result = Math.Abs(a);
            bool success = Decimal.Equals(42.50m, result);
        }

        public static void Round_ToNearestEven()
        {
            decimal a = 42.55m;
            decimal result = Math.Round(a, 1);
            bool success = Decimal.Equals(42.6m, result);
        }

        public static void Round_AwayFromZero()
        {
            decimal a = 42.55m;
            decimal result = Math.Round(a, 1, MidpointRounding.AwayFromZero);
            bool success = Decimal.Equals(42.6m, result);
        }

        public static void Truncate()
        {
            decimal a = 42.97m;
            decimal result = Math.Truncate(a);
            bool success = Decimal.Equals(42m, result);
        }

        public static void Floor()
        {
            decimal a = 42.97m;
            decimal result = Math.Floor(a);
            bool success = Decimal.Equals(42m, result);
        }

        public static void Ceiling()
        {
            decimal a = 42.01m;
            decimal result = Math.Ceiling(a);
            bool success = Decimal.Equals(43m, result);
        }

        public static void DivideByZeroThrows()
        {
            decimal a = 42.50m;
            decimal b = 0.00m;
            bool success = true;
            try
            {
                decimal result = a / b;
            }
            catch (DivideByZeroException)
            {
                success = false;
            }
        }

        public static void ChainedOperations()
        {
            decimal a = 10.50m;
            decimal b = 20.30m;
            decimal c = 3.00m;
            decimal result = (a + b) * c - 5.20m;
            bool success = Decimal.Equals(87.20m, result);
        }

        public static void FinancialCalculation_CompoundInterest()
        {
            // Principal: 1000, Rate: 5%, Time: 2 years
            decimal principal = 1000.00m;
            decimal rate = 0.05m;
            decimal time = 2.00m;

            // Simple interest: A = P(1 + rt)
            decimal amount = principal * (1 + rate * time);
            bool success = Decimal.Equals(1100.00m, amount);
        }

        public static void FinancialCalculation_PercentageIncrease()
        {
            decimal original = 200.00m;
            decimal percent = 15.00m;
            decimal increase = original * (percent / 100);
            decimal result = original + increase;

            bool success = Decimal.Equals(230.00m, result);
        }

        public static void ConversionFromFloat()
        {
            float f = 42.5f;
            decimal result = (decimal)f;
            bool success = (Math.Abs(result - 42.5m) < 0.01m);
        }

        public static void ConversionToFloat()
        {
            decimal d = 42.50m;
            float result = (float)d;
            bool success = Decimal.Equals(42.5f, Math.Round(result, 10));
        }
    }
}