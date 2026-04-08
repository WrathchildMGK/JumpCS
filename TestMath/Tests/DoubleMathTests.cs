namespace JumpCS.TestMath.Tests
{
    /// <summary>
    /// Tests for double-precision (64-bit) floating-point arithmetic.
    /// </summary>
    public static class DoubleMathTests
    {
        private const double Tolerance = 0.00001;

        public static void Addition_PositiveNumbers()
        {
            double a = 42.5;
            double b = 58.3;
            double result = a + b;
            bool success = Double.Equals(100.8, Math.Round(result, 2));
        }

        public static void Addition_NegativeNumbers()
        {
            double a = -42.5;
            double b = -58.3;
            double result = a + b;
            bool success = Double.Equals(-100.8, Math.Round(result, 2));
        }

        public static void Addition_MixedSigns()
        {
            double a = 100.5;
            double b = -42.3;
            double result = a + b;
            bool success = Double.Equals(58.2, Math.Round(result, 1));
        }

        public static void Subtraction_PositiveNumbers()
        {
            double a = 100.7;
            double b = 42.3;
            double result = a - b;
            bool success = Double.Equals(58.4, Math.Round(result, 1));
        }

        public static void Subtraction_NegativeResult()
        {
            double a = 42.3;
            double b = 100.7;
            double result = a - b;
            bool success = Double.Equals(-58.4, Math.Round(result, 1));
        }

        public static void Multiplication_PositiveNumbers()
        {
            double a = 12.5;
            double b = 7.2;
            double result = a * b;
            bool success = Double.Equals(90.0, Math.Round(result, 1));
        }

        public static void Multiplication_ByZero()
        {
            double a = 42.5;
            double b = 0.0;
            double result = a * b;
            bool success = Double.Equals(0.0, result);
        }

        public static void Multiplication_NegativeNumbers()
        {
            double a = -12.5;
            double b = -7.2;
            double result = a * b;
            bool success = Double.Equals(90.0, Math.Round(result, 1));
        }

        public static void Division_PositiveNumbers()
        {
            double a = 84.0;
            double b = 7.0;
            double result = a / b;
            bool success = Double.Equals(12.0, result);
        }

        public static void Division_NegativeNumbers()
        {
            double a = -84.0;
            double b = -7.0;
            double result = a / b;
            bool success = Double.Equals(12.0, result);
        }

        public static void Division_MixedSigns()
        {
            double a = 84.0;
            double b = -7.0;
            double result = a / b;
            bool success = Double.Equals(-12.0, result);
        }

        public static void Division_ByZeroPositive()
        {
            double a = 42.0;
            double b = 0.0;
            double result = a / b;
            bool success = (double.IsPositiveInfinity(result));
        }

        public static void Division_ByZeroNegative()
        {
            double a = -42.0;
            double b = 0.0;
            double result = a / b;
            bool success = (double.IsNegativeInfinity(result));
        }

        public static void Remainder_PositiveNumbers()
        {
            double a = 85.5;
            double b = 7.0;
            double result = a % b;
            bool success = (result >= 1.4 && result <= 1.6);
        }

        public static void UnaryMinus()
        {
            double a = 42.5;
            double result = -a;
            bool success = Double.Equals(-42.5, result);
        }

        public static void Comparison_LessThan()
        {
            double a = 42.5;
            double b = 58.3;
            bool success = (a < b);
        }

        public static void Comparison_GreaterThan()
        {
            double a = 58.3;
            double b = 42.5;
            bool success = (a > b);
        }

        public static void Comparison_Equal()
        {
            double a = 42.5;
            double b = 42.5;
            bool success = (a == b);
        }

        public static void SpecialValue_NaN()
        {
            double result = double.NaN;
            bool success = (double.IsNaN(result));
        }

        public static void SpecialValue_Infinity()
        {
            double result = double.PositiveInfinity;
            bool success = (double.IsInfinity(result));
        }

        public static void Sqrt()
        {
            double a = 144.0;
            double result = Math.Sqrt(a);
            bool success = Double.Equals(12.0, result);
        }

        public static void Abs()
        {
            double a = -42.5;
            double result = Math.Abs(a);
            bool success = Double.Equals(42.5, result);
        }

        public static void Pow()
        {
            double a = 2.0;
            double b = 8.0;
            double result = Math.Pow(a, b);
            bool success = Double.Equals(256.0, result);
        }

        public static void Log()
        {
            double a = Math.E;
            double result = Math.Log(a);
            bool success = Double.Equals(1.0, Math.Round(result, 10));
        }

        public static void Trigonometric_Sin()
        {
            double result = Math.Sin(Math.PI / 2);
            bool success = Double.Equals(1.0, Math.Round(result, 10));
        }

        public static void Trigonometric_Cos()
        {
            double result = Math.Cos(0.0);
            bool success = Double.Equals(1.0, Math.Round(result, 10));
        }

        public static void ChainedOperations()
        {
            double a = 10.5;
            double b = 20.3;
            double c = 3.0;
            double result = (a + b) * c - 5.2;
            bool success = (result >= 87.19 && result <= 87.21);
        }
    }
}