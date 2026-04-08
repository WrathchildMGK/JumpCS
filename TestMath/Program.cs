using JumpCS.TestMath.Tests;

namespace JumpCS.TestMath
{
    /// <summary>
    /// Entry point for TestMath assembly
    /// Calls all test methods to ensure they are compiled into the assembly
    /// </summary>
    public static class Program
    {
        public static void Main()
        {
            // Integer Math Tests
            IntegerMathTests.Addition_PositiveNumbers();
            IntegerMathTests.Addition_NegativeNumbers();
            IntegerMathTests.Addition_MixedSigns();
            IntegerMathTests.Addition_Overflow();
            IntegerMathTests.Subtraction_PositiveNumbers();
            IntegerMathTests.Subtraction_NegativeResult();
            IntegerMathTests.Subtraction_NegativeNumbers();
            IntegerMathTests.Multiplication_PositiveNumbers();
            IntegerMathTests.Multiplication_ByZero();
            IntegerMathTests.Multiplication_NegativeNumbers();
            IntegerMathTests.Multiplication_MixedSigns();
            IntegerMathTests.Division_PositiveNumbers();
            IntegerMathTests.Division_WithRemainder();
            IntegerMathTests.Division_NegativeNumbers();
            IntegerMathTests.Division_MixedSigns();
            IntegerMathTests.Remainder_PositiveNumbers();
            IntegerMathTests.Remainder_NegativeNumbers();
            IntegerMathTests.BitwiseAnd();
            IntegerMathTests.BitwiseOr();
            IntegerMathTests.BitwiseXor();
            IntegerMathTests.LeftShift();
            IntegerMathTests.RightShift();
            IntegerMathTests.UnaryMinus();
            IntegerMathTests.ChainedOperations();
            IntegerMathTests.DivideByZeroThrows();
            IntegerMathTests.ModuloByZeroThrows();

            // Float Math Tests
            FloatMathTests.Addition_PositiveNumbers();
            FloatMathTests.Addition_NegativeNumbers();
            FloatMathTests.Addition_MixedSigns();
            FloatMathTests.Subtraction_PositiveNumbers();
            FloatMathTests.Subtraction_NegativeResult();
            FloatMathTests.Multiplication_PositiveNumbers();
            FloatMathTests.Multiplication_ByZero();
            FloatMathTests.Multiplication_NegativeNumbers();
            FloatMathTests.Division_PositiveNumbers();
            FloatMathTests.Division_NegativeNumbers();
            FloatMathTests.Division_MixedSigns();
            FloatMathTests.Division_ByZeroPositive();
            FloatMathTests.Division_ByZeroNegative();
            FloatMathTests.Remainder_PositiveNumbers();
            FloatMathTests.UnaryMinus();
            FloatMathTests.Comparison_LessThan();
            FloatMathTests.Comparison_GreaterThan();
            FloatMathTests.Comparison_Equal();
            FloatMathTests.SpecialValue_NaN();
            FloatMathTests.SpecialValue_Infinity();
            FloatMathTests.Sqrt();
            FloatMathTests.Abs();
            FloatMathTests.ChainedOperations();

            // Double Math Tests
            DoubleMathTests.Addition_PositiveNumbers();
            DoubleMathTests.Addition_NegativeNumbers();
            DoubleMathTests.Addition_MixedSigns();
            DoubleMathTests.Subtraction_PositiveNumbers();
            DoubleMathTests.Subtraction_NegativeResult();
            DoubleMathTests.Multiplication_PositiveNumbers();
            DoubleMathTests.Multiplication_ByZero();
            DoubleMathTests.Multiplication_NegativeNumbers();
            DoubleMathTests.Division_PositiveNumbers();
            DoubleMathTests.Division_NegativeNumbers();
            DoubleMathTests.Division_MixedSigns();
            DoubleMathTests.Division_ByZeroPositive();
            DoubleMathTests.Division_ByZeroNegative();
            DoubleMathTests.Remainder_PositiveNumbers();
            DoubleMathTests.UnaryMinus();
            DoubleMathTests.Comparison_LessThan();
            DoubleMathTests.Comparison_GreaterThan();
            DoubleMathTests.Comparison_Equal();
            DoubleMathTests.SpecialValue_NaN();
            DoubleMathTests.SpecialValue_Infinity();
            DoubleMathTests.Sqrt();
            DoubleMathTests.Abs();
            DoubleMathTests.Pow();
            DoubleMathTests.Log();
            DoubleMathTests.Trigonometric_Sin();
            DoubleMathTests.Trigonometric_Cos();
            DoubleMathTests.ChainedOperations();

            // Decimal Math Tests
            DecimalMathTests.Addition_PositiveNumbers();
            DecimalMathTests.Addition_NegativeNumbers();
            DecimalMathTests.Addition_MixedSigns();
            DecimalMathTests.Subtraction_PositiveNumbers();
            DecimalMathTests.Subtraction_NegativeResult();
            DecimalMathTests.Multiplication_PositiveNumbers();
            DecimalMathTests.Multiplication_ByZero();
            DecimalMathTests.Multiplication_NegativeNumbers();
            DecimalMathTests.Division_PositiveNumbers();
            DecimalMathTests.Division_WithPrecision();
            DecimalMathTests.Division_NegativeNumbers();
            DecimalMathTests.Division_MixedSigns();
            DecimalMathTests.Remainder_PositiveNumbers();
            DecimalMathTests.Remainder_NegativeNumbers();
            DecimalMathTests.UnaryMinus();
            DecimalMathTests.UnaryPlus();
            DecimalMathTests.Comparison_LessThan();
            DecimalMathTests.Comparison_GreaterThan();
            DecimalMathTests.Comparison_Equal();
            DecimalMathTests.Comparison_NotEqual();
            DecimalMathTests.Abs();
            DecimalMathTests.Round_ToNearestEven();
            DecimalMathTests.Round_AwayFromZero();
            DecimalMathTests.Truncate();
            DecimalMathTests.Floor();
            DecimalMathTests.Ceiling();
            DecimalMathTests.DivideByZeroThrows();
            DecimalMathTests.ChainedOperations();
            DecimalMathTests.FinancialCalculation_CompoundInterest();
            DecimalMathTests.FinancialCalculation_PercentageIncrease();
            DecimalMathTests.ConversionFromFloat();
            DecimalMathTests.ConversionToFloat();

            // Type Conversion Tests
            TypeConversionTests.IntToFloat();
            TypeConversionTests.IntToDouble();
            TypeConversionTests.IntToDecimal();
            TypeConversionTests.FloatToInt();
            TypeConversionTests.FloatToDouble();
            TypeConversionTests.FloatToDecimal();
            TypeConversionTests.DoubleToInt();
            TypeConversionTests.DoubleToFloat();
            TypeConversionTests.DoubleToDecimal();
            TypeConversionTests.DecimalToInt();
            TypeConversionTests.DecimalToFloat();
            TypeConversionTests.DecimalToDouble();
            TypeConversionTests.ByteToInt();
            TypeConversionTests.IntToByte_WithOverflow();
            TypeConversionTests.ShortToInt();
            TypeConversionTests.LongToInt();
            TypeConversionTests.IntToLong();
            TypeConversionTests.NegativeIntToUnsigned();
            TypeConversionTests.ChainedConversions();
        }
    }
}
