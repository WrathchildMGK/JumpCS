namespace JumpCS.TestMath.Tests
{
    /// <summary>
    /// Tests for single-precision (32-bit) floating-point arithmetic.
    /// </summary>
    public static class FloatMathTests
    {
        private const float Tolerance = 0.00001f;

        public static void Addition_PositiveNumbers()
        {
            float a = 42.5f;
            float b = 58.3f;
            float result = a + b;
            bool success = float.Equals(100.8f, Math.Round(result, 2));
        }

        public static void Addition_NegativeNumbers()
        {
            float a = -42.5f;
            float b = -58.3f;
            float result = a + b;
            bool success = float.Equals(-100.8f, Math.Round(result, 2));
        }

        public static void Addition_MixedSigns()
        {
            float a = 100.5f;
            float b = -42.3f;
            float result = a + b;
            bool success = float.Equals(58.2f, Math.Round(result, 1));
        }

        public static void Subtraction_PositiveNumbers()
        {
            float a = 100.7f;
            float b = 42.3f;
            float result = a - b;
            bool success = float.Equals(58.4f, Math.Round(result, 1));
        }

        public static void Subtraction_NegativeResult()
        {
            float a = 42.3f;
            float b = 100.7f;
            float result = a - b;
            bool success = float.Equals(-58.4f, Math.Round(result, 1));
        }

        public static void Multiplication_PositiveNumbers()
        {
            float a = 12.5f;
            float b = 7.2f;
            float result = a * b;
            bool success = float.Equals(90.0f, Math.Round(result, 1));
        }

        public static void Multiplication_ByZero()
        {
            float a = 42.5f;
            float b = 0.0f;
            float result = a * b;
            bool success = float.Equals(0.0f, result);
        }

        public static void Multiplication_NegativeNumbers()
        {
            float a = -12.5f;
            float b = -7.2f;
            float result = a * b;
            bool success = float.Equals(90.0f, Math.Round(result, 1));
        }

        public static void Division_PositiveNumbers()
        {
            float a = 84.0f;
            float b = 7.0f;
            float result = a / b;
            bool success = float.Equals(12.0f, result);
        }

        public static void Division_NegativeNumbers()
        {
            float a = -84.0f;
            float b = -7.0f;
            float result = a / b;
            bool success = float.Equals(12.0f, result);
        }

        public static void Division_MixedSigns()
        {
            float a = 84.0f;
            float b = -7.0f;
            float result = a / b;
            bool success = float.Equals(-12.0f, result);
        }

        public static void Division_ByZeroPositive()
        {
            float a = 42.0f;
            float b = 0.0f;
            float result = a / b;
            bool success = (float.IsPositiveInfinity(result));
        }

        public static void Division_ByZeroNegative()
        {
            float a = -42.0f;
            float b = 0.0f;
            float result = a / b;
            bool success = (float.IsNegativeInfinity(result));
        }

        public static void Remainder_PositiveNumbers()
        {
            float a = 85.5f;
            float b = 7.0f;
            float result = a % b;
            bool success = (result >= 1.4f && result <= 1.6f);
        }

        public static void UnaryMinus()
        {
            float a = 42.5f;
            float result = -a;
            bool success = float.Equals(-42.5f, result);
        }

        public static void Comparison_LessThan()
        {
            float a = 42.5f;
            float b = 58.3f;
            bool success = (a < b);
        }

        public static void Comparison_GreaterThan()
        {
            float a = 58.3f;
            float b = 42.5f;
            bool success = (a > b);
        }

        public static void Comparison_Equal()
        {
            float a = 42.5f;
            float b = 42.5f;
            bool success = (a == b);
        }

        public static void SpecialValue_NaN()
        {
            float result = float.NaN;
            bool success = (float.IsNaN(result));
        }

        public static void SpecialValue_Infinity()
        {
            float result = float.PositiveInfinity;
            bool success = (float.IsInfinity(result));
        }

        public static void Sqrt()
        {
            float a = 144.0f;
            float result = (float)Math.Sqrt(a);
            bool success = float.Equals(12.0f, result);
        }

        public static void Abs()
        {
            float a = -42.5f;
            float result = Math.Abs(a);
            bool success = float.Equals(42.5f, result);
        }

        public static void ChainedOperations()
        {
            float a = 10.5f;
            float b = 20.3f;
            float c = 3.0f;
            float result = (a + b) * c - 5.2f;
            bool success = (result >= 87.19f && result <= 87.21f);
        }
    }
}