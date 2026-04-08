using System.Numerics;

namespace JumpCS.TestMath.Tests
{
    /// <summary>
    /// Tests for integer (32-bit) arithmetic operations.
    /// These serve as reference implementations for the MSIL-to-68000 compiler.
    /// </summary>
    public static class IntegerMathTests
    {
        public static void Addition_PositiveNumbers()
        {
            int a = 42;
            int b = 58;
            int result = a + b;
            bool success = int.Equals(100, result);
        }

        public static void Addition_NegativeNumbers()
        {
            int a = -42;
            int b = -58;
            int result = a + b;
            bool success = int.Equals(-100, result);
        }

        public static void Addition_MixedSigns()
        {
            int a = 100;
            int b = -42;
            int result = a + b;
            bool success = int.Equals(58, result);
        }

        public static void Addition_Overflow()
        {
            int a = int.MaxValue;
            int b = 1;
            int result = unchecked(a + b);
            bool success = int.Equals(int.MinValue, result);
        }

        public static void Subtraction_PositiveNumbers()
        {
            int a = 100;
            int b = 42;
            int result = a - b;
            bool success = int.Equals(58, result);
        }

        public static void Subtraction_NegativeResult()
        {
            int a = 42;
            int b = 100;
            int result = a - b;
            bool success = int.Equals(-58, result);
        }

        public static void Subtraction_NegativeNumbers()
        {
            int a = -42;
            int b = -100;
            int result = a - b;
            bool success = int.Equals(58, result);
        }

        public static void Multiplication_PositiveNumbers()
        {
            int a = 12;
            int b = 7;
            int result = a * b;
            bool success = int.Equals(84, result);
        }

        public static void Multiplication_ByZero()
        {
            int a = 42;
            int b = 0;
            int result = a * b;
            bool success = int.Equals(0, result);
        }

        public static void Multiplication_NegativeNumbers()
        {
            int a = -12;
            int b = -7;
            int result = a * b;
            bool success = int.Equals(84, result);
        }

        public static void Multiplication_MixedSigns()
        {
            int a = 12;
            int b = -7;
            int result = a * b;
            bool success = int.Equals(-84, result);
        }

        public static void Division_PositiveNumbers()
        {
            int a = 84;
            int b = 7;
            int result = a / b;
            bool success = int.Equals(12, result);
        }

        public static void Division_WithRemainder()
        {
            int a = 85;
            int b = 7;
            int result = a / b;
            bool success = int.Equals(12, result);
        }

        public static void Division_NegativeNumbers()
        {
            int a = -84;
            int b = -7;
            int result = a / b;
            bool success = int.Equals(12, result);
        }

        public static void Division_MixedSigns()
        {
            int a = 84;
            int b = -7;
            int result = a / b;
            bool success = int.Equals(-12, result);
        }

        public static void Remainder_PositiveNumbers()
        {
            int a = 85;
            int b = 7;
            int result = a % b;
            bool success = int.Equals(1, result);
        }

        public static void Remainder_NegativeNumbers()
        {
            int a = -85;
            int b = 7;
            int result = a % b;
            bool success = int.Equals(-1, result);
        }

        public static void BitwiseAnd()
        {
            int a = 0b1010_1100;
            int b = 0b1100_0011;
            int result = a & b;
            bool success = int.Equals(0b1000_0000, result);
        }

        public static void BitwiseOr()
        {
            int a = 0b1010_1100;
            int b = 0b1100_0011;
            int result = a | b;
            bool success = int.Equals(0b1110_1111, result);
        }

        public static void BitwiseXor()
        {
            int a = 0b1010_1100;
            int b = 0b1100_0011;
            int result = a ^ b;
            bool success = int.Equals(0b0110_1111, result);
        }

        public static void LeftShift()
        {
            int a = 0b0000_0001;
            int result = a << 4;
            bool success = int.Equals(0b0001_0000, result);
        }

        public static void RightShift()
        {
            int a = 0b0001_0000;
            int result = a >> 4;
            bool success = int.Equals(0b0000_0001, result);
        }

        public static void UnaryMinus()
        {
            int a = 42;
            int result = -a;
            bool success = int.Equals(-42, result);
        }

        public static void ChainedOperations()
        {
            int a = 10;
            int b = 20;
            int c = 3;
            int result = (a + b) * c - 5;
            bool success = int.Equals(85, result);
        }

        public static void DivideByZeroThrows()
        {
            int a = 42;
            int b = 0;
            bool success = true;
            try
            {
                int result = a / b;
            }
            catch (DivideByZeroException)
            {
                success = false;
            }
        }

        public static void ModuloByZeroThrows()
        {
            int a = 42;
            int b = 0;
            bool success = true;
            try
            {
                int result = a % b;
            }
            catch (DivideByZeroException)
            {
                success = false;
            }
        }
    }
}