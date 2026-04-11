; Generated 68000 Assembly Code
; Converted from C# MSIL
; Generated: 2026-04-11 11:50:37

    ; --- Code Section ---
    SECTION CODE

    ; --- Class Definitions ---
; Class: JumpCS.TestMath.Program
    CLASS_0 EQU 0
    CLASS_SIZE_0 EQU 0
; Class: JumpCS.TestMath.Tests.DecimalMathTests
    CLASS_1 EQU 1
    CLASS_SIZE_1 EQU 0
; Class: JumpCS.TestMath.Tests.DoubleMathTests
    CLASS_2 EQU 2
    CLASS_SIZE_2 EQU 0
; Class: JumpCS.TestMath.Tests.FloatMathTests
    CLASS_3 EQU 3
    CLASS_SIZE_3 EQU 0
; Class: JumpCS.TestMath.Tests.IntegerMathTests
    CLASS_4 EQU 4
    CLASS_SIZE_4 EQU 0
; Class: JumpCS.TestMath.Tests.TypeConversionTests
    CLASS_5 EQU 5
    CLASS_SIZE_5 EQU 0

    ; --- Class Table ---
CLASS_TABLE:
    DC.L JumpCS.TestMath.Program_vtable     ; Class JumpCS.TestMath.Program
    DC.L 0             ; Instance size
    DC.L JumpCS.TestMath.Tests.DecimalMathTests_vtable     ; Class JumpCS.TestMath.Tests.DecimalMathTests
    DC.L 0             ; Instance size
    DC.L JumpCS.TestMath.Tests.DoubleMathTests_vtable     ; Class JumpCS.TestMath.Tests.DoubleMathTests
    DC.L 0             ; Instance size
    DC.L JumpCS.TestMath.Tests.FloatMathTests_vtable     ; Class JumpCS.TestMath.Tests.FloatMathTests
    DC.L 0             ; Instance size
    DC.L JumpCS.TestMath.Tests.IntegerMathTests_vtable     ; Class JumpCS.TestMath.Tests.IntegerMathTests
    DC.L 0             ; Instance size
    DC.L JumpCS.TestMath.Tests.TypeConversionTests_vtable     ; Class JumpCS.TestMath.Tests.TypeConversionTests
    DC.L 0             ; Instance size

    ; --- Method Implementations ---
; Methods of JumpCS.TestMath.Program
JumpCS.TestMath.Program_Main:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Addition_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Addition_PositiveNumbers

    ; Offset 0006: nop
    ; TODO: nop

    ; Offset 0007: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Addition_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Addition_NegativeNumbers

    ; Offset 000C: nop
    ; TODO: nop

    ; Offset 000D: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Addition_MixedSigns()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Addition_MixedSigns

    ; Offset 0012: nop
    ; TODO: nop

    ; Offset 0013: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Addition_Overflow()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Addition_Overflow

    ; Offset 0018: nop
    ; TODO: nop

    ; Offset 0019: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Subtraction_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Subtraction_PositiveNumbers

    ; Offset 001E: nop
    ; TODO: nop

    ; Offset 001F: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Subtraction_NegativeResult()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Subtraction_NegativeResult

    ; Offset 0024: nop
    ; TODO: nop

    ; Offset 0025: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Subtraction_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Subtraction_NegativeNumbers

    ; Offset 002A: nop
    ; TODO: nop

    ; Offset 002B: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Multiplication_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_PositiveNumbers

    ; Offset 0030: nop
    ; TODO: nop

    ; Offset 0031: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Multiplication_ByZero()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_ByZero

    ; Offset 0036: nop
    ; TODO: nop

    ; Offset 0037: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Multiplication_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_NegativeNumbers

    ; Offset 003C: nop
    ; TODO: nop

    ; Offset 003D: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Multiplication_MixedSigns()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_MixedSigns

    ; Offset 0042: nop
    ; TODO: nop

    ; Offset 0043: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Division_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Division_PositiveNumbers

    ; Offset 0048: nop
    ; TODO: nop

    ; Offset 0049: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Division_WithRemainder()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Division_WithRemainder

    ; Offset 004E: nop
    ; TODO: nop

    ; Offset 004F: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Division_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Division_NegativeNumbers

    ; Offset 0054: nop
    ; TODO: nop

    ; Offset 0055: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Division_MixedSigns()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Division_MixedSigns

    ; Offset 005A: nop
    ; TODO: nop

    ; Offset 005B: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Remainder_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Remainder_PositiveNumbers

    ; Offset 0060: nop
    ; TODO: nop

    ; Offset 0061: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Remainder_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Remainder_NegativeNumbers

    ; Offset 0066: nop
    ; TODO: nop

    ; Offset 0067: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.BitwiseAnd()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_BitwiseAnd

    ; Offset 006C: nop
    ; TODO: nop

    ; Offset 006D: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.BitwiseOr()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_BitwiseOr

    ; Offset 0072: nop
    ; TODO: nop

    ; Offset 0073: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.BitwiseXor()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_BitwiseXor

    ; Offset 0078: nop
    ; TODO: nop

    ; Offset 0079: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.LeftShift()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_LeftShift

    ; Offset 007E: nop
    ; TODO: nop

    ; Offset 007F: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.RightShift()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_RightShift

    ; Offset 0084: nop
    ; TODO: nop

    ; Offset 0085: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.UnaryMinus()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_UnaryMinus

    ; Offset 008A: nop
    ; TODO: nop

    ; Offset 008B: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.ChainedOperations()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_ChainedOperations

    ; Offset 0090: nop
    ; TODO: nop

    ; Offset 0091: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.DivideByZeroThrows()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_DivideByZeroThrows

    ; Offset 0096: nop
    ; TODO: nop

    ; Offset 0097: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.ModuloByZeroThrows()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_ModuloByZeroThrows

    ; Offset 009C: nop
    ; TODO: nop

    ; Offset 009D: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Addition_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Addition_PositiveNumbers

    ; Offset 00A2: nop
    ; TODO: nop

    ; Offset 00A3: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Addition_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Addition_NegativeNumbers

    ; Offset 00A8: nop
    ; TODO: nop

    ; Offset 00A9: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Addition_MixedSigns()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Addition_MixedSigns

    ; Offset 00AE: nop
    ; TODO: nop

    ; Offset 00AF: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Subtraction_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Subtraction_PositiveNumbers

    ; Offset 00B4: nop
    ; TODO: nop

    ; Offset 00B5: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Subtraction_NegativeResult()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Subtraction_NegativeResult

    ; Offset 00BA: nop
    ; TODO: nop

    ; Offset 00BB: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Multiplication_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Multiplication_PositiveNumbers

    ; Offset 00C0: nop
    ; TODO: nop

    ; Offset 00C1: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Multiplication_ByZero()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Multiplication_ByZero

    ; Offset 00C6: nop
    ; TODO: nop

    ; Offset 00C7: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Multiplication_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Multiplication_NegativeNumbers

    ; Offset 00CC: nop
    ; TODO: nop

    ; Offset 00CD: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Division_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Division_PositiveNumbers

    ; Offset 00D2: nop
    ; TODO: nop

    ; Offset 00D3: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Division_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Division_NegativeNumbers

    ; Offset 00D8: nop
    ; TODO: nop

    ; Offset 00D9: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Division_MixedSigns()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Division_MixedSigns

    ; Offset 00DE: nop
    ; TODO: nop

    ; Offset 00DF: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Division_ByZeroPositive()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Division_ByZeroPositive

    ; Offset 00E4: nop
    ; TODO: nop

    ; Offset 00E5: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Division_ByZeroNegative()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Division_ByZeroNegative

    ; Offset 00EA: nop
    ; TODO: nop

    ; Offset 00EB: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Remainder_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Remainder_PositiveNumbers

    ; Offset 00F0: nop
    ; TODO: nop

    ; Offset 00F1: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.UnaryMinus()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_UnaryMinus

    ; Offset 00F6: nop
    ; TODO: nop

    ; Offset 00F7: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Comparison_LessThan()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Comparison_LessThan

    ; Offset 00FC: nop
    ; TODO: nop

    ; Offset 00FD: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Comparison_GreaterThan()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Comparison_GreaterThan

    ; Offset 0102: nop
    ; TODO: nop

    ; Offset 0103: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Comparison_Equal()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Comparison_Equal

    ; Offset 0108: nop
    ; TODO: nop

    ; Offset 0109: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.SpecialValue_NaN()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_SpecialValue_NaN

    ; Offset 010E: nop
    ; TODO: nop

    ; Offset 010F: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.SpecialValue_Infinity()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_SpecialValue_Infinity

    ; Offset 0114: nop
    ; TODO: nop

    ; Offset 0115: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Sqrt()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Sqrt

    ; Offset 011A: nop
    ; TODO: nop

    ; Offset 011B: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Abs()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Abs

    ; Offset 0120: nop
    ; TODO: nop

    ; Offset 0121: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.ChainedOperations()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_ChainedOperations

    ; Offset 0126: nop
    ; TODO: nop

    ; Offset 0127: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Addition_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Addition_PositiveNumbers

    ; Offset 012C: nop
    ; TODO: nop

    ; Offset 012D: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Addition_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Addition_NegativeNumbers

    ; Offset 0132: nop
    ; TODO: nop

    ; Offset 0133: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Addition_MixedSigns()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Addition_MixedSigns

    ; Offset 0138: nop
    ; TODO: nop

    ; Offset 0139: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Subtraction_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Subtraction_PositiveNumbers

    ; Offset 013E: nop
    ; TODO: nop

    ; Offset 013F: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Subtraction_NegativeResult()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Subtraction_NegativeResult

    ; Offset 0144: nop
    ; TODO: nop

    ; Offset 0145: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Multiplication_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Multiplication_PositiveNumbers

    ; Offset 014A: nop
    ; TODO: nop

    ; Offset 014B: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Multiplication_ByZero()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Multiplication_ByZero

    ; Offset 0150: nop
    ; TODO: nop

    ; Offset 0151: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Multiplication_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Multiplication_NegativeNumbers

    ; Offset 0156: nop
    ; TODO: nop

    ; Offset 0157: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Division_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Division_PositiveNumbers

    ; Offset 015C: nop
    ; TODO: nop

    ; Offset 015D: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Division_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Division_NegativeNumbers

    ; Offset 0162: nop
    ; TODO: nop

    ; Offset 0163: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Division_MixedSigns()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Division_MixedSigns

    ; Offset 0168: nop
    ; TODO: nop

    ; Offset 0169: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Division_ByZeroPositive()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Division_ByZeroPositive

    ; Offset 016E: nop
    ; TODO: nop

    ; Offset 016F: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Division_ByZeroNegative()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Division_ByZeroNegative

    ; Offset 0174: nop
    ; TODO: nop

    ; Offset 0175: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Remainder_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Remainder_PositiveNumbers

    ; Offset 017A: nop
    ; TODO: nop

    ; Offset 017B: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.UnaryMinus()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_UnaryMinus

    ; Offset 0180: nop
    ; TODO: nop

    ; Offset 0181: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Comparison_LessThan()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Comparison_LessThan

    ; Offset 0186: nop
    ; TODO: nop

    ; Offset 0187: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Comparison_GreaterThan()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Comparison_GreaterThan

    ; Offset 018C: nop
    ; TODO: nop

    ; Offset 018D: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Comparison_Equal()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Comparison_Equal

    ; Offset 0192: nop
    ; TODO: nop

    ; Offset 0193: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.SpecialValue_NaN()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_SpecialValue_NaN

    ; Offset 0198: nop
    ; TODO: nop

    ; Offset 0199: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.SpecialValue_Infinity()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_SpecialValue_Infinity

    ; Offset 019E: nop
    ; TODO: nop

    ; Offset 019F: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Sqrt()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Sqrt

    ; Offset 01A4: nop
    ; TODO: nop

    ; Offset 01A5: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Abs()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Abs

    ; Offset 01AA: nop
    ; TODO: nop

    ; Offset 01AB: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Pow()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Pow

    ; Offset 01B0: nop
    ; TODO: nop

    ; Offset 01B1: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Log()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Log

    ; Offset 01B6: nop
    ; TODO: nop

    ; Offset 01B7: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Trigonometric_Sin()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Trigonometric_Sin

    ; Offset 01BC: nop
    ; TODO: nop

    ; Offset 01BD: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Trigonometric_Cos()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Trigonometric_Cos

    ; Offset 01C2: nop
    ; TODO: nop

    ; Offset 01C3: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.ChainedOperations()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_ChainedOperations

    ; Offset 01C8: nop
    ; TODO: nop

    ; Offset 01C9: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Addition_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Addition_PositiveNumbers

    ; Offset 01CE: nop
    ; TODO: nop

    ; Offset 01CF: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Addition_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Addition_NegativeNumbers

    ; Offset 01D4: nop
    ; TODO: nop

    ; Offset 01D5: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Addition_MixedSigns()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Addition_MixedSigns

    ; Offset 01DA: nop
    ; TODO: nop

    ; Offset 01DB: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Subtraction_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Subtraction_PositiveNumbers

    ; Offset 01E0: nop
    ; TODO: nop

    ; Offset 01E1: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Subtraction_NegativeResult()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Subtraction_NegativeResult

    ; Offset 01E6: nop
    ; TODO: nop

    ; Offset 01E7: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Multiplication_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Multiplication_PositiveNumbers

    ; Offset 01EC: nop
    ; TODO: nop

    ; Offset 01ED: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Multiplication_ByZero()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Multiplication_ByZero

    ; Offset 01F2: nop
    ; TODO: nop

    ; Offset 01F3: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Multiplication_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Multiplication_NegativeNumbers

    ; Offset 01F8: nop
    ; TODO: nop

    ; Offset 01F9: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Division_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Division_PositiveNumbers

    ; Offset 01FE: nop
    ; TODO: nop

    ; Offset 01FF: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Division_WithPrecision()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Division_WithPrecision

    ; Offset 0204: nop
    ; TODO: nop

    ; Offset 0205: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Division_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Division_NegativeNumbers

    ; Offset 020A: nop
    ; TODO: nop

    ; Offset 020B: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Division_MixedSigns()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Division_MixedSigns

    ; Offset 0210: nop
    ; TODO: nop

    ; Offset 0211: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Remainder_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Remainder_PositiveNumbers

    ; Offset 0216: nop
    ; TODO: nop

    ; Offset 0217: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Remainder_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Remainder_NegativeNumbers

    ; Offset 021C: nop
    ; TODO: nop

    ; Offset 021D: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.UnaryMinus()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_UnaryMinus

    ; Offset 0222: nop
    ; TODO: nop

    ; Offset 0223: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.UnaryPlus()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_UnaryPlus

    ; Offset 0228: nop
    ; TODO: nop

    ; Offset 0229: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Comparison_LessThan()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Comparison_LessThan

    ; Offset 022E: nop
    ; TODO: nop

    ; Offset 022F: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Comparison_GreaterThan()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Comparison_GreaterThan

    ; Offset 0234: nop
    ; TODO: nop

    ; Offset 0235: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Comparison_Equal()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Comparison_Equal

    ; Offset 023A: nop
    ; TODO: nop

    ; Offset 023B: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Comparison_NotEqual()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Comparison_NotEqual

    ; Offset 0240: nop
    ; TODO: nop

    ; Offset 0241: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Abs()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Abs

    ; Offset 0246: nop
    ; TODO: nop

    ; Offset 0247: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Round_ToNearestEven()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Round_ToNearestEven

    ; Offset 024C: nop
    ; TODO: nop

    ; Offset 024D: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Round_AwayFromZero()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Round_AwayFromZero

    ; Offset 0252: nop
    ; TODO: nop

    ; Offset 0253: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Truncate()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Truncate

    ; Offset 0258: nop
    ; TODO: nop

    ; Offset 0259: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Floor()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Floor

    ; Offset 025E: nop
    ; TODO: nop

    ; Offset 025F: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Ceiling()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Ceiling

    ; Offset 0264: nop
    ; TODO: nop

    ; Offset 0265: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.DivideByZeroThrows()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_DivideByZeroThrows

    ; Offset 026A: nop
    ; TODO: nop

    ; Offset 026B: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.ChainedOperations()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_ChainedOperations

    ; Offset 0270: nop
    ; TODO: nop

    ; Offset 0271: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.FinancialCalculation_CompoundInterest()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_FinancialCalculation_CompoundInterest

    ; Offset 0276: nop
    ; TODO: nop

    ; Offset 0277: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.FinancialCalculation_PercentageIncrease()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_FinancialCalculation_PercentageIncrease

    ; Offset 027C: nop
    ; TODO: nop

    ; Offset 027D: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.ConversionFromFloat()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_ConversionFromFloat

    ; Offset 0282: nop
    ; TODO: nop

    ; Offset 0283: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.ConversionToFloat()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_ConversionToFloat

    ; Offset 0288: nop
    ; TODO: nop

    ; Offset 0289: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.IntToFloat()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_IntToFloat

    ; Offset 028E: nop
    ; TODO: nop

    ; Offset 028F: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.IntToDouble()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_IntToDouble

    ; Offset 0294: nop
    ; TODO: nop

    ; Offset 0295: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.IntToDecimal()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_IntToDecimal

    ; Offset 029A: nop
    ; TODO: nop

    ; Offset 029B: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.FloatToInt()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_FloatToInt

    ; Offset 02A0: nop
    ; TODO: nop

    ; Offset 02A1: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.FloatToDouble()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_FloatToDouble

    ; Offset 02A6: nop
    ; TODO: nop

    ; Offset 02A7: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.FloatToDecimal()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_FloatToDecimal

    ; Offset 02AC: nop
    ; TODO: nop

    ; Offset 02AD: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.DoubleToInt()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_DoubleToInt

    ; Offset 02B2: nop
    ; TODO: nop

    ; Offset 02B3: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.DoubleToFloat()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_DoubleToFloat

    ; Offset 02B8: nop
    ; TODO: nop

    ; Offset 02B9: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.DoubleToDecimal()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_DoubleToDecimal

    ; Offset 02BE: nop
    ; TODO: nop

    ; Offset 02BF: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.DecimalToInt()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_DecimalToInt

    ; Offset 02C4: nop
    ; TODO: nop

    ; Offset 02C5: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.DecimalToFloat()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_DecimalToFloat

    ; Offset 02CA: nop
    ; TODO: nop

    ; Offset 02CB: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.DecimalToDouble()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_DecimalToDouble

    ; Offset 02D0: nop
    ; TODO: nop

    ; Offset 02D1: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.ByteToInt()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_ByteToInt

    ; Offset 02D6: nop
    ; TODO: nop

    ; Offset 02D7: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.IntToByte_WithOverflow()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_IntToByte_WithOverflow

    ; Offset 02DC: nop
    ; TODO: nop

    ; Offset 02DD: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.ShortToInt()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_ShortToInt

    ; Offset 02E2: nop
    ; TODO: nop

    ; Offset 02E3: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.LongToInt()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_LongToInt

    ; Offset 02E8: nop
    ; TODO: nop

    ; Offset 02E9: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.IntToLong()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_IntToLong

    ; Offset 02EE: nop
    ; TODO: nop

    ; Offset 02EF: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.NegativeIntToUnsigned()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_NegativeIntToUnsigned

    ; Offset 02F4: nop
    ; TODO: nop

    ; Offset 02F5: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.ChainedConversions()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_ChainedConversions

    ; Offset 02FA: nop
    ; TODO: nop

    ; Offset 02FB: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS


; Methods of JumpCS.TestMath.Tests.DecimalMathTests
JumpCS.TestMath.Tests.DecimalMathTests_Addition_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_0
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_0:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #5830,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_1
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_1:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Addition (inline)
    ; System.Decimal op_Addition inline
    MOVE.L D0,A0    ; A0 = address of left operand
    MOVE.L D1,A1  ; A1 = address of right operand
    LEA -16(A6),A2        ; A2 = address of result
    MOVE.L 8(A0),D2   ; Load left low
    MOVE.L 8(A1),D3  ; Load right low
    ADD.L D3,D2           ; Add low parts
    MOVE.L D2,8(A2) ; Store result low (address preserved)
    MOVE.L 12(A0),D2  ; Load left mid
    MOVE.L 12(A1),D3 ; Load right mid
    ADDX.L D3,D2          ; Add mid parts with carry
    MOVE.L D2,12(A2) ; Store result mid (address preserved)
    MOVE.L 4(A0),D2   ; Load left high
    MOVE.L 4(A1),D3  ; Load right high
    ADDX.L D3,D2          ; Add high parts with carry
    MOVE.L D2,4(A2) ; Store result high (address preserved)
    MOVE.L (A0),D2    ; Load left flags
    MOVE.L D2,(A2)  ; Store result flags (address preserved)
    MOVE.L A2,D4 ; Convert address to data register for return

    ; Offset 0028: stloc.2
    MOVE.L D4,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4
    MOVE.L #10080,D5  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D6             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D7             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D3         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A3  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A3, lo=D5, mid=D6, hi=D7, sign=D2, scale=D3
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D3      ; Ensure scale is 0-255
    LSL.L #16,D3        ; Shift scale to bits 16-23
    OR.L D3,D0   ; Set scale in flags
    TST.L D2        ; Check if negative
    BEQ .SkipNegative_L_2
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_2:
    MOVE.L D0,(A3)      ; Store flags at offset 0
    MOVE.L D7,4(A3)          ; Store high at offset 4
    MOVE.L D5,8(A3)          ; Store low at offset 8
    MOVE.L D6,12(A3)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A3,D0   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D0  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A4    ; A4 = address of left operand
    MOVE.L D0,A5  ; A5 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A4),D0    ; Load left flags
    CMP.L (A5),D0    ; Compare flags
    BNE .NotEqual_L_3
    MOVE.L 4(A4),D0   ; Load left high
    CMP.L 4(A5),D0   ; Compare high
    BNE .NotEqual_L_3
    MOVE.L 8(A4),D0   ; Load left low
    CMP.L 8(A5),D0   ; Compare low
    BNE .NotEqual_L_3
    MOVE.L 12(A4),D0  ; Load left mid
    CMP.L 12(A5),D0  ; Compare mid
    BNE .NotEqual_L_3
    BRA .Done_L_4
.NotEqual_L_3:
    MOVE.L #0,D0     ; Not equal
.Done_L_4:

    ; Offset 003D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 003E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Addition_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D3         ; Load 1

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_5
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_5:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #5830,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D3         ; Load 1

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_6
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_6:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Addition (inline)
    ; System.Decimal op_Addition inline
    MOVE.L D0,A0    ; A0 = address of left operand
    MOVE.L D1,A1  ; A1 = address of right operand
    LEA -16(A6),A2        ; A2 = address of result
    MOVE.L 8(A0),D2   ; Load left low
    MOVE.L 8(A1),D3  ; Load right low
    ADD.L D3,D2           ; Add low parts
    MOVE.L D2,8(A2) ; Store result low (address preserved)
    MOVE.L 12(A0),D2  ; Load left mid
    MOVE.L 12(A1),D3 ; Load right mid
    ADDX.L D3,D2          ; Add mid parts with carry
    MOVE.L D2,12(A2) ; Store result mid (address preserved)
    MOVE.L 4(A0),D2   ; Load left high
    MOVE.L 4(A1),D3  ; Load right high
    ADDX.L D3,D2          ; Add high parts with carry
    MOVE.L D2,4(A2) ; Store result high (address preserved)
    MOVE.L (A0),D2    ; Load left flags
    MOVE.L D2,(A2)  ; Store result flags (address preserved)
    MOVE.L A2,D4 ; Convert address to data register for return

    ; Offset 0028: stloc.2
    MOVE.L D4,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4
    MOVE.L #10080,D5  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D6             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D7             ; Load 0

    ; Offset 0030: ldc.i4.1
    MOVE.L #1,D2         ; Load 1

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D3         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A3  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A3, lo=D5, mid=D6, hi=D7, sign=D2, scale=D3
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D3      ; Ensure scale is 0-255
    LSL.L #16,D3        ; Shift scale to bits 16-23
    OR.L D3,D0   ; Set scale in flags
    TST.L D2        ; Check if negative
    BEQ .SkipNegative_L_7
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_7:
    MOVE.L D0,(A3)      ; Store flags at offset 0
    MOVE.L D7,4(A3)          ; Store high at offset 4
    MOVE.L D5,8(A3)          ; Store low at offset 8
    MOVE.L D6,12(A3)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A3,D0   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D0  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A4    ; A4 = address of left operand
    MOVE.L D0,A5  ; A5 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A4),D0    ; Load left flags
    CMP.L (A5),D0    ; Compare flags
    BNE .NotEqual_L_8
    MOVE.L 4(A4),D0   ; Load left high
    CMP.L 4(A5),D0   ; Compare high
    BNE .NotEqual_L_8
    MOVE.L 8(A4),D0   ; Load left low
    CMP.L 8(A5),D0   ; Compare low
    BNE .NotEqual_L_8
    MOVE.L 12(A4),D0  ; Load left mid
    CMP.L 12(A5),D0  ; Compare mid
    BNE .NotEqual_L_8
    BRA .Done_L_9
.NotEqual_L_8:
    MOVE.L #0,D0     ; Not equal
.Done_L_9:

    ; Offset 003D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 003E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Addition_MixedSigns:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #10050,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_10
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_10:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #4230,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D3         ; Load 1

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_11
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_11:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Addition (inline)
    ; System.Decimal op_Addition inline
    MOVE.L D0,A0    ; A0 = address of left operand
    MOVE.L D1,A1  ; A1 = address of right operand
    LEA -16(A6),A2        ; A2 = address of result
    MOVE.L 8(A0),D2   ; Load left low
    MOVE.L 8(A1),D3  ; Load right low
    ADD.L D3,D2           ; Add low parts
    MOVE.L D2,8(A2) ; Store result low (address preserved)
    MOVE.L 12(A0),D2  ; Load left mid
    MOVE.L 12(A1),D3 ; Load right mid
    ADDX.L D3,D2          ; Add mid parts with carry
    MOVE.L D2,12(A2) ; Store result mid (address preserved)
    MOVE.L 4(A0),D2   ; Load left high
    MOVE.L 4(A1),D3  ; Load right high
    ADDX.L D3,D2          ; Add high parts with carry
    MOVE.L D2,4(A2) ; Store result high (address preserved)
    MOVE.L (A0),D2    ; Load left flags
    MOVE.L D2,(A2)  ; Store result flags (address preserved)
    MOVE.L A2,D4 ; Convert address to data register for return

    ; Offset 0028: stloc.2
    MOVE.L D4,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4
    MOVE.L #5820,D5  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D6             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D7             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D3         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A3  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A3, lo=D5, mid=D6, hi=D7, sign=D2, scale=D3
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D3      ; Ensure scale is 0-255
    LSL.L #16,D3        ; Shift scale to bits 16-23
    OR.L D3,D0   ; Set scale in flags
    TST.L D2        ; Check if negative
    BEQ .SkipNegative_L_12
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_12:
    MOVE.L D0,(A3)      ; Store flags at offset 0
    MOVE.L D7,4(A3)          ; Store high at offset 4
    MOVE.L D5,8(A3)          ; Store low at offset 8
    MOVE.L D6,12(A3)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A3,D0   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D0  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A4    ; A4 = address of left operand
    MOVE.L D0,A5  ; A5 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A4),D0    ; Load left flags
    CMP.L (A5),D0    ; Compare flags
    BNE .NotEqual_L_13
    MOVE.L 4(A4),D0   ; Load left high
    CMP.L 4(A5),D0   ; Compare high
    BNE .NotEqual_L_13
    MOVE.L 8(A4),D0   ; Load left low
    CMP.L 8(A5),D0   ; Compare low
    BNE .NotEqual_L_13
    MOVE.L 12(A4),D0  ; Load left mid
    CMP.L 12(A5),D0  ; Compare mid
    BNE .NotEqual_L_13
    BRA .Done_L_14
.NotEqual_L_13:
    MOVE.L #0,D0     ; Not equal
.Done_L_14:

    ; Offset 003D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 003E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Subtraction_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #10070,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_15
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_15:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #4230,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_16
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_16:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Subtraction (inline)
    ; System.Decimal op_Subtraction inline
    MOVE.L D0,A0    ; A0 = address of left operand
    MOVE.L D1,A1  ; A1 = address of right operand
    LEA -16(A6),A2        ; A2 = address of result
    MOVE.L 8(A0),D2   ; Load left low
    MOVE.L 8(A1),D3  ; Load right low
    SUB.L D3,D2           ; Subtract low parts
    MOVE.L D2,8(A2) ; Store result low (address preserved)
    MOVE.L 12(A0),D2  ; Load left mid
    MOVE.L 12(A1),D3 ; Load right mid
    SUBX.L D3,D2          ; Subtract mid parts with borrow
    MOVE.L D2,12(A2) ; Store result mid (address preserved)
    MOVE.L 4(A0),D2   ; Load left high
    MOVE.L 4(A1),D3  ; Load right high
    SUBX.L D3,D2          ; Subtract high parts with borrow
    MOVE.L D2,4(A2) ; Store result high (address preserved)
    MOVE.L (A0),D2    ; Load left flags
    MOVE.L D2,(A2)  ; Store result flags (address preserved)
    MOVE.L A2,D4 ; Convert address to data register for return

    ; Offset 0028: stloc.2
    MOVE.L D4,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4
    MOVE.L #5840,D5  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D6             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D7             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D3         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A3  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A3, lo=D5, mid=D6, hi=D7, sign=D2, scale=D3
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D3      ; Ensure scale is 0-255
    LSL.L #16,D3        ; Shift scale to bits 16-23
    OR.L D3,D0   ; Set scale in flags
    TST.L D2        ; Check if negative
    BEQ .SkipNegative_L_17
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_17:
    MOVE.L D0,(A3)      ; Store flags at offset 0
    MOVE.L D7,4(A3)          ; Store high at offset 4
    MOVE.L D5,8(A3)          ; Store low at offset 8
    MOVE.L D6,12(A3)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A3,D0   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D0  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A4    ; A4 = address of left operand
    MOVE.L D0,A5  ; A5 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A4),D0    ; Load left flags
    CMP.L (A5),D0    ; Compare flags
    BNE .NotEqual_L_18
    MOVE.L 4(A4),D0   ; Load left high
    CMP.L 4(A5),D0   ; Compare high
    BNE .NotEqual_L_18
    MOVE.L 8(A4),D0   ; Load left low
    CMP.L 8(A5),D0   ; Compare low
    BNE .NotEqual_L_18
    MOVE.L 12(A4),D0  ; Load left mid
    CMP.L 12(A5),D0  ; Compare mid
    BNE .NotEqual_L_18
    BRA .Done_L_19
.NotEqual_L_18:
    MOVE.L #0,D0     ; Not equal
.Done_L_19:

    ; Offset 003D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 003E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Subtraction_NegativeResult:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4230,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_20
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_20:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #10070,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_21
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_21:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Subtraction (inline)
    ; System.Decimal op_Subtraction inline
    MOVE.L D0,A0    ; A0 = address of left operand
    MOVE.L D1,A1  ; A1 = address of right operand
    LEA -16(A6),A2        ; A2 = address of result
    MOVE.L 8(A0),D2   ; Load left low
    MOVE.L 8(A1),D3  ; Load right low
    SUB.L D3,D2           ; Subtract low parts
    MOVE.L D2,8(A2) ; Store result low (address preserved)
    MOVE.L 12(A0),D2  ; Load left mid
    MOVE.L 12(A1),D3 ; Load right mid
    SUBX.L D3,D2          ; Subtract mid parts with borrow
    MOVE.L D2,12(A2) ; Store result mid (address preserved)
    MOVE.L 4(A0),D2   ; Load left high
    MOVE.L 4(A1),D3  ; Load right high
    SUBX.L D3,D2          ; Subtract high parts with borrow
    MOVE.L D2,4(A2) ; Store result high (address preserved)
    MOVE.L (A0),D2    ; Load left flags
    MOVE.L D2,(A2)  ; Store result flags (address preserved)
    MOVE.L A2,D4 ; Convert address to data register for return

    ; Offset 0028: stloc.2
    MOVE.L D4,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4
    MOVE.L #5840,D5  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D6             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D7             ; Load 0

    ; Offset 0030: ldc.i4.1
    MOVE.L #1,D2         ; Load 1

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D3         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A3  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A3, lo=D5, mid=D6, hi=D7, sign=D2, scale=D3
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D3      ; Ensure scale is 0-255
    LSL.L #16,D3        ; Shift scale to bits 16-23
    OR.L D3,D0   ; Set scale in flags
    TST.L D2        ; Check if negative
    BEQ .SkipNegative_L_22
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_22:
    MOVE.L D0,(A3)      ; Store flags at offset 0
    MOVE.L D7,4(A3)          ; Store high at offset 4
    MOVE.L D5,8(A3)          ; Store low at offset 8
    MOVE.L D6,12(A3)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A3,D0   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D0  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A4    ; A4 = address of left operand
    MOVE.L D0,A5  ; A5 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A4),D0    ; Load left flags
    CMP.L (A5),D0    ; Compare flags
    BNE .NotEqual_L_23
    MOVE.L 4(A4),D0   ; Load left high
    CMP.L 4(A5),D0   ; Compare high
    BNE .NotEqual_L_23
    MOVE.L 8(A4),D0   ; Load left low
    CMP.L 8(A5),D0   ; Compare low
    BNE .NotEqual_L_23
    MOVE.L 12(A4),D0  ; Load left mid
    CMP.L 12(A5),D0  ; Compare mid
    BNE .NotEqual_L_23
    BRA .Done_L_24
.NotEqual_L_23:
    MOVE.L #0,D0     ; Not equal
.Done_L_24:

    ; Offset 003D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 003E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Multiplication_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #1250,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_25
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_25:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #720,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_26
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_26:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Multiply (inline)
    ; TODO: D0 * D1

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4
    MOVE.L #9000,D3  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D6             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D7         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D3, mid=D4, hi=D5, sign=D6, scale=D7
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D7      ; Ensure scale is 0-255
    LSL.L #16,D7        ; Shift scale to bits 16-23
    OR.L D7,D0   ; Set scale in flags
    TST.L D6        ; Check if negative
    BEQ .SkipNegative_L_27
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_27:
    MOVE.L D0,(A0)      ; Store flags at offset 0
    MOVE.L D5,4(A0)          ; Store high at offset 4
    MOVE.L D3,8(A0)          ; Store low at offset 8
    MOVE.L D4,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D0   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D0  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A1    ; A1 = address of left operand
    MOVE.L D0,A2  ; A2 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A1),D0    ; Load left flags
    CMP.L (A2),D0    ; Compare flags
    BNE .NotEqual_L_28
    MOVE.L 4(A1),D0   ; Load left high
    CMP.L 4(A2),D0   ; Compare high
    BNE .NotEqual_L_28
    MOVE.L 8(A1),D0   ; Load left low
    CMP.L 8(A2),D0   ; Compare low
    BNE .NotEqual_L_28
    MOVE.L 12(A1),D0  ; Load left mid
    CMP.L 12(A2),D0  ; Compare mid
    BNE .NotEqual_L_28
    BRA .Done_L_29
.NotEqual_L_28:
    MOVE.L #0,D0     ; Not equal
.Done_L_29:

    ; Offset 003D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 003E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Multiplication_ByZero:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_30
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_30:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 0014: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0015: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0016: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0017: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 0018: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_31
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_31:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 001D: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 001E: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 001F: call
    ; System.Decimal.op_Multiply (inline)
    ; TODO: D0 * D1

    ; Offset 0024: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0025: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0026: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0027: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0028: ldc.i4.0
    CLR.L D6             ; Load 0

    ; Offset 0029: ldc.i4.2
    MOVE.L #2,D7         ; Load 2

    ; Offset 002A: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D3, mid=D4, hi=D5, sign=D6, scale=D7
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D7      ; Ensure scale is 0-255
    LSL.L #16,D7        ; Shift scale to bits 16-23
    OR.L D7,D0   ; Set scale in flags
    TST.L D6        ; Check if negative
    BEQ .SkipNegative_L_32
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_32:
    MOVE.L D0,(A0)      ; Store flags at offset 0
    MOVE.L D5,4(A0)          ; Store high at offset 4
    MOVE.L D3,8(A0)          ; Store low at offset 8
    MOVE.L D4,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D0   ; Convert address to data register

    ; Offset 002F: ldloc.2
    MOVE.L -12(A6),D0  ; Load local 2

    ; Offset 0030: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A1    ; A1 = address of left operand
    MOVE.L D0,A2  ; A2 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A1),D0    ; Load left flags
    CMP.L (A2),D0    ; Compare flags
    BNE .NotEqual_L_33
    MOVE.L 4(A1),D0   ; Load left high
    CMP.L 4(A2),D0   ; Compare high
    BNE .NotEqual_L_33
    MOVE.L 8(A1),D0   ; Load left low
    CMP.L 8(A2),D0   ; Compare low
    BNE .NotEqual_L_33
    MOVE.L 12(A1),D0  ; Load left mid
    CMP.L 12(A2),D0  ; Compare mid
    BNE .NotEqual_L_33
    BRA .Done_L_34
.NotEqual_L_33:
    MOVE.L #0,D0     ; Not equal
.Done_L_34:

    ; Offset 0035: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 0036: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Multiplication_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #1250,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D3         ; Load 1

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_35
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_35:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #720,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D3         ; Load 1

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_36
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_36:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Multiply (inline)
    ; TODO: D0 * D1

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4
    MOVE.L #9000,D3  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D6             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D7         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D3, mid=D4, hi=D5, sign=D6, scale=D7
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D7      ; Ensure scale is 0-255
    LSL.L #16,D7        ; Shift scale to bits 16-23
    OR.L D7,D0   ; Set scale in flags
    TST.L D6        ; Check if negative
    BEQ .SkipNegative_L_37
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_37:
    MOVE.L D0,(A0)      ; Store flags at offset 0
    MOVE.L D5,4(A0)          ; Store high at offset 4
    MOVE.L D3,8(A0)          ; Store low at offset 8
    MOVE.L D4,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D0   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D0  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A1    ; A1 = address of left operand
    MOVE.L D0,A2  ; A2 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A1),D0    ; Load left flags
    CMP.L (A2),D0    ; Compare flags
    BNE .NotEqual_L_38
    MOVE.L 4(A1),D0   ; Load left high
    CMP.L 4(A2),D0   ; Compare high
    BNE .NotEqual_L_38
    MOVE.L 8(A1),D0   ; Load left low
    CMP.L 8(A2),D0   ; Compare low
    BNE .NotEqual_L_38
    MOVE.L 12(A1),D0  ; Load left mid
    CMP.L 12(A2),D0  ; Compare mid
    BNE .NotEqual_L_38
    BRA .Done_L_39
.NotEqual_L_38:
    MOVE.L #0,D0     ; Not equal
.Done_L_39:

    ; Offset 003D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 003E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Division_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #8400,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_40
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_40:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #700,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_41
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_41:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Division (inline)
    ; TODO: D0 / D1

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4
    MOVE.L #1200,D3  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D6             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D7         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D3, mid=D4, hi=D5, sign=D6, scale=D7
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D7      ; Ensure scale is 0-255
    LSL.L #16,D7        ; Shift scale to bits 16-23
    OR.L D7,D0   ; Set scale in flags
    TST.L D6        ; Check if negative
    BEQ .SkipNegative_L_42
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_42:
    MOVE.L D0,(A0)      ; Store flags at offset 0
    MOVE.L D5,4(A0)          ; Store high at offset 4
    MOVE.L D3,8(A0)          ; Store low at offset 8
    MOVE.L D4,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D0   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D0  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A1    ; A1 = address of left operand
    MOVE.L D0,A2  ; A2 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A1),D0    ; Load left flags
    CMP.L (A2),D0    ; Compare flags
    BNE .NotEqual_L_43
    MOVE.L 4(A1),D0   ; Load left high
    CMP.L 4(A2),D0   ; Compare high
    BNE .NotEqual_L_43
    MOVE.L 8(A1),D0   ; Load left low
    CMP.L 8(A2),D0   ; Compare low
    BNE .NotEqual_L_43
    MOVE.L 12(A1),D0  ; Load left mid
    CMP.L 12(A2),D0  ; Compare mid
    BNE .NotEqual_L_43
    BRA .Done_L_44
.NotEqual_L_43:
    MOVE.L #0,D0     ; Not equal
.Done_L_44:

    ; Offset 003D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 003E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Division_WithPrecision:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #8500,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_45
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_45:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #700,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_46
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_46:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Division (inline)
    ; TODO: D0 / D1

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4
    MOVE.L #1859874231,D3  ; Load constant

    ; Offset 002E: ldc.i4
    MOVE.L #-1188237158,D4  ; Load constant

    ; Offset 0033: ldc.i4
    MOVE.L #658265604,D5  ; Load constant

    ; Offset 0038: ldc.i4.0
    CLR.L D6             ; Load 0

    ; Offset 0039: ldc.i4.s
    MOVE.L #27,D7  ; Load short constant

    ; Offset 003B: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D3, mid=D4, hi=D5, sign=D6, scale=D7
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D7      ; Ensure scale is 0-255
    LSL.L #16,D7        ; Shift scale to bits 16-23
    OR.L D7,D0   ; Set scale in flags
    TST.L D6        ; Check if negative
    BEQ .SkipNegative_L_47
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_47:
    MOVE.L D0,(A0)      ; Store flags at offset 0
    MOVE.L D5,4(A0)          ; Store high at offset 4
    MOVE.L D3,8(A0)          ; Store low at offset 8
    MOVE.L D4,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D0   ; Convert address to data register

    ; Offset 0040: ldloc.2
    MOVE.L -12(A6),D0  ; Load local 2

    ; Offset 0041: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A1    ; A1 = address of left operand
    MOVE.L D0,A2  ; A2 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A1),D0    ; Load left flags
    CMP.L (A2),D0    ; Compare flags
    BNE .NotEqual_L_48
    MOVE.L 4(A1),D0   ; Load left high
    CMP.L 4(A2),D0   ; Compare high
    BNE .NotEqual_L_48
    MOVE.L 8(A1),D0   ; Load left low
    CMP.L 8(A2),D0   ; Compare low
    BNE .NotEqual_L_48
    MOVE.L 12(A1),D0  ; Load left mid
    CMP.L 12(A2),D0  ; Compare mid
    BNE .NotEqual_L_48
    BRA .Done_L_49
.NotEqual_L_48:
    MOVE.L #0,D0     ; Not equal
.Done_L_49:

    ; Offset 0046: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 0047: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Division_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #8400,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D3         ; Load 1

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_50
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_50:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #700,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D3         ; Load 1

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_51
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_51:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Division (inline)
    ; TODO: D0 / D1

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4
    MOVE.L #1200,D3  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D6             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D7         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D3, mid=D4, hi=D5, sign=D6, scale=D7
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D7      ; Ensure scale is 0-255
    LSL.L #16,D7        ; Shift scale to bits 16-23
    OR.L D7,D0   ; Set scale in flags
    TST.L D6        ; Check if negative
    BEQ .SkipNegative_L_52
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_52:
    MOVE.L D0,(A0)      ; Store flags at offset 0
    MOVE.L D5,4(A0)          ; Store high at offset 4
    MOVE.L D3,8(A0)          ; Store low at offset 8
    MOVE.L D4,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D0   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D0  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A1    ; A1 = address of left operand
    MOVE.L D0,A2  ; A2 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A1),D0    ; Load left flags
    CMP.L (A2),D0    ; Compare flags
    BNE .NotEqual_L_53
    MOVE.L 4(A1),D0   ; Load left high
    CMP.L 4(A2),D0   ; Compare high
    BNE .NotEqual_L_53
    MOVE.L 8(A1),D0   ; Load left low
    CMP.L 8(A2),D0   ; Compare low
    BNE .NotEqual_L_53
    MOVE.L 12(A1),D0  ; Load left mid
    CMP.L 12(A2),D0  ; Compare mid
    BNE .NotEqual_L_53
    BRA .Done_L_54
.NotEqual_L_53:
    MOVE.L #0,D0     ; Not equal
.Done_L_54:

    ; Offset 003D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 003E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Division_MixedSigns:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #8400,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_55
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_55:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #700,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D3         ; Load 1

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_56
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_56:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Division (inline)
    ; TODO: D0 / D1

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4
    MOVE.L #1200,D3  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0030: ldc.i4.1
    MOVE.L #1,D6         ; Load 1

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D7         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D3, mid=D4, hi=D5, sign=D6, scale=D7
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D7      ; Ensure scale is 0-255
    LSL.L #16,D7        ; Shift scale to bits 16-23
    OR.L D7,D0   ; Set scale in flags
    TST.L D6        ; Check if negative
    BEQ .SkipNegative_L_57
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_57:
    MOVE.L D0,(A0)      ; Store flags at offset 0
    MOVE.L D5,4(A0)          ; Store high at offset 4
    MOVE.L D3,8(A0)          ; Store low at offset 8
    MOVE.L D4,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D0   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D0  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A1    ; A1 = address of left operand
    MOVE.L D0,A2  ; A2 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A1),D0    ; Load left flags
    CMP.L (A2),D0    ; Compare flags
    BNE .NotEqual_L_58
    MOVE.L 4(A1),D0   ; Load left high
    CMP.L 4(A2),D0   ; Compare high
    BNE .NotEqual_L_58
    MOVE.L 8(A1),D0   ; Load left low
    CMP.L 8(A2),D0   ; Compare low
    BNE .NotEqual_L_58
    MOVE.L 12(A1),D0  ; Load left mid
    CMP.L 12(A2),D0  ; Compare mid
    BNE .NotEqual_L_58
    BRA .Done_L_59
.NotEqual_L_58:
    MOVE.L #0,D0     ; Not equal
.Done_L_59:

    ; Offset 003D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 003E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Remainder_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #8500,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_60
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_60:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #700,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_61
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_61:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Modulus (inline)
    ; TODO: D0 % D1

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4.s
    MOVE.L #100,D3  ; Load short constant

    ; Offset 002B: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 002C: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 002D: ldc.i4.0
    CLR.L D6             ; Load 0

    ; Offset 002E: ldc.i4.2
    MOVE.L #2,D7         ; Load 2

    ; Offset 002F: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D3, mid=D4, hi=D5, sign=D6, scale=D7
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D7      ; Ensure scale is 0-255
    LSL.L #16,D7        ; Shift scale to bits 16-23
    OR.L D7,D0   ; Set scale in flags
    TST.L D6        ; Check if negative
    BEQ .SkipNegative_L_62
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_62:
    MOVE.L D0,(A0)      ; Store flags at offset 0
    MOVE.L D5,4(A0)          ; Store high at offset 4
    MOVE.L D3,8(A0)          ; Store low at offset 8
    MOVE.L D4,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D0   ; Convert address to data register

    ; Offset 0034: ldloc.2
    MOVE.L -12(A6),D0  ; Load local 2

    ; Offset 0035: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A1    ; A1 = address of left operand
    MOVE.L D0,A2  ; A2 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A1),D0    ; Load left flags
    CMP.L (A2),D0    ; Compare flags
    BNE .NotEqual_L_63
    MOVE.L 4(A1),D0   ; Load left high
    CMP.L 4(A2),D0   ; Compare high
    BNE .NotEqual_L_63
    MOVE.L 8(A1),D0   ; Load left low
    CMP.L 8(A2),D0   ; Compare low
    BNE .NotEqual_L_63
    MOVE.L 12(A1),D0  ; Load left mid
    CMP.L 12(A2),D0  ; Compare mid
    BNE .NotEqual_L_63
    BRA .Done_L_64
.NotEqual_L_63:
    MOVE.L #0,D0     ; Not equal
.Done_L_64:

    ; Offset 003A: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 003B: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Remainder_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #8500,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D3         ; Load 1

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_65
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_65:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #700,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_66
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_66:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Modulus (inline)
    ; TODO: D0 % D1

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4.s
    MOVE.L #100,D3  ; Load short constant

    ; Offset 002B: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 002C: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 002D: ldc.i4.1
    MOVE.L #1,D6         ; Load 1

    ; Offset 002E: ldc.i4.2
    MOVE.L #2,D7         ; Load 2

    ; Offset 002F: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D3, mid=D4, hi=D5, sign=D6, scale=D7
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D7      ; Ensure scale is 0-255
    LSL.L #16,D7        ; Shift scale to bits 16-23
    OR.L D7,D0   ; Set scale in flags
    TST.L D6        ; Check if negative
    BEQ .SkipNegative_L_67
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_67:
    MOVE.L D0,(A0)      ; Store flags at offset 0
    MOVE.L D5,4(A0)          ; Store high at offset 4
    MOVE.L D3,8(A0)          ; Store low at offset 8
    MOVE.L D4,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D0   ; Convert address to data register

    ; Offset 0034: ldloc.2
    MOVE.L -12(A6),D0  ; Load local 2

    ; Offset 0035: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A1    ; A1 = address of left operand
    MOVE.L D0,A2  ; A2 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A1),D0    ; Load left flags
    CMP.L (A2),D0    ; Compare flags
    BNE .NotEqual_L_68
    MOVE.L 4(A1),D0   ; Load left high
    CMP.L 4(A2),D0   ; Compare high
    BNE .NotEqual_L_68
    MOVE.L 8(A1),D0   ; Load left low
    CMP.L 8(A2),D0   ; Compare low
    BNE .NotEqual_L_68
    MOVE.L 12(A1),D0  ; Load left mid
    CMP.L 12(A2),D0  ; Compare mid
    BNE .NotEqual_L_68
    BRA .Done_L_69
.NotEqual_L_68:
    MOVE.L #0,D0     ; Not equal
.Done_L_69:

    ; Offset 003A: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 003B: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_UnaryMinus:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_70
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_70:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0012: call
    ; System.Decimal.op_UnaryNegation (inline)
    NEG.L D0     ; Negate
    MOVE.L D0,D1

    ; Offset 0017: stloc.1
    MOVE.L D1,-8(A6)   ; Store to local 1

    ; Offset 0018: ldc.i4
    MOVE.L #4250,D2  ; Load constant

    ; Offset 001D: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001E: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001F: ldc.i4.1
    MOVE.L #1,D5         ; Load 1

    ; Offset 0020: ldc.i4.2
    MOVE.L #2,D6         ; Load 2

    ; Offset 0021: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D2, mid=D3, hi=D4, sign=D5, scale=D6
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D6      ; Ensure scale is 0-255
    LSL.L #16,D6        ; Shift scale to bits 16-23
    OR.L D6,D7   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_71
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_71:
    MOVE.L D7,(A0)      ; Store flags at offset 0
    MOVE.L D4,4(A0)          ; Store high at offset 4
    MOVE.L D2,8(A0)          ; Store low at offset 8
    MOVE.L D3,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D0   ; Convert address to data register

    ; Offset 0026: ldloc.1
    MOVE.L -8(A6),D7   ; Load local 1

    ; Offset 0027: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A1    ; A1 = address of left operand
    MOVE.L D7,A2  ; A2 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A1),D0    ; Load left flags
    CMP.L (A2),D0    ; Compare flags
    BNE .NotEqual_L_72
    MOVE.L 4(A1),D0   ; Load left high
    CMP.L 4(A2),D0   ; Compare high
    BNE .NotEqual_L_72
    MOVE.L 8(A1),D0   ; Load left low
    CMP.L 8(A2),D0   ; Compare low
    BNE .NotEqual_L_72
    MOVE.L 12(A1),D0  ; Load left mid
    CMP.L 12(A2),D0  ; Compare mid
    BNE .NotEqual_L_72
    BRA .Done_L_73
.NotEqual_L_72:
    MOVE.L #0,D0     ; Not equal
.Done_L_73:

    ; Offset 002C: stloc.2
    MOVE.L D0,-12(A6)  ; Store to local 2

    ; Offset 002D: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_UnaryPlus:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D3         ; Load 1

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_74
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_74:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0012: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0013: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_75
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_75:
    MOVE.L D6,(A0)      ; Store flags at offset 0
    MOVE.L D3,4(A0)          ; Store high at offset 4
    MOVE.L D1,8(A0)          ; Store low at offset 8
    MOVE.L D2,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D7   ; Convert address to data register

    ; Offset 0021: ldloc.1
    MOVE.L -8(A6),D6   ; Load local 1

    ; Offset 0022: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A1    ; A1 = address of left operand
    MOVE.L D6,A2  ; A2 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A1),D0    ; Load left flags
    CMP.L (A2),D0    ; Compare flags
    BNE .NotEqual_L_76
    MOVE.L 4(A1),D0   ; Load left high
    CMP.L 4(A2),D0   ; Compare high
    BNE .NotEqual_L_76
    MOVE.L 8(A1),D0   ; Load left low
    CMP.L 8(A2),D0   ; Compare low
    BNE .NotEqual_L_76
    MOVE.L 12(A1),D0  ; Load left mid
    CMP.L 12(A2),D0  ; Compare mid
    BNE .NotEqual_L_76
    BRA .Done_L_77
.NotEqual_L_76:
    MOVE.L #0,D0     ; Not equal
.Done_L_77:

    ; Offset 0027: stloc.2
    MOVE.L D0,-12(A6)  ; Store to local 2

    ; Offset 0028: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Comparison_LessThan:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_78
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_78:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #5830,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_79
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_79:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_LessThan (inline)
    ; System.Decimal op_LessThan inline
    MOVE.L D0,A0    ; A0 = address of left operand
    MOVE.L D1,A1  ; A1 = address of right operand
    CLR.L D2     ; Assume not less than (default: 0)
    MOVE.L (A0),D3    ; Load left flags
    MOVE.L (A1),D4          ; Load right flags
    TST.L D3                     ; Check left sign (bit 31)
    BPL .LeftPositive_L_80
    TST.L D4
    BMI .BothNegative_L_80   ; Both negative, compare magnitude
    MOVE.L #1,D2              ; Left negative, right positive: left < right
    BRA .Done_L_82
.LeftPositive_L_80:
    TST.L D4
    BMI .Done_L_82              ; Left positive, right negative: left >= right (return 0)
.BothNegative_L_80:
    MOVE.L 4(A0),D3   ; Load left high
    CMP.L 4(A1),D3   ; Compare high
    BLT .IsLessThan_L_80
    BGT .Done_L_82              ; If left high > right high, not less
    MOVE.L 12(A0),D3  ; Load left mid
    CMP.L 12(A1),D3  ; Compare mid
    BLT .IsLessThan_L_80
    BGT .Done_L_82
    MOVE.L 8(A0),D3   ; Load left low
    CMP.L 8(A1),D3   ; Compare low
    BLT .IsLessThan_L_80
    BRA .Done_L_82
.IsLessThan_L_80:
    MOVE.L #1,D2              ; Left < Right
.Done_L_82:

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Comparison_GreaterThan:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #5830,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_83
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_83:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #4250,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_84
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_84:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_GreaterThan (inline)
    ; System.Decimal op_GreaterThan inline
    MOVE.L D0,A0    ; A0 = address of left operand
    MOVE.L D1,A1  ; A1 = address of right operand
    CLR.L D2     ; Assume not greater than (default: 0)
    MOVE.L (A0),D3    ; Load left flags
    MOVE.L (A1),D4          ; Load right flags
    TST.L D3                     ; Check left sign
    BMI .LeftNegative_L_85
    TST.L D4
    BPL .BothPositive_L_85 ; Both positive, compare magnitude
    MOVE.L #1,D2              ; Left positive, right negative: left > right
    BRA .Done_L_86
.LeftNegative_L_85:
    TST.L D4
    BPL .Done_L_86              ; Left negative, right positive: left < right (return 0)
.BothPositive_L_85:
    MOVE.L 4(A0),D3   ; Load left high
    CMP.L 4(A1),D3   ; Compare high
    BGT .IsGreaterThan_L_85
    BLT .Done_L_86
    MOVE.L 12(A0),D3  ; Load left mid
    CMP.L 12(A1),D3  ; Compare mid
    BGT .IsGreaterThan_L_85
    BLT .Done_L_86
    MOVE.L 8(A0),D3   ; Load left low
    CMP.L 8(A1),D3   ; Compare low
    BGT .IsGreaterThan_L_85
    BRA .Done_L_86
.IsGreaterThan_L_85:
    MOVE.L #1,D2              ; Left > Right
.Done_L_86:

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Comparison_Equal:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_87
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_87:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #4250,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_88
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_88:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Equality (inline)
    ; System.Decimal op_Equality inline
    ; System.Decimal Equals inline
    MOVE.L D0,A0    ; A0 = address of left operand
    MOVE.L D1,A1  ; A1 = address of right operand
    MOVE.L #1,D2     ; Assume equal
    MOVE.L (A0),D3    ; Load left flags
    CMP.L (A1),D3    ; Compare flags
    BNE .NotEqual_L_89
    MOVE.L 4(A0),D3   ; Load left high
    CMP.L 4(A1),D3   ; Compare high
    BNE .NotEqual_L_89
    MOVE.L 8(A0),D3   ; Load left low
    CMP.L 8(A1),D3   ; Compare low
    BNE .NotEqual_L_89
    MOVE.L 12(A0),D3  ; Load left mid
    CMP.L 12(A1),D3  ; Compare mid
    BNE .NotEqual_L_89
    BRA .Done_L_90
.NotEqual_L_89:
    MOVE.L #0,D2     ; Not equal
.Done_L_90:

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Comparison_NotEqual:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_91
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_91:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #4251,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_92
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_92:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Inequality (inline)
    ; System.Decimal op_Inequality inline
    MOVE.L D0,A0    ; A0 = address of left operand
    MOVE.L D1,A1  ; A1 = address of right operand
    CLR.L D2     ; Assume not equal (default: 0)
    MOVE.L (A0),D3    ; Load left flags
    CMP.L (A1),D3    ; Compare flags
    BNE .NotEqual_L_93
    MOVE.L 4(A0),D3   ; Load left high
    CMP.L 4(A1),D3   ; Compare high
    BNE .NotEqual_L_93
    MOVE.L 8(A0),D3   ; Load left low
    CMP.L 8(A1),D3   ; Compare low
    BNE .NotEqual_L_93
    MOVE.L 12(A0),D3  ; Load left mid
    CMP.L 12(A1),D3  ; Compare mid
    BEQ .Done_L_94
.NotEqual_L_93:
    MOVE.L #1,D2     ; Not equal
.Done_L_94:

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Abs:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D3         ; Load 1

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_95
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_95:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0012: call
    ; Decimal.Abs(D0)
    ; TODO: Implement decimal absolute value
    MOVE.L D0,D0

    ; Offset 0017: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0018: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 001D: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001E: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001F: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0020: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 0021: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_96
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_96:
    MOVE.L D6,(A0)      ; Store flags at offset 0
    MOVE.L D3,4(A0)          ; Store high at offset 4
    MOVE.L D1,8(A0)          ; Store low at offset 8
    MOVE.L D2,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D7   ; Convert address to data register

    ; Offset 0026: ldloc.1
    MOVE.L -8(A6),D6   ; Load local 1

    ; Offset 0027: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A1    ; A1 = address of left operand
    MOVE.L D6,A2  ; A2 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A1),D0    ; Load left flags
    CMP.L (A2),D0    ; Compare flags
    BNE .NotEqual_L_97
    MOVE.L 4(A1),D0   ; Load left high
    CMP.L 4(A2),D0   ; Compare high
    BNE .NotEqual_L_97
    MOVE.L 8(A1),D0   ; Load left low
    CMP.L 8(A2),D0   ; Compare low
    BNE .NotEqual_L_97
    MOVE.L 12(A1),D0  ; Load left mid
    CMP.L 12(A2),D0  ; Compare mid
    BNE .NotEqual_L_97
    BRA .Done_L_98
.NotEqual_L_97:
    MOVE.L #0,D0     ; Not equal
.Done_L_98:

    ; Offset 002C: stloc.2
    MOVE.L D0,-12(A6)  ; Store to local 2

    ; Offset 002D: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Round_ToNearestEven:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4255,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_99
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_99:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0012: ldc.i4.1
    MOVE.L #1,D1         ; Load 1

    ; Offset 0013: call
    ; System.Math.Round (inline) - 2 parameters
    ; System.Decimal.Round(D0, D1) - round to D1 places
    ; Stub implementation: return decimal unchanged
    ; (Proper rounding would require scale adjustment in flags word)
    MOVE.L D0,D0

    ; Offset 0018: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0019: ldc.i4
    MOVE.L #426,D2  ; Load constant

    ; Offset 001E: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001F: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0020: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0021: ldc.i4.1
    MOVE.L #1,D6         ; Load 1

    ; Offset 0022: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D2, mid=D3, hi=D4, sign=D5, scale=D6
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D6      ; Ensure scale is 0-255
    LSL.L #16,D6        ; Shift scale to bits 16-23
    OR.L D6,D7   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_100
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_100:
    MOVE.L D7,(A0)      ; Store flags at offset 0
    MOVE.L D4,4(A0)          ; Store high at offset 4
    MOVE.L D2,8(A0)          ; Store low at offset 8
    MOVE.L D3,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D0   ; Convert address to data register

    ; Offset 0027: ldloc.1
    MOVE.L -8(A6),D7   ; Load local 1

    ; Offset 0028: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A1    ; A1 = address of left operand
    MOVE.L D7,A2  ; A2 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A1),D0    ; Load left flags
    CMP.L (A2),D0    ; Compare flags
    BNE .NotEqual_L_101
    MOVE.L 4(A1),D0   ; Load left high
    CMP.L 4(A2),D0   ; Compare high
    BNE .NotEqual_L_101
    MOVE.L 8(A1),D0   ; Load left low
    CMP.L 8(A2),D0   ; Compare low
    BNE .NotEqual_L_101
    MOVE.L 12(A1),D0  ; Load left mid
    CMP.L 12(A2),D0  ; Compare mid
    BNE .NotEqual_L_101
    BRA .Done_L_102
.NotEqual_L_101:
    MOVE.L #0,D0     ; Not equal
.Done_L_102:

    ; Offset 002D: stloc.2
    MOVE.L D0,-12(A6)  ; Store to local 2

    ; Offset 002E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Round_AwayFromZero:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4255,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_103
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_103:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0012: ldc.i4.1
    MOVE.L #1,D1         ; Load 1

    ; Offset 0013: ldc.i4.1
    MOVE.L #1,D2         ; Load 1

    ; Offset 0014: call
    ; System.Math.Round (inline) - 3 parameters
    ; System.Decimal.Round(D0, D1, mode=D2)
    ; Stub: return decimal unchanged
    MOVE.L D0,D0

    ; Offset 0019: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 001A: ldc.i4
    MOVE.L #426,D3  ; Load constant

    ; Offset 001F: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0020: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0021: ldc.i4.0
    CLR.L D6             ; Load 0

    ; Offset 0022: ldc.i4.1
    MOVE.L #1,D7         ; Load 1

    ; Offset 0023: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D3, mid=D4, hi=D5, sign=D6, scale=D7
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D7      ; Ensure scale is 0-255
    LSL.L #16,D7        ; Shift scale to bits 16-23
    OR.L D7,D0   ; Set scale in flags
    TST.L D6        ; Check if negative
    BEQ .SkipNegative_L_104
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_104:
    MOVE.L D0,(A0)      ; Store flags at offset 0
    MOVE.L D5,4(A0)          ; Store high at offset 4
    MOVE.L D3,8(A0)          ; Store low at offset 8
    MOVE.L D4,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D0   ; Convert address to data register

    ; Offset 0028: ldloc.1
    MOVE.L -8(A6),D0   ; Load local 1

    ; Offset 0029: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A1    ; A1 = address of left operand
    MOVE.L D0,A2  ; A2 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A1),D0    ; Load left flags
    CMP.L (A2),D0    ; Compare flags
    BNE .NotEqual_L_105
    MOVE.L 4(A1),D0   ; Load left high
    CMP.L 4(A2),D0   ; Compare high
    BNE .NotEqual_L_105
    MOVE.L 8(A1),D0   ; Load left low
    CMP.L 8(A2),D0   ; Compare low
    BNE .NotEqual_L_105
    MOVE.L 12(A1),D0  ; Load left mid
    CMP.L 12(A2),D0  ; Compare mid
    BNE .NotEqual_L_105
    BRA .Done_L_106
.NotEqual_L_105:
    MOVE.L #0,D0     ; Not equal
.Done_L_106:

    ; Offset 002E: stloc.2
    MOVE.L D0,-12(A6)  ; Store to local 2

    ; Offset 002F: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Truncate:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4297,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_107
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_107:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0012: call
    ; Truncate - stub (return value unchanged)

    ; Offset 0017: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0018: ldc.i4.s
    MOVE.L #42,D1  ; Load short constant

    ; Offset 001A: newobj
    ; System.Decimal newobj - create new instance (1 parameters)
    ; TODO: Decimal newobj with 1 parameters (expected 5)

    ; Offset 001F: ldloc.1
    MOVE.L -8(A6),D3   ; Load local 1

    ; Offset 0020: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D2,A0    ; A0 = address of left operand
    MOVE.L D3,A1  ; A1 = address of right operand
    MOVE.L #1,D4     ; Assume equal
    MOVE.L (A0),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_108
    MOVE.L 4(A0),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_108
    MOVE.L 8(A0),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_108
    MOVE.L 12(A0),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_108
    BRA .Done_L_109
.NotEqual_L_108:
    MOVE.L #0,D4     ; Not equal
.Done_L_109:

    ; Offset 0025: stloc.2
    MOVE.L D4,-12(A6)  ; Store to local 2

    ; Offset 0026: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Floor:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4297,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_110
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_110:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0012: call
    ; Floor - stub (return value unchanged)

    ; Offset 0017: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0018: ldc.i4.s
    MOVE.L #42,D1  ; Load short constant

    ; Offset 001A: newobj
    ; System.Decimal newobj - create new instance (1 parameters)
    ; TODO: Decimal newobj with 1 parameters (expected 5)

    ; Offset 001F: ldloc.1
    MOVE.L -8(A6),D3   ; Load local 1

    ; Offset 0020: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D2,A0    ; A0 = address of left operand
    MOVE.L D3,A1  ; A1 = address of right operand
    MOVE.L #1,D4     ; Assume equal
    MOVE.L (A0),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_111
    MOVE.L 4(A0),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_111
    MOVE.L 8(A0),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_111
    MOVE.L 12(A0),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_111
    BRA .Done_L_112
.NotEqual_L_111:
    MOVE.L #0,D4     ; Not equal
.Done_L_112:

    ; Offset 0025: stloc.2
    MOVE.L D4,-12(A6)  ; Store to local 2

    ; Offset 0026: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Ceiling:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4201,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_113
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_113:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0012: call
    ; Ceiling - stub (return value unchanged)

    ; Offset 0017: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0018: ldc.i4.s
    MOVE.L #43,D1  ; Load short constant

    ; Offset 001A: newobj
    ; System.Decimal newobj - create new instance (1 parameters)
    ; TODO: Decimal newobj with 1 parameters (expected 5)

    ; Offset 001F: ldloc.1
    MOVE.L -8(A6),D3   ; Load local 1

    ; Offset 0020: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D2,A0    ; A0 = address of left operand
    MOVE.L D3,A1  ; A1 = address of right operand
    MOVE.L #1,D4     ; Assume equal
    MOVE.L (A0),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_114
    MOVE.L 4(A0),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_114
    MOVE.L 8(A0),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_114
    MOVE.L 12(A0),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_114
    BRA .Done_L_115
.NotEqual_L_114:
    MOVE.L #0,D4     ; Not equal
.Done_L_115:

    ; Offset 0025: stloc.2
    MOVE.L D4,-12(A6)  ; Store to local 2

    ; Offset 0026: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_DivideByZeroThrows:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_116
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_116:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 0014: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0015: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0016: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0017: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 0018: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_117
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_117:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 001D: ldc.i4.1
    MOVE.L #1,D0         ; Load 1

    ; Offset 001E: stloc.2
    MOVE.L D0,-12(A6)  ; Store to local 2

    ; Offset 001F: nop
    ; TODO: nop

    ; Offset 0020: ldloc.0
    MOVE.L -4(A6),D1   ; Load local 0

    ; Offset 0021: ldloc.1
    MOVE.L -8(A6),D2   ; Load local 1

    ; Offset 0022: call
    ; System.Decimal.op_Division (inline)
    ; TODO: D1 / D2

    ; Offset 0027: stloc.3
    MOVE.L D3,-16(A6)  ; Store to local 3

    ; Offset 0028: nop
    ; TODO: nop

    ; Offset 0029: leave.s
    BRA L_0032  ; leave - exit exception handler

    ; Offset 002B: pop
    ; WARNING: Pop on empty stack

    ; Offset 002C: nop
    ; TODO: nop

    ; Offset 002D: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 002E: stloc.2
    MOVE.L D0,-12(A6)  ; Store to local 2

    ; Offset 002F: nop
    ; TODO: nop

    ; Offset 0030: leave.s
    BRA L_0032  ; leave - exit exception handler

    ; Offset 0032: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_ChainedOperations:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #20,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #1050,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_118
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_118:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #2030,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_119
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_119:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloca.s
    LEA -12(A6),A0  ; Load address of local 2

    ; Offset 0023: ldc.i4
    MOVE.L #300,D0  ; Load constant

    ; Offset 0028: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0029: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 002A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 002B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 002C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_120
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_120:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0031: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0032: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0033: call
    ; System.Decimal.op_Addition (inline)
    ; System.Decimal op_Addition inline
    MOVE.L D0,A0    ; A0 = address of left operand
    MOVE.L D1,A1  ; A1 = address of right operand
    LEA -16(A6),A2        ; A2 = address of result
    MOVE.L 8(A0),D2   ; Load left low
    MOVE.L 8(A1),D3  ; Load right low
    ADD.L D3,D2           ; Add low parts
    MOVE.L D2,8(A2) ; Store result low (address preserved)
    MOVE.L 12(A0),D2  ; Load left mid
    MOVE.L 12(A1),D3 ; Load right mid
    ADDX.L D3,D2          ; Add mid parts with carry
    MOVE.L D2,12(A2) ; Store result mid (address preserved)
    MOVE.L 4(A0),D2   ; Load left high
    MOVE.L 4(A1),D3  ; Load right high
    ADDX.L D3,D2          ; Add high parts with carry
    MOVE.L D2,4(A2) ; Store result high (address preserved)
    MOVE.L (A0),D2    ; Load left flags
    MOVE.L D2,(A2)  ; Store result flags (address preserved)
    MOVE.L A2,D4 ; Convert address to data register for return

    ; Offset 0038: ldloc.2
    MOVE.L -12(A6),D5  ; Load local 2

    ; Offset 0039: call
    ; System.Decimal.op_Multiply (inline)
    ; TODO: D4 * D5

    ; Offset 003E: ldc.i4
    MOVE.L #520,D7  ; Load constant

    ; Offset 0043: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0044: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0045: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 0046: ldc.i4.2
    MOVE.L #2,D0         ; Load 2

    ; Offset 0047: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A3  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A3, lo=D7, mid=D2, hi=D3, sign=D0, scale=D0
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D0      ; Ensure scale is 0-255
    LSL.L #16,D0        ; Shift scale to bits 16-23
    OR.L D0,D0   ; Set scale in flags
    TST.L D0        ; Check if negative
    BEQ .SkipNegative_L_121
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_121:
    MOVE.L D0,(A3)      ; Store flags at offset 0
    MOVE.L D3,4(A3)          ; Store high at offset 4
    MOVE.L D7,8(A3)          ; Store low at offset 8
    MOVE.L D2,12(A3)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A3,D0   ; Convert address to data register

    ; Offset 004C: call
    ; System.Decimal.op_Subtraction (inline)
    ; System.Decimal op_Subtraction inline
    MOVE.L D6,A4    ; A4 = address of left operand
    MOVE.L D0,A5  ; A5 = address of right operand
    LEA -16(A6),A0        ; A0 = address of result
    MOVE.L 8(A4),D0   ; Load left low
    MOVE.L 8(A5),D0  ; Load right low
    SUB.L D0,D0           ; Subtract low parts
    MOVE.L D0,8(A0) ; Store result low (address preserved)
    MOVE.L 12(A4),D0  ; Load left mid
    MOVE.L 12(A5),D0 ; Load right mid
    SUBX.L D0,D0          ; Subtract mid parts with borrow
    MOVE.L D0,12(A0) ; Store result mid (address preserved)
    MOVE.L 4(A4),D0   ; Load left high
    MOVE.L 4(A5),D0  ; Load right high
    SUBX.L D0,D0          ; Subtract high parts with borrow
    MOVE.L D0,4(A0) ; Store result high (address preserved)
    MOVE.L (A4),D0    ; Load left flags
    MOVE.L D0,(A0)  ; Store result flags (address preserved)
    MOVE.L A0,D0 ; Convert address to data register for return

    ; Offset 0051: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 0052: ldc.i4
    MOVE.L #8720,D0  ; Load constant

    ; Offset 0057: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 0058: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 0059: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 005A: ldc.i4.2
    MOVE.L #2,D0         ; Load 2

    ; Offset 005B: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A1  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A1, lo=D0, mid=D0, hi=D0, sign=D0, scale=D0
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D0      ; Ensure scale is 0-255
    LSL.L #16,D0        ; Shift scale to bits 16-23
    OR.L D0,D0   ; Set scale in flags
    TST.L D0        ; Check if negative
    BEQ .SkipNegative_L_122
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_122:
    MOVE.L D0,(A1)      ; Store flags at offset 0
    MOVE.L D0,4(A1)          ; Store high at offset 4
    MOVE.L D0,8(A1)          ; Store low at offset 8
    MOVE.L D0,12(A1)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A1,D0   ; Convert address to data register

    ; Offset 0060: ldloc.3
    MOVE.L -16(A6),D0  ; Load local 3

    ; Offset 0061: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A2    ; A2 = address of left operand
    MOVE.L D0,A3  ; A3 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A2),D0    ; Load left flags
    CMP.L (A3),D0    ; Compare flags
    BNE .NotEqual_L_123
    MOVE.L 4(A2),D0   ; Load left high
    CMP.L 4(A3),D0   ; Compare high
    BNE .NotEqual_L_123
    MOVE.L 8(A2),D0   ; Load left low
    CMP.L 8(A3),D0   ; Compare low
    BNE .NotEqual_L_123
    MOVE.L 12(A2),D0  ; Load left mid
    CMP.L 12(A3),D0  ; Compare mid
    BNE .NotEqual_L_123
    BRA .Done_L_124
.NotEqual_L_123:
    MOVE.L #0,D0     ; Not equal
.Done_L_124:

    ; Offset 0066: stloc.s
    MOVE.L D0,-20(A6)  ; Store to local 4

    ; Offset 0068: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_FinancialCalculation_CompoundInterest:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #20,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #100000,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_125
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_125:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4.5
    MOVE.L #5,D0         ; Load 5

    ; Offset 0014: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0015: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0016: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0017: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 0018: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_126
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_126:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 001D: ldloca.s
    LEA -12(A6),A0  ; Load address of local 2

    ; Offset 001F: ldc.i4
    MOVE.L #200,D0  ; Load constant

    ; Offset 0024: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0025: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0026: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0027: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 0028: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_127
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_127:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 002D: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 002E: ldsfld
    ; TODO: ldsfld token 0A00001F
    CLR.L D1  ; TODO: Load static field 0A00001F

    ; Offset 0033: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0034: ldloc.2
    MOVE.L -12(A6),D2  ; Load local 2

    ; Offset 0035: call
    ; System.Decimal.op_Multiply (inline)
    ; TODO: D1 * D2

    ; Offset 003A: call
    ; System.Decimal.op_Addition (inline)
    ; System.Decimal op_Addition inline
    MOVE.L D1,A0    ; A0 = address of left operand
    MOVE.L D3,A1  ; A1 = address of right operand
    LEA -16(A6),A2        ; A2 = address of result
    MOVE.L 8(A0),D4   ; Load left low
    MOVE.L 8(A1),D5  ; Load right low
    ADD.L D5,D4           ; Add low parts
    MOVE.L D4,8(A2) ; Store result low (address preserved)
    MOVE.L 12(A0),D4  ; Load left mid
    MOVE.L 12(A1),D5 ; Load right mid
    ADDX.L D5,D4          ; Add mid parts with carry
    MOVE.L D4,12(A2) ; Store result mid (address preserved)
    MOVE.L 4(A0),D4   ; Load left high
    MOVE.L 4(A1),D5  ; Load right high
    ADDX.L D5,D4          ; Add high parts with carry
    MOVE.L D4,4(A2) ; Store result high (address preserved)
    MOVE.L (A0),D4    ; Load left flags
    MOVE.L D4,(A2)  ; Store result flags (address preserved)
    MOVE.L A2,D6 ; Convert address to data register for return

    ; Offset 003F: call
    ; System.Decimal.op_Multiply (inline)
    ; TODO: D0 * D6

    ; Offset 0044: stloc.3
    MOVE.L D7,-16(A6)  ; Store to local 3

    ; Offset 0045: ldc.i4
    MOVE.L #110000,D4  ; Load constant

    ; Offset 004A: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 004B: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 004C: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 004D: ldc.i4.2
    MOVE.L #2,D0         ; Load 2

    ; Offset 004E: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A3  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A3, lo=D4, mid=D5, hi=D0, sign=D0, scale=D0
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D0      ; Ensure scale is 0-255
    LSL.L #16,D0        ; Shift scale to bits 16-23
    OR.L D0,D0   ; Set scale in flags
    TST.L D0        ; Check if negative
    BEQ .SkipNegative_L_128
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_128:
    MOVE.L D0,(A3)      ; Store flags at offset 0
    MOVE.L D0,4(A3)          ; Store high at offset 4
    MOVE.L D4,8(A3)          ; Store low at offset 8
    MOVE.L D5,12(A3)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A3,D0   ; Convert address to data register

    ; Offset 0053: ldloc.3
    MOVE.L -16(A6),D0  ; Load local 3

    ; Offset 0054: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A4    ; A4 = address of left operand
    MOVE.L D0,A5  ; A5 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A4),D0    ; Load left flags
    CMP.L (A5),D0    ; Compare flags
    BNE .NotEqual_L_129
    MOVE.L 4(A4),D0   ; Load left high
    CMP.L 4(A5),D0   ; Compare high
    BNE .NotEqual_L_129
    MOVE.L 8(A4),D0   ; Load left low
    CMP.L 8(A5),D0   ; Compare low
    BNE .NotEqual_L_129
    MOVE.L 12(A4),D0  ; Load left mid
    CMP.L 12(A5),D0  ; Compare mid
    BNE .NotEqual_L_129
    BRA .Done_L_130
.NotEqual_L_129:
    MOVE.L #0,D0     ; Not equal
.Done_L_130:

    ; Offset 0059: stloc.s
    MOVE.L D0,-20(A6)  ; Store to local 4

    ; Offset 005B: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_FinancialCalculation_PercentageIncrease:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #20,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),A0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #20000,D0  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_131
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_131:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),A0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #1500,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L A0,A1 ; A1 = address of this
    ; System.Decimal constructor inline
    ; this @ A1, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_132
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_132:
    MOVE.L D5,(A1)   ; Store flags at offset 0
    MOVE.L D2,4(A1)       ; Store high at offset 4
    MOVE.L D0,8(A1)       ; Store low at offset 8
    MOVE.L D1,12(A1)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: ldc.i4.s
    MOVE.L #100,D2  ; Load short constant

    ; Offset 0025: newobj
    ; System.Decimal newobj - create new instance (1 parameters)
    ; TODO: Decimal newobj with 1 parameters (expected 5)

    ; Offset 002A: call
    ; System.Decimal.op_Division (inline)
    ; TODO: D1 / D3

    ; Offset 002F: call
    ; System.Decimal.op_Multiply (inline)
    ; TODO: D0 * D4

    ; Offset 0034: stloc.2
    MOVE.L D5,-12(A6)  ; Store to local 2

    ; Offset 0035: ldloc.0
    MOVE.L -4(A6),D6   ; Load local 0

    ; Offset 0036: ldloc.2
    MOVE.L -12(A6),D7  ; Load local 2

    ; Offset 0037: call
    ; System.Decimal.op_Addition (inline)
    ; System.Decimal op_Addition inline
    MOVE.L D6,A0    ; A0 = address of left operand
    MOVE.L D7,A1  ; A1 = address of right operand
    LEA -16(A6),A2        ; A2 = address of result
    MOVE.L 8(A0),D0   ; Load left low
    MOVE.L 8(A1),D0  ; Load right low
    ADD.L D0,D0           ; Add low parts
    MOVE.L D0,8(A2) ; Store result low (address preserved)
    MOVE.L 12(A0),D0  ; Load left mid
    MOVE.L 12(A1),D0 ; Load right mid
    ADDX.L D0,D0          ; Add mid parts with carry
    MOVE.L D0,12(A2) ; Store result mid (address preserved)
    MOVE.L 4(A0),D0   ; Load left high
    MOVE.L 4(A1),D0  ; Load right high
    ADDX.L D0,D0          ; Add high parts with carry
    MOVE.L D0,4(A2) ; Store result high (address preserved)
    MOVE.L (A0),D0    ; Load left flags
    MOVE.L D0,(A2)  ; Store result flags (address preserved)
    MOVE.L A2,D0 ; Convert address to data register for return

    ; Offset 003C: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 003D: ldc.i4
    MOVE.L #23000,D0  ; Load constant

    ; Offset 0042: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 0043: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 0044: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 0045: ldc.i4.2
    MOVE.L #2,D0         ; Load 2

    ; Offset 0046: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A3  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A3, lo=D0, mid=D0, hi=D0, sign=D0, scale=D0
    CLR.L D0           ; Clear flags
    AND.L #0xFF,D0      ; Ensure scale is 0-255
    LSL.L #16,D0        ; Shift scale to bits 16-23
    OR.L D0,D0   ; Set scale in flags
    TST.L D0        ; Check if negative
    BEQ .SkipNegative_L_133
    OR.L #0x80000000,D0 ; Set sign bit if negative
.SkipNegative_L_133:
    MOVE.L D0,(A3)      ; Store flags at offset 0
    MOVE.L D0,4(A3)          ; Store high at offset 4
    MOVE.L D0,8(A3)          ; Store low at offset 8
    MOVE.L D0,12(A3)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A3,D0   ; Convert address to data register

    ; Offset 004B: ldloc.3
    MOVE.L -16(A6),D0  ; Load local 3

    ; Offset 004C: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A4    ; A4 = address of left operand
    MOVE.L D0,A5  ; A5 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A4),D0    ; Load left flags
    CMP.L (A5),D0    ; Compare flags
    BNE .NotEqual_L_134
    MOVE.L 4(A4),D0   ; Load left high
    CMP.L 4(A5),D0   ; Compare high
    BNE .NotEqual_L_134
    MOVE.L 8(A4),D0   ; Load left low
    CMP.L 8(A5),D0   ; Compare low
    BNE .NotEqual_L_134
    MOVE.L 12(A4),D0  ; Load left mid
    CMP.L 12(A5),D0  ; Compare mid
    BNE .NotEqual_L_134
    BRA .Done_L_135
.NotEqual_L_134:
    MOVE.L #0,D0     ; Not equal
.Done_L_135:

    ; Offset 0051: stloc.s
    MOVE.L D0,-20(A6)  ; Store to local 4

    ; Offset 0053: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_ConversionFromFloat:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldc.r4

    ; Offset 0002: nop
    ; TODO: nop

    ; Offset 0003: nop
    ; TODO: nop

    ; Offset 0004: ret
    CLR.L D0            ; Clear return value (void)

    ; Offset 0005: bgt.un
