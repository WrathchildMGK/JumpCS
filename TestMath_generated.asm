; Generated 68000 Assembly Code
; Converted from C# MSIL
; Generated: 2026-04-12 13:25:30

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
JumpCS.TestMath.Program_AllIntegerMathTests:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Addition_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Addition_PositiveNumbers

    ; Offset 0006: nop
    ; NOP

    ; Offset 0007: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Addition_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Addition_NegativeNumbers

    ; Offset 000C: nop
    ; NOP

    ; Offset 000D: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Addition_MixedSigns()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Addition_MixedSigns

    ; Offset 0012: nop
    ; NOP

    ; Offset 0013: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Addition_Overflow()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Addition_Overflow

    ; Offset 0018: nop
    ; NOP

    ; Offset 0019: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Subtraction_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Subtraction_PositiveNumbers

    ; Offset 001E: nop
    ; NOP

    ; Offset 001F: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Subtraction_NegativeResult()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Subtraction_NegativeResult

    ; Offset 0024: nop
    ; NOP

    ; Offset 0025: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Subtraction_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Subtraction_NegativeNumbers

    ; Offset 002A: nop
    ; NOP

    ; Offset 002B: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Multiplication_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_PositiveNumbers

    ; Offset 0030: nop
    ; NOP

    ; Offset 0031: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Multiplication_ByZero()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_ByZero

    ; Offset 0036: nop
    ; NOP

    ; Offset 0037: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Multiplication_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_NegativeNumbers

    ; Offset 003C: nop
    ; NOP

    ; Offset 003D: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Multiplication_MixedSigns()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_MixedSigns

    ; Offset 0042: nop
    ; NOP

    ; Offset 0043: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Division_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Division_PositiveNumbers

    ; Offset 0048: nop
    ; NOP

    ; Offset 0049: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Division_WithRemainder()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Division_WithRemainder

    ; Offset 004E: nop
    ; NOP

    ; Offset 004F: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Division_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Division_NegativeNumbers

    ; Offset 0054: nop
    ; NOP

    ; Offset 0055: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Division_MixedSigns()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Division_MixedSigns

    ; Offset 005A: nop
    ; NOP

    ; Offset 005B: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Remainder_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Remainder_PositiveNumbers

    ; Offset 0060: nop
    ; NOP

    ; Offset 0061: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Remainder_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Remainder_NegativeNumbers

    ; Offset 0066: nop
    ; NOP

    ; Offset 0067: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.BitwiseAnd()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_BitwiseAnd

    ; Offset 006C: nop
    ; NOP

    ; Offset 006D: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.BitwiseOr()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_BitwiseOr

    ; Offset 0072: nop
    ; NOP

    ; Offset 0073: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.BitwiseXor()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_BitwiseXor

    ; Offset 0078: nop
    ; NOP

    ; Offset 0079: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.LeftShift()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_LeftShift

    ; Offset 007E: nop
    ; NOP

    ; Offset 007F: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.RightShift()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_RightShift

    ; Offset 0084: nop
    ; NOP

    ; Offset 0085: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.UnaryMinus()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_UnaryMinus

    ; Offset 008A: nop
    ; NOP

    ; Offset 008B: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.ChainedOperations()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_ChainedOperations

    ; Offset 0090: nop
    ; NOP

    ; Offset 0091: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.DivideByZeroThrows()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_DivideByZeroThrows

    ; Offset 0096: nop
    ; NOP

    ; Offset 0097: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.ModuloByZeroThrows()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_ModuloByZeroThrows

    ; Offset 009C: nop
    ; NOP

    ; Offset 009D: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Program_AllFloatMathTests:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Addition_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Addition_PositiveNumbers

    ; Offset 0006: nop
    ; NOP

    ; Offset 0007: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Addition_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Addition_NegativeNumbers

    ; Offset 000C: nop
    ; NOP

    ; Offset 000D: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Addition_MixedSigns()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Addition_MixedSigns

    ; Offset 0012: nop
    ; NOP

    ; Offset 0013: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Subtraction_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Subtraction_PositiveNumbers

    ; Offset 0018: nop
    ; NOP

    ; Offset 0019: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Subtraction_NegativeResult()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Subtraction_NegativeResult

    ; Offset 001E: nop
    ; NOP

    ; Offset 001F: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Multiplication_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Multiplication_PositiveNumbers

    ; Offset 0024: nop
    ; NOP

    ; Offset 0025: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Multiplication_ByZero()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Multiplication_ByZero

    ; Offset 002A: nop
    ; NOP

    ; Offset 002B: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Multiplication_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Multiplication_NegativeNumbers

    ; Offset 0030: nop
    ; NOP

    ; Offset 0031: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Division_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Division_PositiveNumbers

    ; Offset 0036: nop
    ; NOP

    ; Offset 0037: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Division_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Division_NegativeNumbers

    ; Offset 003C: nop
    ; NOP

    ; Offset 003D: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Division_MixedSigns()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Division_MixedSigns

    ; Offset 0042: nop
    ; NOP

    ; Offset 0043: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Division_ByZeroPositive()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Division_ByZeroPositive

    ; Offset 0048: nop
    ; NOP

    ; Offset 0049: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Division_ByZeroNegative()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Division_ByZeroNegative

    ; Offset 004E: nop
    ; NOP

    ; Offset 004F: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Remainder_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Remainder_PositiveNumbers

    ; Offset 0054: nop
    ; NOP

    ; Offset 0055: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.UnaryMinus()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_UnaryMinus

    ; Offset 005A: nop
    ; NOP

    ; Offset 005B: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Comparison_LessThan()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Comparison_LessThan

    ; Offset 0060: nop
    ; NOP

    ; Offset 0061: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Comparison_GreaterThan()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Comparison_GreaterThan

    ; Offset 0066: nop
    ; NOP

    ; Offset 0067: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Comparison_Equal()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Comparison_Equal

    ; Offset 006C: nop
    ; NOP

    ; Offset 006D: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.SpecialValue_NaN()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_SpecialValue_NaN

    ; Offset 0072: nop
    ; NOP

    ; Offset 0073: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.SpecialValue_Infinity()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_SpecialValue_Infinity

    ; Offset 0078: nop
    ; NOP

    ; Offset 0079: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Sqrt()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Sqrt

    ; Offset 007E: nop
    ; NOP

    ; Offset 007F: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Abs()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Abs

    ; Offset 0084: nop
    ; NOP

    ; Offset 0085: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.ChainedOperations()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_ChainedOperations

    ; Offset 008A: nop
    ; NOP

    ; Offset 008B: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Program_AllDoubleMathTests:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Addition_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Addition_PositiveNumbers

    ; Offset 0006: nop
    ; NOP

    ; Offset 0007: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Addition_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Addition_NegativeNumbers

    ; Offset 000C: nop
    ; NOP

    ; Offset 000D: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Addition_MixedSigns()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Addition_MixedSigns

    ; Offset 0012: nop
    ; NOP

    ; Offset 0013: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Subtraction_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Subtraction_PositiveNumbers

    ; Offset 0018: nop
    ; NOP

    ; Offset 0019: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Subtraction_NegativeResult()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Subtraction_NegativeResult

    ; Offset 001E: nop
    ; NOP

    ; Offset 001F: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Multiplication_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Multiplication_PositiveNumbers

    ; Offset 0024: nop
    ; NOP

    ; Offset 0025: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Multiplication_ByZero()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Multiplication_ByZero

    ; Offset 002A: nop
    ; NOP

    ; Offset 002B: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Multiplication_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Multiplication_NegativeNumbers

    ; Offset 0030: nop
    ; NOP

    ; Offset 0031: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Division_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Division_PositiveNumbers

    ; Offset 0036: nop
    ; NOP

    ; Offset 0037: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Division_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Division_NegativeNumbers

    ; Offset 003C: nop
    ; NOP

    ; Offset 003D: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Division_MixedSigns()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Division_MixedSigns

    ; Offset 0042: nop
    ; NOP

    ; Offset 0043: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Division_ByZeroPositive()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Division_ByZeroPositive

    ; Offset 0048: nop
    ; NOP

    ; Offset 0049: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Division_ByZeroNegative()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Division_ByZeroNegative

    ; Offset 004E: nop
    ; NOP

    ; Offset 004F: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Remainder_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Remainder_PositiveNumbers

    ; Offset 0054: nop
    ; NOP

    ; Offset 0055: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.UnaryMinus()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_UnaryMinus

    ; Offset 005A: nop
    ; NOP

    ; Offset 005B: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Comparison_LessThan()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Comparison_LessThan

    ; Offset 0060: nop
    ; NOP

    ; Offset 0061: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Comparison_GreaterThan()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Comparison_GreaterThan

    ; Offset 0066: nop
    ; NOP

    ; Offset 0067: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Comparison_Equal()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Comparison_Equal

    ; Offset 006C: nop
    ; NOP

    ; Offset 006D: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.SpecialValue_NaN()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_SpecialValue_NaN

    ; Offset 0072: nop
    ; NOP

    ; Offset 0073: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.SpecialValue_Infinity()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_SpecialValue_Infinity

    ; Offset 0078: nop
    ; NOP

    ; Offset 0079: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Sqrt()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Sqrt

    ; Offset 007E: nop
    ; NOP

    ; Offset 007F: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Abs()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Abs

    ; Offset 0084: nop
    ; NOP

    ; Offset 0085: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Pow()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Pow

    ; Offset 008A: nop
    ; NOP

    ; Offset 008B: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Log()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Log

    ; Offset 0090: nop
    ; NOP

    ; Offset 0091: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Trigonometric_Sin()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Trigonometric_Sin

    ; Offset 0096: nop
    ; NOP

    ; Offset 0097: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Trigonometric_Cos()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Trigonometric_Cos

    ; Offset 009C: nop
    ; NOP

    ; Offset 009D: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.ChainedOperations()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_ChainedOperations

    ; Offset 00A2: nop
    ; NOP

    ; Offset 00A3: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Program_AllDecimalMathTests:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Addition_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Addition_PositiveNumbers

    ; Offset 0006: nop
    ; NOP

    ; Offset 0007: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Addition_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Addition_NegativeNumbers

    ; Offset 000C: nop
    ; NOP

    ; Offset 000D: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Addition_MixedSigns()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Addition_MixedSigns

    ; Offset 0012: nop
    ; NOP

    ; Offset 0013: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Subtraction_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Subtraction_PositiveNumbers

    ; Offset 0018: nop
    ; NOP

    ; Offset 0019: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Subtraction_NegativeResult()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Subtraction_NegativeResult

    ; Offset 001E: nop
    ; NOP

    ; Offset 001F: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Multiplication_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Multiplication_PositiveNumbers

    ; Offset 0024: nop
    ; NOP

    ; Offset 0025: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Multiplication_ByZero()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Multiplication_ByZero

    ; Offset 002A: nop
    ; NOP

    ; Offset 002B: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Multiplication_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Multiplication_NegativeNumbers

    ; Offset 0030: nop
    ; NOP

    ; Offset 0031: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Division_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Division_PositiveNumbers

    ; Offset 0036: nop
    ; NOP

    ; Offset 0037: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Division_WithPrecision()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Division_WithPrecision

    ; Offset 003C: nop
    ; NOP

    ; Offset 003D: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Division_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Division_NegativeNumbers

    ; Offset 0042: nop
    ; NOP

    ; Offset 0043: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Division_MixedSigns()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Division_MixedSigns

    ; Offset 0048: nop
    ; NOP

    ; Offset 0049: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Remainder_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Remainder_PositiveNumbers

    ; Offset 004E: nop
    ; NOP

    ; Offset 004F: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Remainder_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Remainder_NegativeNumbers

    ; Offset 0054: nop
    ; NOP

    ; Offset 0055: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.UnaryMinus()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_UnaryMinus

    ; Offset 005A: nop
    ; NOP

    ; Offset 005B: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.UnaryPlus()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_UnaryPlus

    ; Offset 0060: nop
    ; NOP

    ; Offset 0061: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Comparison_LessThan()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Comparison_LessThan

    ; Offset 0066: nop
    ; NOP

    ; Offset 0067: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Comparison_GreaterThan()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Comparison_GreaterThan

    ; Offset 006C: nop
    ; NOP

    ; Offset 006D: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Comparison_Equal()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Comparison_Equal

    ; Offset 0072: nop
    ; NOP

    ; Offset 0073: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Comparison_NotEqual()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Comparison_NotEqual

    ; Offset 0078: nop
    ; NOP

    ; Offset 0079: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Abs()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Abs

    ; Offset 007E: nop
    ; NOP

    ; Offset 007F: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Round_ToNearestEven()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Round_ToNearestEven

    ; Offset 0084: nop
    ; NOP

    ; Offset 0085: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Round_AwayFromZero()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Round_AwayFromZero

    ; Offset 008A: nop
    ; NOP

    ; Offset 008B: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Truncate()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Truncate

    ; Offset 0090: nop
    ; NOP

    ; Offset 0091: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Floor()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Floor

    ; Offset 0096: nop
    ; NOP

    ; Offset 0097: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Ceiling()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Ceiling

    ; Offset 009C: nop
    ; NOP

    ; Offset 009D: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.DivideByZeroThrows()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_DivideByZeroThrows

    ; Offset 00A2: nop
    ; NOP

    ; Offset 00A3: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.ChainedOperations()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_ChainedOperations

    ; Offset 00A8: nop
    ; NOP

    ; Offset 00A9: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.FinancialCalculation_CompoundInterest()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_FinancialCalculation_CompoundInterest

    ; Offset 00AE: nop
    ; NOP

    ; Offset 00AF: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.FinancialCalculation_PercentageIncrease()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_FinancialCalculation_PercentageIncrease

    ; Offset 00B4: nop
    ; NOP

    ; Offset 00B5: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.ConversionFromFloat()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_ConversionFromFloat

    ; Offset 00BA: nop
    ; NOP

    ; Offset 00BB: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.ConversionToFloat()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_ConversionToFloat

    ; Offset 00C0: nop
    ; NOP

    ; Offset 00C1: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Program_AllTypeConversionTests:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.IntToFloat()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_IntToFloat

    ; Offset 0006: nop
    ; NOP

    ; Offset 0007: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.IntToDouble()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_IntToDouble

    ; Offset 000C: nop
    ; NOP

    ; Offset 000D: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.IntToDecimal()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_IntToDecimal

    ; Offset 0012: nop
    ; NOP

    ; Offset 0013: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.FloatToInt()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_FloatToInt

    ; Offset 0018: nop
    ; NOP

    ; Offset 0019: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.FloatToDouble()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_FloatToDouble

    ; Offset 001E: nop
    ; NOP

    ; Offset 001F: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.FloatToDecimal()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_FloatToDecimal

    ; Offset 0024: nop
    ; NOP

    ; Offset 0025: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.DoubleToInt()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_DoubleToInt

    ; Offset 002A: nop
    ; NOP

    ; Offset 002B: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.DoubleToFloat()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_DoubleToFloat

    ; Offset 0030: nop
    ; NOP

    ; Offset 0031: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.DoubleToDecimal()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_DoubleToDecimal

    ; Offset 0036: nop
    ; NOP

    ; Offset 0037: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.DecimalToInt()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_DecimalToInt

    ; Offset 003C: nop
    ; NOP

    ; Offset 003D: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.DecimalToFloat()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_DecimalToFloat

    ; Offset 0042: nop
    ; NOP

    ; Offset 0043: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.DecimalToDouble()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_DecimalToDouble

    ; Offset 0048: nop
    ; NOP

    ; Offset 0049: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.ByteToInt()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_ByteToInt

    ; Offset 004E: nop
    ; NOP

    ; Offset 004F: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.IntToByte_WithOverflow()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_IntToByte_WithOverflow

    ; Offset 0054: nop
    ; NOP

    ; Offset 0055: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.ShortToInt()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_ShortToInt

    ; Offset 005A: nop
    ; NOP

    ; Offset 005B: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.LongToInt()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_LongToInt

    ; Offset 0060: nop
    ; NOP

    ; Offset 0061: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.IntToLong()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_IntToLong

    ; Offset 0066: nop
    ; NOP

    ; Offset 0067: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.NegativeIntToUnsigned()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_NegativeIntToUnsigned

    ; Offset 006C: nop
    ; NOP

    ; Offset 006D: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.ChainedConversions()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_ChainedConversions

    ; Offset 0072: nop
    ; NOP

    ; Offset 0073: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Program_Main:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: call
    ; Call JumpCS.TestMath.Program.AllIntegerMathTests()V
    JSR JumpCS.TestMath.Program_AllIntegerMathTests

    ; Offset 0006: nop
    ; NOP

    ; Offset 0007: call
    ; Call JumpCS.TestMath.Program.AllFloatMathTests()V
    JSR JumpCS.TestMath.Program_AllFloatMathTests

    ; Offset 000C: nop
    ; NOP

    ; Offset 000D: call
    ; Call JumpCS.TestMath.Program.AllDoubleMathTests()V
    JSR JumpCS.TestMath.Program_AllDoubleMathTests

    ; Offset 0012: nop
    ; NOP

    ; Offset 0013: call
    ; Call JumpCS.TestMath.Program.AllDecimalMathTests()V
    JSR JumpCS.TestMath.Program_AllDecimalMathTests

    ; Offset 0018: nop
    ; NOP

    ; Offset 0019: call
    ; Call JumpCS.TestMath.Program.AllTypeConversionTests()V
    JSR JumpCS.TestMath.Program_AllTypeConversionTests

    ; Offset 001E: nop
    ; NOP

    ; Offset 001F: ret
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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_0
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_0:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #5830,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_1
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_1:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0022: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

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
    MOVE.L #10080,D4  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D6         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A2  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A2, lo=D4, mid=D3, hi=D2, sign=D5, scale=D6
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D6      ; Ensure scale is 0-255
    LSL.L #16,D6        ; Shift scale to bits 16-23
    OR.L D6,D7   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_2
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_2:
    MOVE.L D7,(A2)      ; Store flags at offset 0
    MOVE.L D2,4(A2)          ; Store high at offset 4
    MOVE.L D4,8(A2)          ; Store low at offset 8
    MOVE.L D3,12(A2)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A2,D7   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -16(A6),D0  ; Load local.2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A2    ; A2 = address of left operand
    MOVE.L D0,A1  ; A1 = address of right operand
    MOVE.L #1,D6     ; Assume equal
    MOVE.L (A2),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_3
    MOVE.L 4(A2),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_3
    MOVE.L 8(A2),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_3
    MOVE.L 12(A2),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_3
    BRA .Done_L_4
.NotEqual_L_3:
    MOVE.L #0,D6     ; Not equal
.Done_L_4:

    ; Offset 003D: stloc.3
    MOVE.L D6,-16(A6)  ; Store to local 3

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_5
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_5:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #5830,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_6
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_6:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0022: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

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
    MOVE.L #10080,D4  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0030: ldc.i4.1
    MOVE.L #1,D5         ; Load 1

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D6         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A2  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A2, lo=D4, mid=D3, hi=D2, sign=D5, scale=D6
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D6      ; Ensure scale is 0-255
    LSL.L #16,D6        ; Shift scale to bits 16-23
    OR.L D6,D7   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_7
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_7:
    MOVE.L D7,(A2)      ; Store flags at offset 0
    MOVE.L D2,4(A2)          ; Store high at offset 4
    MOVE.L D4,8(A2)          ; Store low at offset 8
    MOVE.L D3,12(A2)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A2,D7   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -16(A6),D0  ; Load local.2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A2    ; A2 = address of left operand
    MOVE.L D0,A1  ; A1 = address of right operand
    MOVE.L #1,D6     ; Assume equal
    MOVE.L (A2),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_8
    MOVE.L 4(A2),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_8
    MOVE.L 8(A2),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_8
    MOVE.L 12(A2),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_8
    BRA .Done_L_9
.NotEqual_L_8:
    MOVE.L #0,D6     ; Not equal
.Done_L_9:

    ; Offset 003D: stloc.3
    MOVE.L D6,-16(A6)  ; Store to local 3

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #10050,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_10
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_10:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #4230,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_11
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_11:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0022: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

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
    MOVE.L #5820,D4  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D6         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A2  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A2, lo=D4, mid=D3, hi=D2, sign=D5, scale=D6
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D6      ; Ensure scale is 0-255
    LSL.L #16,D6        ; Shift scale to bits 16-23
    OR.L D6,D7   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_12
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_12:
    MOVE.L D7,(A2)      ; Store flags at offset 0
    MOVE.L D2,4(A2)          ; Store high at offset 4
    MOVE.L D4,8(A2)          ; Store low at offset 8
    MOVE.L D3,12(A2)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A2,D7   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -16(A6),D0  ; Load local.2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A2    ; A2 = address of left operand
    MOVE.L D0,A1  ; A1 = address of right operand
    MOVE.L #1,D6     ; Assume equal
    MOVE.L (A2),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_13
    MOVE.L 4(A2),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_13
    MOVE.L 8(A2),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_13
    MOVE.L 12(A2),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_13
    BRA .Done_L_14
.NotEqual_L_13:
    MOVE.L #0,D6     ; Not equal
.Done_L_14:

    ; Offset 003D: stloc.3
    MOVE.L D6,-16(A6)  ; Store to local 3

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #10070,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_15
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_15:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #4230,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_16
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_16:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0022: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

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
    MOVE.L #5840,D4  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D6         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A2  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A2, lo=D4, mid=D3, hi=D2, sign=D5, scale=D6
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D6      ; Ensure scale is 0-255
    LSL.L #16,D6        ; Shift scale to bits 16-23
    OR.L D6,D7   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_17
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_17:
    MOVE.L D7,(A2)      ; Store flags at offset 0
    MOVE.L D2,4(A2)          ; Store high at offset 4
    MOVE.L D4,8(A2)          ; Store low at offset 8
    MOVE.L D3,12(A2)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A2,D7   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -16(A6),D0  ; Load local.2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A2    ; A2 = address of left operand
    MOVE.L D0,A1  ; A1 = address of right operand
    MOVE.L #1,D6     ; Assume equal
    MOVE.L (A2),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_18
    MOVE.L 4(A2),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_18
    MOVE.L 8(A2),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_18
    MOVE.L 12(A2),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_18
    BRA .Done_L_19
.NotEqual_L_18:
    MOVE.L #0,D6     ; Not equal
.Done_L_19:

    ; Offset 003D: stloc.3
    MOVE.L D6,-16(A6)  ; Store to local 3

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #4230,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_20
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_20:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #10070,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_21
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_21:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0022: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

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
    MOVE.L #5840,D4  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0030: ldc.i4.1
    MOVE.L #1,D5         ; Load 1

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D6         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A2  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A2, lo=D4, mid=D3, hi=D2, sign=D5, scale=D6
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D6      ; Ensure scale is 0-255
    LSL.L #16,D6        ; Shift scale to bits 16-23
    OR.L D6,D7   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_22
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_22:
    MOVE.L D7,(A2)      ; Store flags at offset 0
    MOVE.L D2,4(A2)          ; Store high at offset 4
    MOVE.L D4,8(A2)          ; Store low at offset 8
    MOVE.L D3,12(A2)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A2,D7   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -16(A6),D0  ; Load local.2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A2    ; A2 = address of left operand
    MOVE.L D0,A1  ; A1 = address of right operand
    MOVE.L #1,D6     ; Assume equal
    MOVE.L (A2),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_23
    MOVE.L 4(A2),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_23
    MOVE.L 8(A2),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_23
    MOVE.L 12(A2),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_23
    BRA .Done_L_24
.NotEqual_L_23:
    MOVE.L #0,D6     ; Not equal
.Done_L_24:

    ; Offset 003D: stloc.3
    MOVE.L D6,-16(A6)  ; Store to local 3

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #1250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_25
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_25:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #720,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_26
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_26:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0022: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0023: call
    ; System.Decimal.op_Multiply (inline)
    ; TODO: D0 * D1

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4
    MOVE.L #9000,D2  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D6         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D2, mid=D3, hi=D4, sign=D5, scale=D6
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D6      ; Ensure scale is 0-255
    LSL.L #16,D6        ; Shift scale to bits 16-23
    OR.L D6,D7   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_27
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_27:
    MOVE.L D7,(A0)      ; Store flags at offset 0
    MOVE.L D4,4(A0)          ; Store high at offset 4
    MOVE.L D2,8(A0)          ; Store low at offset 8
    MOVE.L D3,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D7   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -16(A6),D0  ; Load local.2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A0    ; A0 = address of left operand
    MOVE.L D0,A1  ; A1 = address of right operand
    MOVE.L #1,D6     ; Assume equal
    MOVE.L (A0),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_28
    MOVE.L 4(A0),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_28
    MOVE.L 8(A0),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_28
    MOVE.L 12(A0),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_28
    BRA .Done_L_29
.NotEqual_L_28:
    MOVE.L #0,D6     ; Not equal
.Done_L_29:

    ; Offset 003D: stloc.3
    MOVE.L D6,-16(A6)  ; Store to local 3

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_30
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_30:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0014: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0015: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0016: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0017: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 0018: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_31
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_31:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 001D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 001E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 001F: call
    ; System.Decimal.op_Multiply (inline)
    ; TODO: D0 * D1

    ; Offset 0024: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0025: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0026: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0027: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0028: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0029: ldc.i4.2
    MOVE.L #2,D6         ; Load 2

    ; Offset 002A: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D2, mid=D3, hi=D4, sign=D5, scale=D6
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D6      ; Ensure scale is 0-255
    LSL.L #16,D6        ; Shift scale to bits 16-23
    OR.L D6,D7   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_32
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_32:
    MOVE.L D7,(A0)      ; Store flags at offset 0
    MOVE.L D4,4(A0)          ; Store high at offset 4
    MOVE.L D2,8(A0)          ; Store low at offset 8
    MOVE.L D3,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D7   ; Convert address to data register

    ; Offset 002F: ldloc.2
    MOVE.L -16(A6),D0  ; Load local.2

    ; Offset 0030: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A0    ; A0 = address of left operand
    MOVE.L D0,A1  ; A1 = address of right operand
    MOVE.L #1,D6     ; Assume equal
    MOVE.L (A0),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_33
    MOVE.L 4(A0),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_33
    MOVE.L 8(A0),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_33
    MOVE.L 12(A0),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_33
    BRA .Done_L_34
.NotEqual_L_33:
    MOVE.L #0,D6     ; Not equal
.Done_L_34:

    ; Offset 0035: stloc.3
    MOVE.L D6,-16(A6)  ; Store to local 3

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #1250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_35
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_35:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #720,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_36
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_36:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0022: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0023: call
    ; System.Decimal.op_Multiply (inline)
    ; TODO: D0 * D1

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4
    MOVE.L #9000,D2  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D6         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D2, mid=D3, hi=D4, sign=D5, scale=D6
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D6      ; Ensure scale is 0-255
    LSL.L #16,D6        ; Shift scale to bits 16-23
    OR.L D6,D7   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_37
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_37:
    MOVE.L D7,(A0)      ; Store flags at offset 0
    MOVE.L D4,4(A0)          ; Store high at offset 4
    MOVE.L D2,8(A0)          ; Store low at offset 8
    MOVE.L D3,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D7   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -16(A6),D0  ; Load local.2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A0    ; A0 = address of left operand
    MOVE.L D0,A1  ; A1 = address of right operand
    MOVE.L #1,D6     ; Assume equal
    MOVE.L (A0),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_38
    MOVE.L 4(A0),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_38
    MOVE.L 8(A0),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_38
    MOVE.L 12(A0),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_38
    BRA .Done_L_39
.NotEqual_L_38:
    MOVE.L #0,D6     ; Not equal
.Done_L_39:

    ; Offset 003D: stloc.3
    MOVE.L D6,-16(A6)  ; Store to local 3

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #8400,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_40
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_40:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #700,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_41
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_41:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0022: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0023: call
    ; System.Decimal.op_Division (inline)
    ; TODO: D0 / D1

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4
    MOVE.L #1200,D2  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D6         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D2, mid=D3, hi=D4, sign=D5, scale=D6
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D6      ; Ensure scale is 0-255
    LSL.L #16,D6        ; Shift scale to bits 16-23
    OR.L D6,D7   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_42
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_42:
    MOVE.L D7,(A0)      ; Store flags at offset 0
    MOVE.L D4,4(A0)          ; Store high at offset 4
    MOVE.L D2,8(A0)          ; Store low at offset 8
    MOVE.L D3,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D7   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -16(A6),D0  ; Load local.2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A0    ; A0 = address of left operand
    MOVE.L D0,A1  ; A1 = address of right operand
    MOVE.L #1,D6     ; Assume equal
    MOVE.L (A0),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_43
    MOVE.L 4(A0),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_43
    MOVE.L 8(A0),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_43
    MOVE.L 12(A0),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_43
    BRA .Done_L_44
.NotEqual_L_43:
    MOVE.L #0,D6     ; Not equal
.Done_L_44:

    ; Offset 003D: stloc.3
    MOVE.L D6,-16(A6)  ; Store to local 3

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #8500,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_45
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_45:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #700,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_46
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_46:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0022: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0023: call
    ; System.Decimal.op_Division (inline)
    ; TODO: D0 / D1

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4
    MOVE.L #1859874231,D2  ; Load constant

    ; Offset 002E: ldc.i4
    MOVE.L #-1188237158,D3  ; Load constant

    ; Offset 0033: ldc.i4
    MOVE.L #658265604,D4  ; Load constant

    ; Offset 0038: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0039: ldc.i4.s
    MOVE.L #27,D6  ; Load short constant

    ; Offset 003B: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D2, mid=D3, hi=D4, sign=D5, scale=D6
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D6      ; Ensure scale is 0-255
    LSL.L #16,D6        ; Shift scale to bits 16-23
    OR.L D6,D7   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_47
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_47:
    MOVE.L D7,(A0)      ; Store flags at offset 0
    MOVE.L D4,4(A0)          ; Store high at offset 4
    MOVE.L D2,8(A0)          ; Store low at offset 8
    MOVE.L D3,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D7   ; Convert address to data register

    ; Offset 0040: ldloc.2
    MOVE.L -16(A6),D0  ; Load local.2

    ; Offset 0041: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A0    ; A0 = address of left operand
    MOVE.L D0,A1  ; A1 = address of right operand
    MOVE.L #1,D6     ; Assume equal
    MOVE.L (A0),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_48
    MOVE.L 4(A0),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_48
    MOVE.L 8(A0),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_48
    MOVE.L 12(A0),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_48
    BRA .Done_L_49
.NotEqual_L_48:
    MOVE.L #0,D6     ; Not equal
.Done_L_49:

    ; Offset 0046: stloc.3
    MOVE.L D6,-16(A6)  ; Store to local 3

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #8400,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_50
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_50:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #700,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_51
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_51:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0022: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0023: call
    ; System.Decimal.op_Division (inline)
    ; TODO: D0 / D1

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4
    MOVE.L #1200,D2  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D6         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D2, mid=D3, hi=D4, sign=D5, scale=D6
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D6      ; Ensure scale is 0-255
    LSL.L #16,D6        ; Shift scale to bits 16-23
    OR.L D6,D7   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_52
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_52:
    MOVE.L D7,(A0)      ; Store flags at offset 0
    MOVE.L D4,4(A0)          ; Store high at offset 4
    MOVE.L D2,8(A0)          ; Store low at offset 8
    MOVE.L D3,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D7   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -16(A6),D0  ; Load local.2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A0    ; A0 = address of left operand
    MOVE.L D0,A1  ; A1 = address of right operand
    MOVE.L #1,D6     ; Assume equal
    MOVE.L (A0),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_53
    MOVE.L 4(A0),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_53
    MOVE.L 8(A0),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_53
    MOVE.L 12(A0),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_53
    BRA .Done_L_54
.NotEqual_L_53:
    MOVE.L #0,D6     ; Not equal
.Done_L_54:

    ; Offset 003D: stloc.3
    MOVE.L D6,-16(A6)  ; Store to local 3

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #8400,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_55
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_55:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #700,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_56
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_56:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0022: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0023: call
    ; System.Decimal.op_Division (inline)
    ; TODO: D0 / D1

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4
    MOVE.L #1200,D2  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0030: ldc.i4.1
    MOVE.L #1,D5         ; Load 1

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D6         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D2, mid=D3, hi=D4, sign=D5, scale=D6
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D6      ; Ensure scale is 0-255
    LSL.L #16,D6        ; Shift scale to bits 16-23
    OR.L D6,D7   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_57
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_57:
    MOVE.L D7,(A0)      ; Store flags at offset 0
    MOVE.L D4,4(A0)          ; Store high at offset 4
    MOVE.L D2,8(A0)          ; Store low at offset 8
    MOVE.L D3,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D7   ; Convert address to data register

    ; Offset 0037: ldloc.2
    MOVE.L -16(A6),D0  ; Load local.2

    ; Offset 0038: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A0    ; A0 = address of left operand
    MOVE.L D0,A1  ; A1 = address of right operand
    MOVE.L #1,D6     ; Assume equal
    MOVE.L (A0),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_58
    MOVE.L 4(A0),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_58
    MOVE.L 8(A0),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_58
    MOVE.L 12(A0),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_58
    BRA .Done_L_59
.NotEqual_L_58:
    MOVE.L #0,D6     ; Not equal
.Done_L_59:

    ; Offset 003D: stloc.3
    MOVE.L D6,-16(A6)  ; Store to local 3

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #8500,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_60
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_60:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #700,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_61
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_61:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0022: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0023: call
    ; System.Decimal.op_Modulus (inline)
    ; TODO: D0 % D1

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4.s
    MOVE.L #100,D2  ; Load short constant

    ; Offset 002B: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 002C: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 002D: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 002E: ldc.i4.2
    MOVE.L #2,D6         ; Load 2

    ; Offset 002F: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D2, mid=D3, hi=D4, sign=D5, scale=D6
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D6      ; Ensure scale is 0-255
    LSL.L #16,D6        ; Shift scale to bits 16-23
    OR.L D6,D7   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_62
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_62:
    MOVE.L D7,(A0)      ; Store flags at offset 0
    MOVE.L D4,4(A0)          ; Store high at offset 4
    MOVE.L D2,8(A0)          ; Store low at offset 8
    MOVE.L D3,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D7   ; Convert address to data register

    ; Offset 0034: ldloc.2
    MOVE.L -16(A6),D0  ; Load local.2

    ; Offset 0035: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A0    ; A0 = address of left operand
    MOVE.L D0,A1  ; A1 = address of right operand
    MOVE.L #1,D6     ; Assume equal
    MOVE.L (A0),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_63
    MOVE.L 4(A0),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_63
    MOVE.L 8(A0),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_63
    MOVE.L 12(A0),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_63
    BRA .Done_L_64
.NotEqual_L_63:
    MOVE.L #0,D6     ; Not equal
.Done_L_64:

    ; Offset 003A: stloc.3
    MOVE.L D6,-16(A6)  ; Store to local 3

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #8500,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_65
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_65:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #700,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_66
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_66:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0022: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0023: call
    ; System.Decimal.op_Modulus (inline)
    ; TODO: D0 % D1

    ; Offset 0028: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0029: ldc.i4.s
    MOVE.L #100,D2  ; Load short constant

    ; Offset 002B: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 002C: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 002D: ldc.i4.1
    MOVE.L #1,D5         ; Load 1

    ; Offset 002E: ldc.i4.2
    MOVE.L #2,D6         ; Load 2

    ; Offset 002F: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D2, mid=D3, hi=D4, sign=D5, scale=D6
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D6      ; Ensure scale is 0-255
    LSL.L #16,D6        ; Shift scale to bits 16-23
    OR.L D6,D7   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_67
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_67:
    MOVE.L D7,(A0)      ; Store flags at offset 0
    MOVE.L D4,4(A0)          ; Store high at offset 4
    MOVE.L D2,8(A0)          ; Store low at offset 8
    MOVE.L D3,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D7   ; Convert address to data register

    ; Offset 0034: ldloc.2
    MOVE.L -16(A6),D0  ; Load local.2

    ; Offset 0035: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A0    ; A0 = address of left operand
    MOVE.L D0,A1  ; A1 = address of right operand
    MOVE.L #1,D6     ; Assume equal
    MOVE.L (A0),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_68
    MOVE.L 4(A0),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_68
    MOVE.L 8(A0),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_68
    MOVE.L 12(A0),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_68
    BRA .Done_L_69
.NotEqual_L_68:
    MOVE.L #0,D6     ; Not equal
.Done_L_69:

    ; Offset 003A: stloc.3
    MOVE.L D6,-16(A6)  ; Store to local 3

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_70
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_70:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0012: call
    ; System.Decimal.op_UnaryNegation (inline)
    NEG.L D0     ; Negate
    MOVE.L D0,D1

    ; Offset 0017: stloc.1
    MOVE.L D1,-8(A6)   ; Store to local 1

    ; Offset 0018: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 001D: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001E: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001F: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

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
    BEQ .SkipNegative_L_71
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_71:
    MOVE.L D6,(A0)      ; Store flags at offset 0
    MOVE.L D3,4(A0)          ; Store high at offset 4
    MOVE.L D1,8(A0)          ; Store low at offset 8
    MOVE.L D2,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D7   ; Convert address to data register

    ; Offset 0026: ldloc.1
    MOVE.L -12(A6),D6  ; Load local.1

    ; Offset 0027: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A0    ; A0 = address of left operand
    MOVE.L D6,A1  ; A1 = address of right operand
    MOVE.L #1,D7     ; Assume equal
    MOVE.L (A0),D6    ; Load left flags
    CMP.L (A1),D6    ; Compare flags
    BNE .NotEqual_L_72
    MOVE.L 4(A0),D6   ; Load left high
    CMP.L 4(A1),D6   ; Compare high
    BNE .NotEqual_L_72
    MOVE.L 8(A0),D6   ; Load left low
    CMP.L 8(A1),D6   ; Compare low
    BNE .NotEqual_L_72
    MOVE.L 12(A0),D6  ; Load left mid
    CMP.L 12(A1),D6  ; Compare mid
    BNE .NotEqual_L_72
    BRA .Done_L_73
.NotEqual_L_72:
    MOVE.L #0,D7     ; Not equal
.Done_L_73:

    ; Offset 002C: stloc.2
    MOVE.L D7,-12(A6)  ; Store to local 2

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_74
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_74:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0012: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0013: ldc.i4
    MOVE.L #4250,D0  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D3         ; Load 1

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 001C: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D0, mid=D1, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_75
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_75:
    MOVE.L D5,(A0)      ; Store flags at offset 0
    MOVE.L D2,4(A0)          ; Store high at offset 4
    MOVE.L D0,8(A0)          ; Store low at offset 8
    MOVE.L D1,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D6   ; Convert address to data register

    ; Offset 0021: ldloc.1
    MOVE.L -12(A6),D5  ; Load local.1

    ; Offset 0022: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D6,A0    ; A0 = address of left operand
    MOVE.L D5,A1  ; A1 = address of right operand
    MOVE.L #1,D7     ; Assume equal
    MOVE.L (A0),D7    ; Load left flags
    CMP.L (A1),D7    ; Compare flags
    BNE .NotEqual_L_76
    MOVE.L 4(A0),D7   ; Load left high
    CMP.L 4(A1),D7   ; Compare high
    BNE .NotEqual_L_76
    MOVE.L 8(A0),D7   ; Load left low
    CMP.L 8(A1),D7   ; Compare low
    BNE .NotEqual_L_76
    MOVE.L 12(A0),D7  ; Load left mid
    CMP.L 12(A1),D7  ; Compare mid
    BNE .NotEqual_L_76
    BRA .Done_L_77
.NotEqual_L_76:
    MOVE.L #0,D7     ; Not equal
.Done_L_77:

    ; Offset 0027: stloc.2
    MOVE.L D7,-12(A6)  ; Store to local 2

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_78
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_78:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #5830,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_79
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_79:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0022: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #5830,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_83
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_83:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_84
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_84:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0022: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_87
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_87:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_88
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_88:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0022: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_91
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_91:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #4251,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_92
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_92:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0022: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_95
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_95:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0012: call
    ; Decimal.Abs(D0)
    ; TODO: Implement decimal absolute value
    MOVE.L D0,D1

    ; Offset 0017: stloc.1
    MOVE.L D1,-8(A6)   ; Store to local 1

    ; Offset 0018: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 001D: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 001E: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001F: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0020: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 0021: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D1, mid=D0, hi=D2, sign=D3, scale=D4
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D5   ; Set scale in flags
    TST.L D3        ; Check if negative
    BEQ .SkipNegative_L_96
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_96:
    MOVE.L D5,(A0)      ; Store flags at offset 0
    MOVE.L D2,4(A0)          ; Store high at offset 4
    MOVE.L D1,8(A0)          ; Store low at offset 8
    MOVE.L D0,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D6   ; Convert address to data register

    ; Offset 0026: ldloc.1
    MOVE.L -12(A6),D5  ; Load local.1

    ; Offset 0027: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D6,A0    ; A0 = address of left operand
    MOVE.L D5,A1  ; A1 = address of right operand
    MOVE.L #1,D7     ; Assume equal
    MOVE.L (A0),D7    ; Load left flags
    CMP.L (A1),D7    ; Compare flags
    BNE .NotEqual_L_97
    MOVE.L 4(A0),D7   ; Load left high
    CMP.L 4(A1),D7   ; Compare high
    BNE .NotEqual_L_97
    MOVE.L 8(A0),D7   ; Load left low
    CMP.L 8(A1),D7   ; Compare low
    BNE .NotEqual_L_97
    MOVE.L 12(A0),D7  ; Load left mid
    CMP.L 12(A1),D7  ; Compare mid
    BNE .NotEqual_L_97
    BRA .Done_L_98
.NotEqual_L_97:
    MOVE.L #0,D7     ; Not equal
.Done_L_98:

    ; Offset 002C: stloc.2
    MOVE.L D7,-12(A6)  ; Store to local 2

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #4255,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_99
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_99:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0012: ldc.i4.1
    MOVE.L #1,D1         ; Load 1

    ; Offset 0013: call
    ; System.Math.Round (inline) - 2 parameters
    ; System.Decimal.Round(D0, D1) - round to D1 places
    ; Stub implementation: return decimal unchanged
    ; (Proper rounding would require scale adjustment in flags word)
    MOVE.L D0,D2

    ; Offset 0018: stloc.1
    MOVE.L D2,-8(A6)   ; Store to local 1

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
    MOVE.L A0,D7   ; Convert address to data register

    ; Offset 0027: ldloc.1
    MOVE.L -12(A6),D0  ; Load local.1

    ; Offset 0028: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A0    ; A0 = address of left operand
    MOVE.L D0,A1  ; A1 = address of right operand
    MOVE.L #1,D6     ; Assume equal
    MOVE.L (A0),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_101
    MOVE.L 4(A0),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_101
    MOVE.L 8(A0),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_101
    MOVE.L 12(A0),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_101
    BRA .Done_L_102
.NotEqual_L_101:
    MOVE.L #0,D6     ; Not equal
.Done_L_102:

    ; Offset 002D: stloc.2
    MOVE.L D6,-12(A6)  ; Store to local 2

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #4255,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_103
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_103:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0012: ldc.i4.1
    MOVE.L #1,D1         ; Load 1

    ; Offset 0013: ldc.i4.1
    MOVE.L #1,D2         ; Load 1

    ; Offset 0014: call
    ; System.Math.Round (inline) - 3 parameters
    ; System.Decimal.Round(D0, D1, mode=D2)
    ; Stub: return decimal unchanged
    MOVE.L D0,D3

    ; Offset 0019: stloc.1
    MOVE.L D3,-8(A6)   ; Store to local 1

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
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D7      ; Ensure scale is 0-255
    LSL.L #16,D7        ; Shift scale to bits 16-23
    OR.L D7,D7   ; Set scale in flags
    TST.L D6        ; Check if negative
    BEQ .SkipNegative_L_104
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_104:
    MOVE.L D7,(A0)      ; Store flags at offset 0
    MOVE.L D5,4(A0)          ; Store high at offset 4
    MOVE.L D3,8(A0)          ; Store low at offset 8
    MOVE.L D4,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D6   ; Convert address to data register

    ; Offset 0028: ldloc.1
    MOVE.L -12(A6),D7  ; Load local.1

    ; Offset 0029: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D6,A0    ; A0 = address of left operand
    MOVE.L D7,A1  ; A1 = address of right operand
    MOVE.L #1,D5     ; Assume equal
    MOVE.L (A0),D4    ; Load left flags
    CMP.L (A1),D4    ; Compare flags
    BNE .NotEqual_L_105
    MOVE.L 4(A0),D4   ; Load left high
    CMP.L 4(A1),D4   ; Compare high
    BNE .NotEqual_L_105
    MOVE.L 8(A0),D4   ; Load left low
    CMP.L 8(A1),D4   ; Compare low
    BNE .NotEqual_L_105
    MOVE.L 12(A0),D4  ; Load left mid
    CMP.L 12(A1),D4  ; Compare mid
    BNE .NotEqual_L_105
    BRA .Done_L_106
.NotEqual_L_105:
    MOVE.L #0,D5     ; Not equal
.Done_L_106:

    ; Offset 002E: stloc.2
    MOVE.L D5,-12(A6)  ; Store to local 2

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #4297,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_107
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_107:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0012: call
    ; Truncate - stub (return value unchanged)

    ; Offset 0017: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0018: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 001A: newobj
    ; System.Decimal newobj - create new instance (1 parameters)
    ; TODO: Decimal newobj with 1 parameters (expected 5)

    ; Offset 001F: ldloc.1
    MOVE.L -12(A6),D2  ; Load local.1

    ; Offset 0020: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D1,A0    ; A0 = address of left operand
    MOVE.L D2,A1  ; A1 = address of right operand
    MOVE.L #1,D3     ; Assume equal
    MOVE.L (A0),D4    ; Load left flags
    CMP.L (A1),D4    ; Compare flags
    BNE .NotEqual_L_108
    MOVE.L 4(A0),D4   ; Load left high
    CMP.L 4(A1),D4   ; Compare high
    BNE .NotEqual_L_108
    MOVE.L 8(A0),D4   ; Load left low
    CMP.L 8(A1),D4   ; Compare low
    BNE .NotEqual_L_108
    MOVE.L 12(A0),D4  ; Load left mid
    CMP.L 12(A1),D4  ; Compare mid
    BNE .NotEqual_L_108
    BRA .Done_L_109
.NotEqual_L_108:
    MOVE.L #0,D3     ; Not equal
.Done_L_109:

    ; Offset 0025: stloc.2
    MOVE.L D3,-12(A6)  ; Store to local 2

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #4297,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_110
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_110:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0012: call
    ; Floor - stub (return value unchanged)

    ; Offset 0017: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0018: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 001A: newobj
    ; System.Decimal newobj - create new instance (1 parameters)
    ; TODO: Decimal newobj with 1 parameters (expected 5)

    ; Offset 001F: ldloc.1
    MOVE.L -12(A6),D2  ; Load local.1

    ; Offset 0020: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D1,A0    ; A0 = address of left operand
    MOVE.L D2,A1  ; A1 = address of right operand
    MOVE.L #1,D3     ; Assume equal
    MOVE.L (A0),D4    ; Load left flags
    CMP.L (A1),D4    ; Compare flags
    BNE .NotEqual_L_111
    MOVE.L 4(A0),D4   ; Load left high
    CMP.L 4(A1),D4   ; Compare high
    BNE .NotEqual_L_111
    MOVE.L 8(A0),D4   ; Load left low
    CMP.L 8(A1),D4   ; Compare low
    BNE .NotEqual_L_111
    MOVE.L 12(A0),D4  ; Load left mid
    CMP.L 12(A1),D4  ; Compare mid
    BNE .NotEqual_L_111
    BRA .Done_L_112
.NotEqual_L_111:
    MOVE.L #0,D3     ; Not equal
.Done_L_112:

    ; Offset 0025: stloc.2
    MOVE.L D3,-12(A6)  ; Store to local 2

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #4201,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_113
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_113:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0012: call
    ; Ceiling - stub (return value unchanged)

    ; Offset 0017: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0018: ldc.i4.s
    MOVE.L #43,D0  ; Load short constant

    ; Offset 001A: newobj
    ; System.Decimal newobj - create new instance (1 parameters)
    ; TODO: Decimal newobj with 1 parameters (expected 5)

    ; Offset 001F: ldloc.1
    MOVE.L -12(A6),D2  ; Load local.1

    ; Offset 0020: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D1,A0    ; A0 = address of left operand
    MOVE.L D2,A1  ; A1 = address of right operand
    MOVE.L #1,D3     ; Assume equal
    MOVE.L (A0),D4    ; Load left flags
    CMP.L (A1),D4    ; Compare flags
    BNE .NotEqual_L_114
    MOVE.L 4(A0),D4   ; Load left high
    CMP.L 4(A1),D4   ; Compare high
    BNE .NotEqual_L_114
    MOVE.L 8(A0),D4   ; Load left low
    CMP.L 8(A1),D4   ; Compare low
    BNE .NotEqual_L_114
    MOVE.L 12(A0),D4  ; Load left mid
    CMP.L 12(A1),D4  ; Compare mid
    BNE .NotEqual_L_114
    BRA .Done_L_115
.NotEqual_L_114:
    MOVE.L #0,D3     ; Not equal
.Done_L_115:

    ; Offset 0025: stloc.2
    MOVE.L D3,-12(A6)  ; Store to local 2

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_116
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_116:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0014: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0015: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0016: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0017: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 0018: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_117
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_117:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 001D: ldc.i4.1
    MOVE.L #1,D0         ; Load 1

    ; Offset 001E: stloc.2
    MOVE.L D0,-12(A6)  ; Store to local 2

    ; Offset 001F: nop
    ; NOP

    ; Offset 0020: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0021: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0022: call
    ; System.Decimal.op_Division (inline)
    ; TODO: D0 / D1

    ; Offset 0027: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 0028: nop
    ; NOP

    ; Offset 0029: leave.s
    BRA L_0032  ; leave - exit exception handler

    ; Offset 002B: pop
    ; WARNING: Pop on empty stack

    ; Offset 002C: nop
    ; NOP

    ; Offset 002D: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 002E: stloc.2
    MOVE.L D0,-12(A6)  ; Store to local 2

    ; Offset 002F: nop
    ; NOP

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #1050,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_118
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_118:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #2030,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_119
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_119:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloca.s
    LEA -16(A6),A0  ; Load address of local.2
    MOVE.L A0,D0

    ; Offset 0023: ldc.i4
    MOVE.L #300,D1  ; Load constant

    ; Offset 0028: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0029: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 002A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 002B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 002C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_120
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_120:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0031: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0032: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

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
    MOVE.L -16(A6),D3  ; Load local.2

    ; Offset 0039: call
    ; System.Decimal.op_Multiply (inline)
    ; TODO: D4 * D3

    ; Offset 003E: ldc.i4
    MOVE.L #520,D5  ; Load constant

    ; Offset 0043: ldc.i4.0
    CLR.L D6             ; Load 0

    ; Offset 0044: ldc.i4.0
    CLR.L D7             ; Load 0

    ; Offset 0045: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0046: ldc.i4.2
    MOVE.L #2,D3         ; Load 2

    ; Offset 0047: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A2  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A2, lo=D5, mid=D6, hi=D7, sign=D4, scale=D3
    CLR.L D1           ; Clear flags
    AND.L #0xFF,D3      ; Ensure scale is 0-255
    LSL.L #16,D3        ; Shift scale to bits 16-23
    OR.L D3,D1   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_121
    OR.L #0x80000000,D1 ; Set sign bit if negative
.SkipNegative_L_121:
    MOVE.L D1,(A2)      ; Store flags at offset 0
    MOVE.L D7,4(A2)          ; Store high at offset 4
    MOVE.L D5,8(A2)          ; Store low at offset 8
    MOVE.L D6,12(A2)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A2,D0   ; Convert address to data register

    ; Offset 004C: call
    ; System.Decimal.op_Subtraction (inline)
    ; System.Decimal op_Subtraction inline
    MOVE.L D2,A2    ; A2 = address of left operand
    MOVE.L D0,A1  ; A1 = address of right operand
    LEA -16(A6),A0        ; A0 = address of result
    MOVE.L 8(A2),D1   ; Load left low
    MOVE.L 8(A1),D7  ; Load right low
    SUB.L D7,D1           ; Subtract low parts
    MOVE.L D1,8(A0) ; Store result low (address preserved)
    MOVE.L 12(A2),D1  ; Load left mid
    MOVE.L 12(A1),D7 ; Load right mid
    SUBX.L D7,D1          ; Subtract mid parts with borrow
    MOVE.L D1,12(A0) ; Store result mid (address preserved)
    MOVE.L 4(A2),D1   ; Load left high
    MOVE.L 4(A1),D7  ; Load right high
    SUBX.L D7,D1          ; Subtract high parts with borrow
    MOVE.L D1,4(A0) ; Store result high (address preserved)
    MOVE.L (A2),D1    ; Load left flags
    MOVE.L D1,(A0)  ; Store result flags (address preserved)
    MOVE.L A0,D6 ; Convert address to data register for return

    ; Offset 0051: stloc.3
    MOVE.L D6,-16(A6)  ; Store to local 3

    ; Offset 0052: ldc.i4
    MOVE.L #8720,D6  ; Load constant

    ; Offset 0057: ldc.i4.0
    CLR.L D7             ; Load 0

    ; Offset 0058: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0059: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 005A: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 005B: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D6, mid=D7, hi=D1, sign=D5, scale=D4
    CLR.L D3           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D3   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_122
    OR.L #0x80000000,D3 ; Set sign bit if negative
.SkipNegative_L_122:
    MOVE.L D3,(A0)      ; Store flags at offset 0
    MOVE.L D1,4(A0)          ; Store high at offset 4
    MOVE.L D6,8(A0)          ; Store low at offset 8
    MOVE.L D7,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D2   ; Convert address to data register

    ; Offset 0060: ldloc.3
    MOVE.L -20(A6),D3  ; Load local.3

    ; Offset 0061: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D2,A0    ; A0 = address of left operand
    MOVE.L D3,A1  ; A1 = address of right operand
    MOVE.L #1,D1     ; Assume equal
    MOVE.L (A0),D0    ; Load left flags
    CMP.L (A1),D0    ; Compare flags
    BNE .NotEqual_L_123
    MOVE.L 4(A0),D0   ; Load left high
    CMP.L 4(A1),D0   ; Compare high
    BNE .NotEqual_L_123
    MOVE.L 8(A0),D0   ; Load left low
    CMP.L 8(A1),D0   ; Compare low
    BNE .NotEqual_L_123
    MOVE.L 12(A0),D0  ; Load left mid
    CMP.L 12(A1),D0  ; Compare mid
    BNE .NotEqual_L_123
    BRA .Done_L_124
.NotEqual_L_123:
    MOVE.L #0,D1     ; Not equal
.Done_L_124:

    ; Offset 0066: stloc.s
    MOVE.L D1,-20(A6)  ; Store to local 4

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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #100000,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_125
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_125:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4.5
    MOVE.L #5,D1         ; Load 5

    ; Offset 0014: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0015: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0016: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0017: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 0018: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_126
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_126:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 001D: ldloca.s
    LEA -16(A6),A0  ; Load address of local.2
    MOVE.L A0,D0

    ; Offset 001F: ldc.i4
    MOVE.L #200,D1  ; Load constant

    ; Offset 0024: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0025: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0026: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0027: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 0028: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_127
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_127:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 002D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 002E: ldsfld
    MOVE.L STATIC_Decimal_One,D1  ; Load static field Decimal.One

    ; Offset 0033: ldloc.1
    MOVE.L -12(A6),D2  ; Load local.1

    ; Offset 0034: ldloc.2
    MOVE.L -16(A6),D3  ; Load local.2

    ; Offset 0035: call
    ; System.Decimal.op_Multiply (inline)
    ; TODO: D2 * D3

    ; Offset 003A: call
    ; System.Decimal.op_Addition (inline)
    ; System.Decimal op_Addition inline
    MOVE.L D1,A0    ; A0 = address of left operand
    MOVE.L D4,A1  ; A1 = address of right operand
    LEA -16(A6),A2        ; A2 = address of result
    MOVE.L 8(A0),D5   ; Load left low
    MOVE.L 8(A1),D6  ; Load right low
    ADD.L D6,D5           ; Add low parts
    MOVE.L D5,8(A2) ; Store result low (address preserved)
    MOVE.L 12(A0),D5  ; Load left mid
    MOVE.L 12(A1),D6 ; Load right mid
    ADDX.L D6,D5          ; Add mid parts with carry
    MOVE.L D5,12(A2) ; Store result mid (address preserved)
    MOVE.L 4(A0),D5   ; Load left high
    MOVE.L 4(A1),D6  ; Load right high
    ADDX.L D6,D5          ; Add high parts with carry
    MOVE.L D5,4(A2) ; Store result high (address preserved)
    MOVE.L (A0),D5    ; Load left flags
    MOVE.L D5,(A2)  ; Store result flags (address preserved)
    MOVE.L A2,D7 ; Convert address to data register for return

    ; Offset 003F: call
    ; System.Decimal.op_Multiply (inline)
    ; TODO: D0 * D7

    ; Offset 0044: stloc.3
    MOVE.L D6,-16(A6)  ; Store to local 3

    ; Offset 0045: ldc.i4
    MOVE.L #110000,D6  ; Load constant

    ; Offset 004A: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 004B: ldc.i4.0
    CLR.L D7             ; Load 0

    ; Offset 004C: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 004D: ldc.i4.2
    MOVE.L #2,D3         ; Load 2

    ; Offset 004E: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A2  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A2, lo=D6, mid=D5, hi=D7, sign=D4, scale=D3
    CLR.L D2           ; Clear flags
    AND.L #0xFF,D3      ; Ensure scale is 0-255
    LSL.L #16,D3        ; Shift scale to bits 16-23
    OR.L D3,D2   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_128
    OR.L #0x80000000,D2 ; Set sign bit if negative
.SkipNegative_L_128:
    MOVE.L D2,(A2)      ; Store flags at offset 0
    MOVE.L D7,4(A2)          ; Store high at offset 4
    MOVE.L D6,8(A2)          ; Store low at offset 8
    MOVE.L D5,12(A2)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A2,D1   ; Convert address to data register

    ; Offset 0053: ldloc.3
    MOVE.L -20(A6),D2  ; Load local.3

    ; Offset 0054: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D1,A2    ; A2 = address of left operand
    MOVE.L D2,A1  ; A1 = address of right operand
    MOVE.L #1,D0     ; Assume equal
    MOVE.L (A2),D7    ; Load left flags
    CMP.L (A1),D7    ; Compare flags
    BNE .NotEqual_L_129
    MOVE.L 4(A2),D7   ; Load left high
    CMP.L 4(A1),D7   ; Compare high
    BNE .NotEqual_L_129
    MOVE.L 8(A2),D7   ; Load left low
    CMP.L 8(A1),D7   ; Compare low
    BNE .NotEqual_L_129
    MOVE.L 12(A2),D7  ; Load left mid
    CMP.L 12(A1),D7  ; Compare mid
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
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #20000,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_131
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_131:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -12(A6),A0  ; Load address of local.1
    MOVE.L A0,D0

    ; Offset 0013: ldc.i4
    MOVE.L #1500,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_132
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_132:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0022: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

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
    MOVE.L -8(A6),D5  ; Load local.0

    ; Offset 0036: ldloc.2
    MOVE.L -16(A6),D6  ; Load local.2

    ; Offset 0037: call
    ; System.Decimal.op_Addition (inline)
    ; System.Decimal op_Addition inline
    MOVE.L D5,A0    ; A0 = address of left operand
    MOVE.L D6,A1  ; A1 = address of right operand
    LEA -16(A6),A2        ; A2 = address of result
    MOVE.L 8(A0),D7   ; Load left low
    MOVE.L 8(A1),D7  ; Load right low
    ADD.L D7,D7           ; Add low parts
    MOVE.L D7,8(A2) ; Store result low (address preserved)
    MOVE.L 12(A0),D7  ; Load left mid
    MOVE.L 12(A1),D7 ; Load right mid
    ADDX.L D7,D7          ; Add mid parts with carry
    MOVE.L D7,12(A2) ; Store result mid (address preserved)
    MOVE.L 4(A0),D7   ; Load left high
    MOVE.L 4(A1),D7  ; Load right high
    ADDX.L D7,D7          ; Add high parts with carry
    MOVE.L D7,4(A2) ; Store result high (address preserved)
    MOVE.L (A0),D7    ; Load left flags
    MOVE.L D7,(A2)  ; Store result flags (address preserved)
    MOVE.L A2,D6 ; Convert address to data register for return

    ; Offset 003C: stloc.3
    MOVE.L D6,-16(A6)  ; Store to local 3

    ; Offset 003D: ldc.i4
    MOVE.L #23000,D6  ; Load constant

    ; Offset 0042: ldc.i4.0
    CLR.L D7             ; Load 0

    ; Offset 0043: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 0044: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0045: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 0046: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A2  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A2, lo=D6, mid=D7, hi=D0, sign=D5, scale=D4
    CLR.L D3           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D3   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_133
    OR.L #0x80000000,D3 ; Set sign bit if negative
.SkipNegative_L_133:
    MOVE.L D3,(A2)      ; Store flags at offset 0
    MOVE.L D0,4(A2)          ; Store high at offset 4
    MOVE.L D6,8(A2)          ; Store low at offset 8
    MOVE.L D7,12(A2)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A2,D2   ; Convert address to data register

    ; Offset 004B: ldloc.3
    MOVE.L -20(A6),D3  ; Load local.3

    ; Offset 004C: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D2,A2    ; A2 = address of left operand
    MOVE.L D3,A1  ; A1 = address of right operand
    MOVE.L #1,D1     ; Assume equal
    MOVE.L (A2),D0    ; Load left flags
    CMP.L (A1),D0    ; Compare flags
    BNE .NotEqual_L_134
    MOVE.L 4(A2),D0   ; Load left high
    CMP.L 4(A1),D0   ; Compare high
    BNE .NotEqual_L_134
    MOVE.L 8(A2),D0   ; Load left low
    CMP.L 8(A1),D0   ; Compare low
    BNE .NotEqual_L_134
    MOVE.L 12(A2),D0  ; Load left mid
    CMP.L 12(A1),D0  ; Compare mid
    BNE .NotEqual_L_134
    BRA .Done_L_135
.NotEqual_L_134:
    MOVE.L #0,D1     ; Not equal
.Done_L_135:

    ; Offset 0051: stloc.s
    MOVE.L D1,-20(A6)  ; Store to local 4

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
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: call
    ; System.Decimal.op_Explicit (inline)
    ; Decimal.op_Explicit (inline)
    MOVE.L D0,D0       ; Decimal.op_Explicit: convert from decimal (simplified)

    ; Offset 000D: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D0  ; Load local.1

    ; Offset 000F: ldc.i4
    MOVE.L #425,D1  ; Load constant

    ; Offset 0014: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0015: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0016: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0017: ldc.i4.1
    MOVE.L #1,D5         ; Load 1

    ; Offset 0018: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D5   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_136
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_136:
    MOVE.L D5,(A0)      ; Store flags at offset 0
    MOVE.L D3,4(A0)          ; Store high at offset 4
    MOVE.L D1,8(A0)          ; Store low at offset 8
    MOVE.L D2,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D6   ; Convert address to data register

    ; Offset 001D: call
    ; System.Decimal.op_Subtraction (inline)
    ; System.Decimal op_Subtraction inline
    MOVE.L D0,A0    ; A0 = address of left operand
    MOVE.L D6,A1  ; A1 = address of right operand
    LEA -16(A6),A2        ; A2 = address of result
    MOVE.L 8(A0),D5   ; Load left low
    MOVE.L 8(A1),D7  ; Load right low
    SUB.L D7,D5           ; Subtract low parts
    MOVE.L D5,8(A2) ; Store result low (address preserved)
    MOVE.L 12(A0),D5  ; Load left mid
    MOVE.L 12(A1),D7 ; Load right mid
    SUBX.L D7,D5          ; Subtract mid parts with borrow
    MOVE.L D5,12(A2) ; Store result mid (address preserved)
    MOVE.L 4(A0),D5   ; Load left high
    MOVE.L 4(A1),D7  ; Load right high
    SUBX.L D7,D5          ; Subtract high parts with borrow
    MOVE.L D5,4(A2) ; Store result high (address preserved)
    MOVE.L (A0),D5    ; Load left flags
    MOVE.L D5,(A2)  ; Store result flags (address preserved)
    MOVE.L A2,D7 ; Convert address to data register for return

    ; Offset 0022: call
    ; Decimal.Abs(D7)
    ; TODO: Implement decimal absolute value
    MOVE.L D7,D7

    ; Offset 0027: ldc.i4.1
    MOVE.L #1,D0         ; Load 1

    ; Offset 0028: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0029: ldc.i4.0
    CLR.L D6             ; Load 0

    ; Offset 002A: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 002B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 002C: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A2  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A2, lo=D0, mid=D5, hi=D6, sign=D1, scale=D4
    CLR.L D3           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D3   ; Set scale in flags
    TST.L D1        ; Check if negative
    BEQ .SkipNegative_L_137
    OR.L #0x80000000,D3 ; Set sign bit if negative
.SkipNegative_L_137:
    MOVE.L D3,(A2)      ; Store flags at offset 0
    MOVE.L D6,4(A2)          ; Store high at offset 4
    MOVE.L D0,8(A2)          ; Store low at offset 8
    MOVE.L D5,12(A2)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A2,D2   ; Convert address to data register

    ; Offset 0031: call
    ; System.Decimal.op_LessThan (inline)
    ; System.Decimal op_LessThan inline
    MOVE.L D7,A2    ; A2 = address of left operand
    MOVE.L D2,A1  ; A1 = address of right operand
    CLR.L D3     ; Assume not less than (default: 0)
    MOVE.L (A2),D1    ; Load left flags
    MOVE.L (A1),D4          ; Load right flags
    TST.L D1                     ; Check left sign (bit 31)
    BPL .LeftPositive_L_138
    TST.L D4
    BMI .BothNegative_L_138   ; Both negative, compare magnitude
    MOVE.L #1,D3              ; Left negative, right positive: left < right
    BRA .Done_L_140
.LeftPositive_L_138:
    TST.L D4
    BMI .Done_L_140              ; Left positive, right negative: left >= right (return 0)
.BothNegative_L_138:
    MOVE.L 4(A2),D1   ; Load left high
    CMP.L 4(A1),D1   ; Compare high
    BLT .IsLessThan_L_138
    BGT .Done_L_140              ; If left high > right high, not less
    MOVE.L 12(A2),D1  ; Load left mid
    CMP.L 12(A1),D1  ; Compare mid
    BLT .IsLessThan_L_138
    BGT .Done_L_140
    MOVE.L 8(A2),D1   ; Load left low
    CMP.L 8(A1),D1   ; Compare low
    BLT .IsLessThan_L_138
    BRA .Done_L_140
.IsLessThan_L_138:
    MOVE.L #1,D3              ; Left < Right
.Done_L_140:

    ; Offset 0036: stloc.2
    MOVE.L D3,-12(A6)  ; Store to local 2

    ; Offset 0037: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_ConversionToFloat:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_141
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_141:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0012: call
    ; System.Decimal.op_Explicit (inline)
    ; Decimal.op_Explicit (inline)
    MOVE.L D0,D0       ; Decimal.op_Explicit: convert from decimal (simplified)

    ; Offset 0017: conv.r4
    MOVE.L D0,D0  ; Convert to R4

    ; Offset 0018: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0019: ldc.r4
    LEA FLOAT_CONST_0019(PC),A0
    MOVE.L (A0),D0

    ; Offset 001E: box
    ; Box type token 01000012
    MOVE.L D0,D0     ; Boxed value

    ; Offset 0023: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0024: conv.r8
    MOVE.L D1,D1  ; Convert to R8 (high word)
    CLR.L D1          ; Convert to R8 (low word)

    ; Offset 0025: ldc.i4.s
    MOVE.L #10,D2  ; Load short constant

    ; Offset 0027: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D1:D1, D2) - double precision rounding
    ; TODO: Implement IEEE double rounding to D2 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D1,D2  ; Copy high word
    MOVE.L D1,D3    ; Copy low word

    ; Offset 002C: box
    ; Box type token 01000013
    MOVE.L D3,D0     ; Boxed value

    ; Offset 0031: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0036: stloc.2
    MOVE.L D3,-12(A6)  ; Store to local 2

    ; Offset 0037: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS


; Methods of JumpCS.TestMath.Tests.DoubleMathTests
JumpCS.TestMath.Tests.DoubleMathTests_Addition_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D0      ; Load local.0 (high)
    MOVE.L -4(A6),D1  ; Load local.0 (low)

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0017: add
    MOVE.L D0,D0   ; Left high
    MOVE.L D1,D1   ; Left low
    MOVE.L D2,D2  ; Right high
    MOVE.L D3,D3  ; Right low
    JSR __adddf3          ; IEEE 754 double addition

    ; Offset 0018: stloc.2
    MOVE.L D0,-12(A6)   ; Store to local 2 (high)
    MOVE.L D1,-16(A6)   ; Store to local 2 (low)

    ; Offset 0019: ldc.r8
    LEA DOUBLE_CONST_0019(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0022: box
    ; Box type token 01000013
    MOVE.L D0,D0     ; Boxed value

    ; Offset 0027: ldloc.2
    MOVE.L -16(A6),D2      ; Load local.2 (high)
    MOVE.L -12(A6),D3  ; Load local.2 (low)

    ; Offset 0028: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 0029: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D2:D3, D4) - double precision rounding
    ; TODO: Implement IEEE double rounding to D4 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D2,D2  ; Copy high word
    MOVE.L D3,D2    ; Copy low word

    ; Offset 002E: box
    ; Box type token 01000013
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0033: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0038: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 0039: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Addition_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D0      ; Load local.0 (high)
    MOVE.L -4(A6),D1  ; Load local.0 (low)

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0017: add
    MOVE.L D0,D0   ; Left high
    MOVE.L D1,D1   ; Left low
    MOVE.L D2,D2  ; Right high
    MOVE.L D3,D3  ; Right low
    JSR __adddf3          ; IEEE 754 double addition

    ; Offset 0018: stloc.2
    MOVE.L D0,-12(A6)   ; Store to local 2 (high)
    MOVE.L D1,-16(A6)   ; Store to local 2 (low)

    ; Offset 0019: ldc.r8
    LEA DOUBLE_CONST_0019(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0022: box
    ; Box type token 01000013
    MOVE.L D0,D0     ; Boxed value

    ; Offset 0027: ldloc.2
    MOVE.L -16(A6),D2      ; Load local.2 (high)
    MOVE.L -12(A6),D3  ; Load local.2 (low)

    ; Offset 0028: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 0029: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D2:D3, D4) - double precision rounding
    ; TODO: Implement IEEE double rounding to D4 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D2,D2  ; Copy high word
    MOVE.L D3,D2    ; Copy low word

    ; Offset 002E: box
    ; Box type token 01000013
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0033: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0038: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 0039: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Addition_MixedSigns:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D0      ; Load local.0 (high)
    MOVE.L -4(A6),D1  ; Load local.0 (low)

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0017: add
    MOVE.L D0,D0   ; Left high
    MOVE.L D1,D1   ; Left low
    MOVE.L D2,D2  ; Right high
    MOVE.L D3,D3  ; Right low
    JSR __adddf3          ; IEEE 754 double addition

    ; Offset 0018: stloc.2
    MOVE.L D0,-12(A6)   ; Store to local 2 (high)
    MOVE.L D1,-16(A6)   ; Store to local 2 (low)

    ; Offset 0019: ldc.r8
    LEA DOUBLE_CONST_0019(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0022: box
    ; Box type token 01000013
    MOVE.L D0,D0     ; Boxed value

    ; Offset 0027: ldloc.2
    MOVE.L -16(A6),D2      ; Load local.2 (high)
    MOVE.L -12(A6),D3  ; Load local.2 (low)

    ; Offset 0028: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 0029: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D2:D3, D4) - double precision rounding
    ; TODO: Implement IEEE double rounding to D4 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D2,D2  ; Copy high word
    MOVE.L D3,D2    ; Copy low word

    ; Offset 002E: box
    ; Box type token 01000013
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0033: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0038: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 0039: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Subtraction_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D0      ; Load local.0 (high)
    MOVE.L -4(A6),D1  ; Load local.0 (low)

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0017: sub
    MOVE.L D0,D0   ; Left high
    MOVE.L D1,D1   ; Left low
    MOVE.L D2,D2  ; Right high
    MOVE.L D3,D3  ; Right low
    JSR __subdf3          ; IEEE 754 double subtraction

    ; Offset 0018: stloc.2
    MOVE.L D0,-12(A6)   ; Store to local 2 (high)
    MOVE.L D1,-16(A6)   ; Store to local 2 (low)

    ; Offset 0019: ldc.r8
    LEA DOUBLE_CONST_0019(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0022: box
    ; Box type token 01000013
    MOVE.L D0,D0     ; Boxed value

    ; Offset 0027: ldloc.2
    MOVE.L -16(A6),D2      ; Load local.2 (high)
    MOVE.L -12(A6),D3  ; Load local.2 (low)

    ; Offset 0028: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 0029: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D2:D3, D4) - double precision rounding
    ; TODO: Implement IEEE double rounding to D4 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D2,D2  ; Copy high word
    MOVE.L D3,D2    ; Copy low word

    ; Offset 002E: box
    ; Box type token 01000013
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0033: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0038: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 0039: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Subtraction_NegativeResult:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D0      ; Load local.0 (high)
    MOVE.L -4(A6),D1  ; Load local.0 (low)

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0017: sub
    MOVE.L D0,D0   ; Left high
    MOVE.L D1,D1   ; Left low
    MOVE.L D2,D2  ; Right high
    MOVE.L D3,D3  ; Right low
    JSR __subdf3          ; IEEE 754 double subtraction

    ; Offset 0018: stloc.2
    MOVE.L D0,-12(A6)   ; Store to local 2 (high)
    MOVE.L D1,-16(A6)   ; Store to local 2 (low)

    ; Offset 0019: ldc.r8
    LEA DOUBLE_CONST_0019(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0022: box
    ; Box type token 01000013
    MOVE.L D0,D0     ; Boxed value

    ; Offset 0027: ldloc.2
    MOVE.L -16(A6),D2      ; Load local.2 (high)
    MOVE.L -12(A6),D3  ; Load local.2 (low)

    ; Offset 0028: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 0029: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D2:D3, D4) - double precision rounding
    ; TODO: Implement IEEE double rounding to D4 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D2,D2  ; Copy high word
    MOVE.L D3,D2    ; Copy low word

    ; Offset 002E: box
    ; Box type token 01000013
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0033: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0038: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 0039: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Multiplication_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D0      ; Load local.0 (high)
    MOVE.L -4(A6),D1  ; Load local.0 (low)

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0017: mul
    MOVE.L D0,D0   ; Left high
    MOVE.L D1,D1   ; Left low
    MOVE.L D2,D2  ; Right high
    MOVE.L D3,D3  ; Right low
    JSR __muldf3          ; IEEE 754 double multiply

    ; Offset 0018: stloc.2
    MOVE.L D0,-12(A6)   ; Store to local 2 (high)
    MOVE.L D1,-16(A6)   ; Store to local 2 (low)

    ; Offset 0019: ldc.r8
    LEA DOUBLE_CONST_0019(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0022: box
    ; Box type token 01000013
    MOVE.L D0,D0     ; Boxed value

    ; Offset 0027: ldloc.2
    MOVE.L -16(A6),D2      ; Load local.2 (high)
    MOVE.L -12(A6),D3  ; Load local.2 (low)

    ; Offset 0028: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 0029: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D2:D3, D4) - double precision rounding
    ; TODO: Implement IEEE double rounding to D4 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D2,D2  ; Copy high word
    MOVE.L D3,D2    ; Copy low word

    ; Offset 002E: box
    ; Box type token 01000013
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0033: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0038: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 0039: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Multiplication_ByZero:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D0      ; Load local.0 (high)
    MOVE.L -4(A6),D1  ; Load local.0 (low)

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0017: mul
    MOVE.L D0,D0   ; Left high
    MOVE.L D1,D1   ; Left low
    MOVE.L D2,D2  ; Right high
    MOVE.L D3,D3  ; Right low
    JSR __muldf3          ; IEEE 754 double multiply

    ; Offset 0018: stloc.2
    MOVE.L D0,-12(A6)   ; Store to local 2 (high)
    MOVE.L D1,-16(A6)   ; Store to local 2 (low)

    ; Offset 0019: ldc.r8
    LEA DOUBLE_CONST_0019(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0022: box
    ; Box type token 01000013
    MOVE.L D0,D0     ; Boxed value

    ; Offset 0027: ldloc.2
    MOVE.L -16(A6),D2      ; Load local.2 (high)
    MOVE.L -12(A6),D3  ; Load local.2 (low)

    ; Offset 0028: box
    ; Box type token 01000013
    MOVE.L D3,D0     ; Boxed value

    ; Offset 002D: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0032: stloc.3
    MOVE.L D3,-16(A6)  ; Store to local 3

    ; Offset 0033: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Multiplication_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D0      ; Load local.0 (high)
    MOVE.L -4(A6),D1  ; Load local.0 (low)

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0017: mul
    MOVE.L D0,D0   ; Left high
    MOVE.L D1,D1   ; Left low
    MOVE.L D2,D2  ; Right high
    MOVE.L D3,D3  ; Right low
    JSR __muldf3          ; IEEE 754 double multiply

    ; Offset 0018: stloc.2
    MOVE.L D0,-12(A6)   ; Store to local 2 (high)
    MOVE.L D1,-16(A6)   ; Store to local 2 (low)

    ; Offset 0019: ldc.r8
    LEA DOUBLE_CONST_0019(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0022: box
    ; Box type token 01000013
    MOVE.L D0,D0     ; Boxed value

    ; Offset 0027: ldloc.2
    MOVE.L -16(A6),D2      ; Load local.2 (high)
    MOVE.L -12(A6),D3  ; Load local.2 (low)

    ; Offset 0028: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 0029: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D2:D3, D4) - double precision rounding
    ; TODO: Implement IEEE double rounding to D4 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D2,D2  ; Copy high word
    MOVE.L D3,D2    ; Copy low word

    ; Offset 002E: box
    ; Box type token 01000013
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0033: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0038: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 0039: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Division_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D0      ; Load local.0 (high)
    MOVE.L -4(A6),D1  ; Load local.0 (low)

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0017: div
    MOVE.L D0,D0   ; Left high
    MOVE.L D1,D1   ; Left low
    MOVE.L D2,D2  ; Right high
    MOVE.L D3,D3  ; Right low
    JSR __divdf3          ; IEEE 754 double division

    ; Offset 0018: stloc.2
    MOVE.L D0,-12(A6)   ; Store to local 2 (high)
    MOVE.L D1,-16(A6)   ; Store to local 2 (low)

    ; Offset 0019: ldc.r8
    LEA DOUBLE_CONST_0019(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0022: box
    ; Box type token 01000013
    MOVE.L D0,D0     ; Boxed value

    ; Offset 0027: ldloc.2
    MOVE.L -16(A6),D2      ; Load local.2 (high)
    MOVE.L -12(A6),D3  ; Load local.2 (low)

    ; Offset 0028: box
    ; Box type token 01000013
    MOVE.L D3,D0     ; Boxed value

    ; Offset 002D: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0032: stloc.3
    MOVE.L D3,-16(A6)  ; Store to local 3

    ; Offset 0033: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Division_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D0      ; Load local.0 (high)
    MOVE.L -4(A6),D1  ; Load local.0 (low)

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0017: div
    MOVE.L D0,D0   ; Left high
    MOVE.L D1,D1   ; Left low
    MOVE.L D2,D2  ; Right high
    MOVE.L D3,D3  ; Right low
    JSR __divdf3          ; IEEE 754 double division

    ; Offset 0018: stloc.2
    MOVE.L D0,-12(A6)   ; Store to local 2 (high)
    MOVE.L D1,-16(A6)   ; Store to local 2 (low)

    ; Offset 0019: ldc.r8
    LEA DOUBLE_CONST_0019(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0022: box
    ; Box type token 01000013
    MOVE.L D0,D0     ; Boxed value

    ; Offset 0027: ldloc.2
    MOVE.L -16(A6),D2      ; Load local.2 (high)
    MOVE.L -12(A6),D3  ; Load local.2 (low)

    ; Offset 0028: box
    ; Box type token 01000013
    MOVE.L D3,D0     ; Boxed value

    ; Offset 002D: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0032: stloc.3
    MOVE.L D3,-16(A6)  ; Store to local 3

    ; Offset 0033: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Division_MixedSigns:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D0      ; Load local.0 (high)
    MOVE.L -4(A6),D1  ; Load local.0 (low)

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0017: div
    MOVE.L D0,D0   ; Left high
    MOVE.L D1,D1   ; Left low
    MOVE.L D2,D2  ; Right high
    MOVE.L D3,D3  ; Right low
    JSR __divdf3          ; IEEE 754 double division

    ; Offset 0018: stloc.2
    MOVE.L D0,-12(A6)   ; Store to local 2 (high)
    MOVE.L D1,-16(A6)   ; Store to local 2 (low)

    ; Offset 0019: ldc.r8
    LEA DOUBLE_CONST_0019(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0022: box
    ; Box type token 01000013
    MOVE.L D0,D0     ; Boxed value

    ; Offset 0027: ldloc.2
    MOVE.L -16(A6),D2      ; Load local.2 (high)
    MOVE.L -12(A6),D3  ; Load local.2 (low)

    ; Offset 0028: box
    ; Box type token 01000013
    MOVE.L D3,D0     ; Boxed value

    ; Offset 002D: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0032: stloc.3
    MOVE.L D3,-16(A6)  ; Store to local 3

    ; Offset 0033: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Division_ByZeroPositive:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D0      ; Load local.0 (high)
    MOVE.L -4(A6),D1  ; Load local.0 (low)

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0017: div
    MOVE.L D0,D0   ; Left high
    MOVE.L D1,D1   ; Left low
    MOVE.L D2,D2  ; Right high
    MOVE.L D3,D3  ; Right low
    JSR __divdf3          ; IEEE 754 double division

    ; Offset 0018: stloc.2
    MOVE.L D0,-12(A6)   ; Store to local 2 (high)
    MOVE.L D1,-16(A6)   ; Store to local 2 (low)

    ; Offset 0019: ldloc.2
    MOVE.L -16(A6),D1      ; Load local.2 (high)
    MOVE.L -12(A6),D0  ; Load local.2 (low)

    ; Offset 001A: call
    ; System.Double.IsPositiveInfinity (inline)
    CMPI.L #$7FF00000,D1
    BNE L_142_false
    TST.L D0
    BNE L_142_false
    MOVE.L #1,D0
    BRA L_142_end
L_142_false:
    CLR.L D0
L_142_end:

    ; Offset 001F: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 0020: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Division_ByZeroNegative:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D0      ; Load local.0 (high)
    MOVE.L -4(A6),D1  ; Load local.0 (low)

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0017: div
    MOVE.L D0,D0   ; Left high
    MOVE.L D1,D1   ; Left low
    MOVE.L D2,D2  ; Right high
    MOVE.L D3,D3  ; Right low
    JSR __divdf3          ; IEEE 754 double division

    ; Offset 0018: stloc.2
    MOVE.L D0,-12(A6)   ; Store to local 2 (high)
    MOVE.L D1,-16(A6)   ; Store to local 2 (low)

    ; Offset 0019: ldloc.2
    MOVE.L -16(A6),D1      ; Load local.2 (high)
    MOVE.L -12(A6),D0  ; Load local.2 (low)

    ; Offset 001A: call
    ; System.Double.IsNegativeInfinity (inline)
    CMPI.L #$FFF00000,D1
    BNE L_143_false
    TST.L D0
    BNE L_143_false
    MOVE.L #1,D0
    BRA L_143_end
L_143_false:
    CLR.L D0
L_143_end:

    ; Offset 001F: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 0020: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Remainder_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D0      ; Load local.0 (high)
    MOVE.L -4(A6),D1  ; Load local.0 (low)

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0017: rem
    MOVE.L D0,D0   ; Left high
    MOVE.L D1,D1   ; Left low
    MOVE.L D2,D2  ; Right high
    MOVE.L D3,D3  ; Right low
    JSR __fmod            ; IEEE 754 double remainder/modulo

    ; Offset 0018: stloc.2
    MOVE.L D0,-12(A6)   ; Store to local 2 (high)
    MOVE.L D1,-16(A6)   ; Store to local 2 (low)

    ; Offset 0019: ldloc.2
    MOVE.L -16(A6),D1      ; Load local.2 (high)
    MOVE.L -12(A6),D0  ; Load local.2 (low)

    ; Offset 001A: ldc.r8
    LEA DOUBLE_CONST_001A(PC),A0
    MOVE.L (A0),D3     ; Double high word
    MOVE.L 4(A0),D2    ; Double low word

    ; Offset 0023: blt.un.s
    MOVE.L D1,D0
    MOVE.L D0,D1
    MOVE.L D3,D2
    MOVE.L D2,D3
    JSR __ltdf2           ; IEEE 754 double less-than
    TST.L D0
    BNE L_0036  ; Branch if < (double, unsigned/unordered)

    ; Offset 0025: ldloc.2
    MOVE.L -16(A6),D2      ; Load local.2 (high)
    MOVE.L -12(A6),D3  ; Load local.2 (low)

    ; Offset 0026: ldc.r8
    LEA DOUBLE_CONST_0026(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 002F: nop
    ; NOP

    ; Offset 0031: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0032: nop
    ; NOP

    ; Offset 0034: br.s
    BRA L_0037  ; Unconditional branch

    ; Offset 0036: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 0037: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 0038: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_UnaryMinus:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldloc.0
    MOVE.L -8(A6),D1      ; Load local.0 (high)
    MOVE.L -4(A6),D0  ; Load local.0 (low)

    ; Offset 000C: neg
    CLR.L D2
    SUB.L D0,D2

    ; Offset 000D: stloc.1
    MOVE.L D2,-8(A6)   ; Store to local 1

    ; Offset 000E: ldc.r8
    LEA DOUBLE_CONST_000E(PC),A0
    MOVE.L (A0),D2     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0017: box
    ; Box type token 01000013
    MOVE.L D0,D0     ; Boxed value

    ; Offset 001C: ldloc.1
    MOVE.L -12(A6),D3  ; Load local.1

    ; Offset 001D: box
    ; Box type token 01000013
    MOVE.L D3,D0     ; Boxed value

    ; Offset 0022: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0027: stloc.2
    MOVE.L D3,-12(A6)  ; Store to local 2

    ; Offset 0028: ret
    MOVE.L D2,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Comparison_LessThan:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D0      ; Load local.0 (high)
    MOVE.L -4(A6),D1  ; Load local.0 (low)

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0017: nop
    ; NOP

    ; Offset 0019: stloc.2
    MOVE.L D2,-12(A6)   ; Store to local 2 (high)
    MOVE.L D3,-16(A6)   ; Store to local 2 (low)

    ; Offset 001A: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Comparison_GreaterThan:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D0      ; Load local.0 (high)
    MOVE.L -4(A6),D1  ; Load local.0 (low)

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0017: nop
    ; NOP

    ; Offset 0019: stloc.2
    MOVE.L D2,-12(A6)   ; Store to local 2 (high)
    MOVE.L D3,-16(A6)   ; Store to local 2 (low)

    ; Offset 001A: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Comparison_Equal:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D0      ; Load local.0 (high)
    MOVE.L -4(A6),D1  ; Load local.0 (low)

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0017: nop
    ; NOP

    ; Offset 0019: stloc.2
    MOVE.L D2,-12(A6)   ; Store to local 2 (high)
    MOVE.L D3,-16(A6)   ; Store to local 2 (low)

    ; Offset 001A: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_SpecialValue_NaN:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #8,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldloc.0
    MOVE.L -8(A6),D1      ; Load local.0 (high)
    MOVE.L -4(A6),D0  ; Load local.0 (low)

    ; Offset 000C: call
    ; System.Double.IsNaN (inline)
    MOVE.L D1,D0
    ANDI.L #$7FF00000,D0  ; Isolate exponent
    CMPI.L #$7FF00000,D0
    BNE L_144_false
    MOVE.L D1,D0
    ANDI.L #$000FFFFF,D0  ; Isolate mantissa high
    TST.L D0
    BNE L_144_true
    TST.L D0
    BNE L_144_true
L_144_false:
    CLR.L D0
    BRA L_144_end
L_144_true:
    MOVE.L #1,D0
L_144_end:

    ; Offset 0011: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0012: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_SpecialValue_Infinity:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #8,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldloc.0
    MOVE.L -8(A6),D1      ; Load local.0 (high)
    MOVE.L -4(A6),D0  ; Load local.0 (low)

    ; Offset 000C: call
    ; System.Double.IsInfinity (inline)
    MOVE.L D1,D0
    ANDI.L #$7FFFFFFF,D0  ; Clear sign bit
    CMPI.L #$7FF00000,D0
    BNE L_145_false
    TST.L D0
    BNE L_145_false
    MOVE.L #1,D0
    BRA L_145_end
L_145_false:
    CLR.L D0
L_145_end:

    ; Offset 0011: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0012: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Sqrt:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldloc.0
    MOVE.L -8(A6),D1      ; Load local.0 (high)
    MOVE.L -4(A6),D0  ; Load local.0 (low)

    ; Offset 000C: call
    MOVE.L D1,D0   ; Sqrt: input high
    MOVE.L D0,D1   ; Sqrt: input low
    JSR __sqrt            ; IEEE 754 double square root

    ; Offset 0011: stloc.1
    MOVE.L D0,-8(A6)    ; Store to local 1 (high)
    MOVE.L D1,-12(A6)   ; Store to local 1 (low)

    ; Offset 0012: ldc.r8
    LEA DOUBLE_CONST_0012(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 001B: box
    ; Box type token 01000013
    MOVE.L D0,D0     ; Boxed value

    ; Offset 0020: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D2  ; Load local.1 (low)

    ; Offset 0021: box
    ; Box type token 01000013
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0026: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 002B: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 002C: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Abs:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldloc.0
    MOVE.L -8(A6),D1      ; Load local.0 (high)
    MOVE.L -4(A6),D0  ; Load local.0 (low)

    ; Offset 000C: call
    ; Double precision absolute value
    MOVE.L D1,D0
    MOVE.L D0,D1
    ANDI.L #$7FFFFFFF,D0 ; Clear sign bit (IEEE 754 abs)

    ; Offset 0011: stloc.1
    MOVE.L D0,-8(A6)    ; Store to local 1 (high)
    MOVE.L D1,-12(A6)   ; Store to local 1 (low)

    ; Offset 0012: ldc.r8
    LEA DOUBLE_CONST_0012(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 001B: box
    ; Box type token 01000013
    MOVE.L D0,D0     ; Boxed value

    ; Offset 0020: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D2  ; Load local.1 (low)

    ; Offset 0021: box
    ; Box type token 01000013
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0026: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 002B: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 002C: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Pow:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D0      ; Load local.0 (high)
    MOVE.L -4(A6),D1  ; Load local.0 (low)

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0017: call
    MOVE.L D0,D0  ; Pow: base high
    MOVE.L D1,D1  ; Pow: base low
    MOVE.L D2,D2   ; Pow: exponent high
    MOVE.L D3,D3   ; Pow: exponent low
    JSR __pow             ; IEEE 754 double power

    ; Offset 001C: stloc.2
    MOVE.L D0,-12(A6)   ; Store to local 2 (high)
    MOVE.L D1,-16(A6)   ; Store to local 2 (low)

    ; Offset 001D: ldc.r8
    LEA DOUBLE_CONST_001D(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0026: box
    ; Box type token 01000013
    MOVE.L D0,D0     ; Boxed value

    ; Offset 002B: ldloc.2
    MOVE.L -16(A6),D2      ; Load local.2 (high)
    MOVE.L -12(A6),D3  ; Load local.2 (low)

    ; Offset 002C: box
    ; Box type token 01000013
    MOVE.L D3,D0     ; Boxed value

    ; Offset 0031: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0036: stloc.3
    MOVE.L D3,-16(A6)  ; Store to local 3

    ; Offset 0037: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Log:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldloc.0
    MOVE.L -8(A6),D1      ; Load local.0 (high)
    MOVE.L -4(A6),D0  ; Load local.0 (low)

    ; Offset 000C: call
    MOVE.L D1,D0   ; Log: input high
    MOVE.L D0,D1   ; Log: input low
    JSR __log             ; IEEE 754 double natural log

    ; Offset 0011: stloc.1
    MOVE.L D0,-8(A6)    ; Store to local 1 (high)
    MOVE.L D1,-12(A6)   ; Store to local 1 (low)

    ; Offset 0012: ldc.r8
    LEA DOUBLE_CONST_0012(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 001B: box
    ; Box type token 01000013
    MOVE.L D0,D0     ; Boxed value

    ; Offset 0020: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D2  ; Load local.1 (low)

    ; Offset 0021: ldc.i4.s
    MOVE.L #10,D3  ; Load short constant

    ; Offset 0023: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D2:D2, D3) - double precision rounding
    ; TODO: Implement IEEE double rounding to D3 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D2,D2  ; Copy high word
    MOVE.L D2,D3    ; Copy low word

    ; Offset 0028: box
    ; Box type token 01000013
    MOVE.L D3,D0     ; Boxed value

    ; Offset 002D: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0032: stloc.2
    MOVE.L D3,-12(A6)  ; Store to local 2

    ; Offset 0033: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Trigonometric_Sin:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #8,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: call
    MOVE.L D0,D0   ; Sin: input high
    MOVE.L D1,D1   ; Sin: input low
    JSR __sin             ; IEEE 754 double sine

    ; Offset 000F: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 0010: ldc.r8
    LEA DOUBLE_CONST_0010(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0019: box
    ; Box type token 01000013
    MOVE.L D0,D0     ; Boxed value

    ; Offset 001E: ldloc.0
    MOVE.L -8(A6),D2      ; Load local.0 (high)
    MOVE.L -4(A6),D2  ; Load local.0 (low)

    ; Offset 001F: ldc.i4.s
    MOVE.L #10,D3  ; Load short constant

    ; Offset 0021: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D2:D2, D3) - double precision rounding
    ; TODO: Implement IEEE double rounding to D3 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D2,D2  ; Copy high word
    MOVE.L D2,D3    ; Copy low word

    ; Offset 0026: box
    ; Box type token 01000013
    MOVE.L D3,D0     ; Boxed value

    ; Offset 002B: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0030: stloc.1
    MOVE.L D3,-8(A6)   ; Store to local 1

    ; Offset 0031: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_Trigonometric_Cos:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #8,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: call
    MOVE.L D0,D0   ; Cos: input high
    MOVE.L D1,D1   ; Cos: input low
    JSR __cos             ; IEEE 754 double cosine

    ; Offset 000F: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 0010: ldc.r8
    LEA DOUBLE_CONST_0010(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0019: box
    ; Box type token 01000013
    MOVE.L D0,D0     ; Boxed value

    ; Offset 001E: ldloc.0
    MOVE.L -8(A6),D2      ; Load local.0 (high)
    MOVE.L -4(A6),D2  ; Load local.0 (low)

    ; Offset 001F: ldc.i4.s
    MOVE.L #10,D3  ; Load short constant

    ; Offset 0021: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D2:D2, D3) - double precision rounding
    ; TODO: Implement IEEE double rounding to D3 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D2,D2  ; Copy high word
    MOVE.L D2,D3    ; Copy low word

    ; Offset 0026: box
    ; Box type token 01000013
    MOVE.L D3,D0     ; Boxed value

    ; Offset 002B: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0030: stloc.1
    MOVE.L D3,-8(A6)   ; Store to local 1

    ; Offset 0031: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DoubleMathTests_ChainedOperations:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #20,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D0    ; Double low word

    ; Offset 0014: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D0,-12(A6)   ; Store to local 1 (low)

    ; Offset 0015: ldc.r8
    LEA DOUBLE_CONST_0015(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 001E: stloc.2
    MOVE.L D0,-12(A6)   ; Store to local 2 (high)
    MOVE.L D1,-16(A6)   ; Store to local 2 (low)

    ; Offset 001F: ldloc.0
    MOVE.L -8(A6),D1      ; Load local.0 (high)
    MOVE.L -4(A6),D0  ; Load local.0 (low)

    ; Offset 0020: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D3  ; Load local.1 (low)

    ; Offset 0021: add
    MOVE.L D1,D0   ; Left high
    MOVE.L D0,D1   ; Left low
    MOVE.L D2,D2  ; Right high
    MOVE.L D3,D3  ; Right low
    JSR __adddf3          ; IEEE 754 double addition

    ; Offset 0022: ldloc.2
    MOVE.L -16(A6),D3      ; Load local.2 (high)
    MOVE.L -12(A6),D2  ; Load local.2 (low)

    ; Offset 0023: mul
    MOVE.L D0,D0   ; Left high
    MOVE.L D1,D1   ; Left low
    MOVE.L D3,D2  ; Right high
    MOVE.L D2,D3  ; Right low
    JSR __muldf3          ; IEEE 754 double multiply

    ; Offset 0024: ldc.r8
    LEA DOUBLE_CONST_0024(PC),A0
    MOVE.L (A0),D2     ; Double high word
    MOVE.L 4(A0),D3    ; Double low word

    ; Offset 002D: sub
    MOVE.L D0,D0   ; Left high
    MOVE.L D1,D1   ; Left low
    MOVE.L D2,D2  ; Right high
    MOVE.L D3,D3  ; Right low
    JSR __subdf3          ; IEEE 754 double subtraction

    ; Offset 002E: stloc.3
    MOVE.L D0,-16(A6)   ; Store to local 3 (high)
    MOVE.L D1,-20(A6)   ; Store to local 3 (low)

    ; Offset 002F: ldloc.3
    MOVE.L -20(A6),D1      ; Load local.3 (high)
    MOVE.L -16(A6),D0  ; Load local.3 (low)

    ; Offset 0030: ldc.r8
    LEA DOUBLE_CONST_0030(PC),A0
    MOVE.L (A0),D3     ; Double high word
    MOVE.L 4(A0),D2    ; Double low word

    ; Offset 0039: blt.un.s
    MOVE.L D1,D0
    MOVE.L D0,D1
    MOVE.L D3,D2
    MOVE.L D2,D3
    JSR __ltdf2           ; IEEE 754 double less-than
    TST.L D0
    BNE L_004C  ; Branch if < (double, unsigned/unordered)

    ; Offset 003B: ldloc.3
    MOVE.L -20(A6),D2      ; Load local.3 (high)
    MOVE.L -16(A6),D3  ; Load local.3 (low)

    ; Offset 003C: ldc.r8
    LEA DOUBLE_CONST_003C(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 0045: nop
    ; NOP

    ; Offset 0047: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0048: nop
    ; NOP

    ; Offset 004A: br.s
    BRA L_004D  ; Unconditional branch

    ; Offset 004C: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 004D: stloc.s
    MOVE.L D0,-20(A6)  ; Store to local 4

    ; Offset 004F: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS


; Methods of JumpCS.TestMath.Tests.FloatMathTests
JumpCS.TestMath.Tests.FloatMathTests_Addition_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D0

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: add
    MOVE.L D0,D2
    ADD.L D1,D2

    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0011: ldc.r4
    LEA FLOAT_CONST_0011(PC),A0
    MOVE.L (A0),D2

    ; Offset 0016: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 001B: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 001C: conv.r8
    MOVE.L D2,D1  ; Convert to R8 (high word)
    CLR.L D1          ; Convert to R8 (low word)

    ; Offset 001D: ldc.i4.2
    MOVE.L #2,D2         ; Load 2

    ; Offset 001E: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D1:D1, D2) - double precision rounding
    ; TODO: Implement IEEE double rounding to D2 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D1,D3  ; Copy high word
    MOVE.L D1,D4    ; Copy low word

    ; Offset 0023: box
    ; Box type token 01000013
    MOVE.L D4,D0     ; Boxed value

    ; Offset 0028: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 002D: stloc.3
    MOVE.L D4,-16(A6)  ; Store to local 3

    ; Offset 002E: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_Addition_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D0

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: add
    MOVE.L D0,D2
    ADD.L D1,D2

    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0011: ldc.r4
    LEA FLOAT_CONST_0011(PC),A0
    MOVE.L (A0),D2

    ; Offset 0016: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 001B: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 001C: conv.r8
    MOVE.L D2,D1  ; Convert to R8 (high word)
    CLR.L D1          ; Convert to R8 (low word)

    ; Offset 001D: ldc.i4.2
    MOVE.L #2,D2         ; Load 2

    ; Offset 001E: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D1:D1, D2) - double precision rounding
    ; TODO: Implement IEEE double rounding to D2 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D1,D3  ; Copy high word
    MOVE.L D1,D4    ; Copy low word

    ; Offset 0023: box
    ; Box type token 01000013
    MOVE.L D4,D0     ; Boxed value

    ; Offset 0028: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 002D: stloc.3
    MOVE.L D4,-16(A6)  ; Store to local 3

    ; Offset 002E: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_Addition_MixedSigns:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D0

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: add
    MOVE.L D0,D2
    ADD.L D1,D2

    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0011: ldc.r4
    LEA FLOAT_CONST_0011(PC),A0
    MOVE.L (A0),D2

    ; Offset 0016: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 001B: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 001C: conv.r8
    MOVE.L D2,D1  ; Convert to R8 (high word)
    CLR.L D1          ; Convert to R8 (low word)

    ; Offset 001D: ldc.i4.1
    MOVE.L #1,D2         ; Load 1

    ; Offset 001E: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D1:D1, D2) - double precision rounding
    ; TODO: Implement IEEE double rounding to D2 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D1,D3  ; Copy high word
    MOVE.L D1,D4    ; Copy low word

    ; Offset 0023: box
    ; Box type token 01000013
    MOVE.L D4,D0     ; Boxed value

    ; Offset 0028: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 002D: stloc.3
    MOVE.L D4,-16(A6)  ; Store to local 3

    ; Offset 002E: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_Subtraction_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D0

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: sub
    MOVE.L D0,D2
    SUB.L D1,D2

    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0011: ldc.r4
    LEA FLOAT_CONST_0011(PC),A0
    MOVE.L (A0),D2

    ; Offset 0016: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 001B: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 001C: conv.r8
    MOVE.L D2,D1  ; Convert to R8 (high word)
    CLR.L D1          ; Convert to R8 (low word)

    ; Offset 001D: ldc.i4.1
    MOVE.L #1,D2         ; Load 1

    ; Offset 001E: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D1:D1, D2) - double precision rounding
    ; TODO: Implement IEEE double rounding to D2 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D1,D3  ; Copy high word
    MOVE.L D1,D4    ; Copy low word

    ; Offset 0023: box
    ; Box type token 01000013
    MOVE.L D4,D0     ; Boxed value

    ; Offset 0028: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 002D: stloc.3
    MOVE.L D4,-16(A6)  ; Store to local 3

    ; Offset 002E: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_Subtraction_NegativeResult:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D0

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: sub
    MOVE.L D0,D2
    SUB.L D1,D2

    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0011: ldc.r4
    LEA FLOAT_CONST_0011(PC),A0
    MOVE.L (A0),D2

    ; Offset 0016: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 001B: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 001C: conv.r8
    MOVE.L D2,D1  ; Convert to R8 (high word)
    CLR.L D1          ; Convert to R8 (low word)

    ; Offset 001D: ldc.i4.1
    MOVE.L #1,D2         ; Load 1

    ; Offset 001E: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D1:D1, D2) - double precision rounding
    ; TODO: Implement IEEE double rounding to D2 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D1,D3  ; Copy high word
    MOVE.L D1,D4    ; Copy low word

    ; Offset 0023: box
    ; Box type token 01000013
    MOVE.L D4,D0     ; Boxed value

    ; Offset 0028: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 002D: stloc.3
    MOVE.L D4,-16(A6)  ; Store to local 3

    ; Offset 002E: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_Multiplication_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D0

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: mul
    MOVE.L D0,D2
    MULS.L D1,D2

    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0011: ldc.r4
    LEA FLOAT_CONST_0011(PC),A0
    MOVE.L (A0),D2

    ; Offset 0016: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 001B: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 001C: conv.r8
    MOVE.L D2,D1  ; Convert to R8 (high word)
    CLR.L D1          ; Convert to R8 (low word)

    ; Offset 001D: ldc.i4.1
    MOVE.L #1,D2         ; Load 1

    ; Offset 001E: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D1:D1, D2) - double precision rounding
    ; TODO: Implement IEEE double rounding to D2 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D1,D3  ; Copy high word
    MOVE.L D1,D4    ; Copy low word

    ; Offset 0023: box
    ; Box type token 01000013
    MOVE.L D4,D0     ; Boxed value

    ; Offset 0028: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 002D: stloc.3
    MOVE.L D4,-16(A6)  ; Store to local 3

    ; Offset 002E: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_Multiplication_ByZero:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D0

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: mul
    MOVE.L D0,D2
    MULS.L D1,D2

    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0011: ldc.r4
    LEA FLOAT_CONST_0011(PC),A0
    MOVE.L (A0),D2

    ; Offset 0016: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 001B: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 001C: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0021: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0026: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 0027: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_Multiplication_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D0

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: mul
    MOVE.L D0,D2
    MULS.L D1,D2

    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0011: ldc.r4
    LEA FLOAT_CONST_0011(PC),A0
    MOVE.L (A0),D2

    ; Offset 0016: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 001B: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 001C: conv.r8
    MOVE.L D2,D1  ; Convert to R8 (high word)
    CLR.L D1          ; Convert to R8 (low word)

    ; Offset 001D: ldc.i4.1
    MOVE.L #1,D2         ; Load 1

    ; Offset 001E: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D1:D1, D2) - double precision rounding
    ; TODO: Implement IEEE double rounding to D2 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D1,D3  ; Copy high word
    MOVE.L D1,D4    ; Copy low word

    ; Offset 0023: box
    ; Box type token 01000013
    MOVE.L D4,D0     ; Boxed value

    ; Offset 0028: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 002D: stloc.3
    MOVE.L D4,-16(A6)  ; Store to local 3

    ; Offset 002E: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_Division_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D0

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: div
    MOVE.L D0,D2
    DIVS.L D1,D2

    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0011: ldc.r4
    LEA FLOAT_CONST_0011(PC),A0
    MOVE.L (A0),D2

    ; Offset 0016: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 001B: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 001C: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0021: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0026: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 0027: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_Division_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D0

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: div
    MOVE.L D0,D2
    DIVS.L D1,D2

    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0011: ldc.r4
    LEA FLOAT_CONST_0011(PC),A0
    MOVE.L (A0),D2

    ; Offset 0016: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 001B: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 001C: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0021: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0026: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 0027: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_Division_MixedSigns:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D0

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: div
    MOVE.L D0,D2
    DIVS.L D1,D2

    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0011: ldc.r4
    LEA FLOAT_CONST_0011(PC),A0
    MOVE.L (A0),D2

    ; Offset 0016: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 001B: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 001C: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0021: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0026: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 0027: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_Division_ByZeroPositive:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D0

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: div
    MOVE.L D0,D2
    DIVS.L D1,D2

    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0011: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0012: call
    ; System.Single.IsPositiveInfinity (inline)
    CMPI.L #$7F800000,D2
    BNE L_146_false
    MOVE.L #1,D0
    BRA L_146_end
L_146_false:
    CLR.L D0
L_146_end:

    ; Offset 0017: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 0018: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_Division_ByZeroNegative:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D0

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: div
    MOVE.L D0,D2
    DIVS.L D1,D2

    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0011: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0012: call
    ; System.Single.IsNegativeInfinity (inline)
    CMPI.L #$FF800000,D2
    BNE L_147_false
    MOVE.L #1,D0
    BRA L_147_end
L_147_false:
    CLR.L D0
L_147_end:

    ; Offset 0017: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 0018: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_Remainder_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D0

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: rem
    MOVE.L D0,D0
    DIVS.L D1,D0
    MOVE.L D1,D2  ; Remainder from division

    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0011: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0012: ldc.r4
    LEA FLOAT_CONST_0012(PC),A0
    MOVE.L (A0),D1

    ; Offset 0017: blt.un.s
    CMP.L D1,D2
    BCS L_0026  ; Branch if < (unsigned - Carry Set)

    ; Offset 0019: ldloc.2
    MOVE.L -16(A6),D0  ; Load local.2

    ; Offset 001A: ldc.r4
    LEA FLOAT_CONST_001A(PC),A0
    MOVE.L (A0),D3

    ; Offset 001F: nop
    ; NOP

    ; Offset 0021: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0022: nop
    ; NOP

    ; Offset 0024: br.s
    BRA L_0027  ; Unconditional branch

    ; Offset 0026: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 0027: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 0028: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_UnaryMinus:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: neg
    CLR.L D1
    SUB.L D0,D1

    ; Offset 0009: stloc.1
    MOVE.L D1,-8(A6)   ; Store to local 1

    ; Offset 000A: ldc.r4
    LEA FLOAT_CONST_000A(PC),A0
    MOVE.L (A0),D1

    ; Offset 000F: box
    ; Box type token 01000012
    MOVE.L D1,D0     ; Boxed value

    ; Offset 0014: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0015: box
    ; Box type token 01000012
    MOVE.L D1,D0     ; Boxed value

    ; Offset 001A: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001F: stloc.2
    MOVE.L D1,-12(A6)  ; Store to local 2

    ; Offset 0020: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_Comparison_LessThan:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D0

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: nop
    ; NOP

    ; Offset 0011: stloc.2
    MOVE.L D1,-12(A6)  ; Store to local 2

    ; Offset 0012: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_Comparison_GreaterThan:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D0

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: nop
    ; NOP

    ; Offset 0011: stloc.2
    MOVE.L D1,-12(A6)  ; Store to local 2

    ; Offset 0012: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_Comparison_Equal:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D0

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: nop
    ; NOP

    ; Offset 0011: stloc.2
    MOVE.L D1,-12(A6)  ; Store to local 2

    ; Offset 0012: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_SpecialValue_NaN:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #8,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: call
    ; System.Single.IsNaN (inline)
    MOVE.L D0,D0
    ANDI.L #$7F800000,D0  ; Isolate exponent
    CMPI.L #$7F800000,D0
    BNE L_148_false
    MOVE.L D0,D0
    ANDI.L #$007FFFFF,D0  ; Isolate mantissa
    TST.L D0
    BEQ L_148_false
    MOVE.L #1,D0
    BRA L_148_end
L_148_false:
    CLR.L D0
L_148_end:

    ; Offset 000D: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_SpecialValue_Infinity:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #8,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: call
    ; System.Single.IsInfinity (inline)
    MOVE.L D0,D0
    ANDI.L #$7FFFFFFF,D0  ; Clear sign bit
    CMPI.L #$7F800000,D0
    BNE L_149_false
    MOVE.L #1,D0
    BRA L_149_end
L_149_false:
    CLR.L D0
L_149_end:

    ; Offset 000D: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_Sqrt:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: conv.r8
    MOVE.L D0,D1  ; Convert to R8 (high word)
    CLR.L D2          ; Convert to R8 (low word)

    ; Offset 0009: call
    MOVE.L D1,D0   ; Sqrt: input high
    MOVE.L D2,D1   ; Sqrt: input low
    JSR __sqrt            ; IEEE 754 double square root

    ; Offset 000E: conv.r4
    MOVE.L D1,D2  ; Convert to R4

    ; Offset 000F: stloc.1
    MOVE.L D2,-8(A6)   ; Store to local 1

    ; Offset 0010: ldc.r4
    LEA FLOAT_CONST_0010(PC),A0
    MOVE.L (A0),D2

    ; Offset 0015: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 001A: ldloc.1
    MOVE.L -12(A6),D2  ; Load local.1

    ; Offset 001B: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0020: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0025: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0026: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_Abs:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: call
    MOVE.L D0,D1
    ANDI.L #$7FFFFFFF,D1 ; Clear sign bit (IEEE 754 float abs)

    ; Offset 000D: stloc.1
    MOVE.L D1,-8(A6)   ; Store to local 1

    ; Offset 000E: ldc.r4
    LEA FLOAT_CONST_000E(PC),A0
    MOVE.L (A0),D1

    ; Offset 0013: box
    ; Box type token 01000012
    MOVE.L D1,D0     ; Boxed value

    ; Offset 0018: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0019: box
    ; Box type token 01000012
    MOVE.L D1,D0     ; Boxed value

    ; Offset 001E: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0023: stloc.2
    MOVE.L D1,-12(A6)  ; Store to local 2

    ; Offset 0024: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.FloatMathTests_ChainedOperations:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #20,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D0

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldc.r4
    LEA FLOAT_CONST_000D(PC),A0
    MOVE.L (A0),D0

    ; Offset 0012: stloc.2
    MOVE.L D0,-12(A6)  ; Store to local 2

    ; Offset 0013: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0014: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0015: add
    MOVE.L D0,D2
    ADD.L D1,D2

    ; Offset 0016: ldloc.2
    MOVE.L -16(A6),D1  ; Load local.2

    ; Offset 0017: mul
    MOVE.L D2,D0
    MULS.L D1,D0

    ; Offset 0018: ldc.r4
    LEA FLOAT_CONST_0018(PC),A0
    MOVE.L (A0),D1

    ; Offset 001D: sub
    MOVE.L D0,D2
    SUB.L D1,D2

    ; Offset 001E: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 001F: ldloc.3
    MOVE.L -20(A6),D2  ; Load local.3

    ; Offset 0020: ldc.r4
    LEA FLOAT_CONST_0020(PC),A0
    MOVE.L (A0),D1

    ; Offset 0025: blt.un.s
    CMP.L D1,D2
    BCS L_0034  ; Branch if < (unsigned - Carry Set)

    ; Offset 0027: ldloc.3
    MOVE.L -20(A6),D0  ; Load local.3

    ; Offset 0028: ldc.r4
    LEA FLOAT_CONST_0028(PC),A0
    MOVE.L (A0),D3

    ; Offset 002D: nop
    ; NOP

    ; Offset 002F: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0030: nop
    ; NOP

    ; Offset 0032: br.s
    BRA L_0035  ; Unconditional branch

    ; Offset 0034: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 0035: stloc.s
    MOVE.L D0,-20(A6)  ; Store to local 4

    ; Offset 0037: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS


; Methods of JumpCS.TestMath.Tests.IntegerMathTests
JumpCS.TestMath.Tests.IntegerMathTests_Addition_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.s
    MOVE.L #58,D0  ; Load short constant

    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0009: add
    MOVE.L D0,D2
    ADD.L D1,D2

    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 000B: ldc.i4.s
    MOVE.L #100,D2  ; Load short constant

    ; Offset 000D: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0012: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0013: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0018: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001D: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 001E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_Addition_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #214,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.s
    MOVE.L #198,D0  ; Load short constant

    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0009: add
    MOVE.L D0,D2
    ADD.L D1,D2

    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 000B: ldc.i4.s
    MOVE.L #156,D2  ; Load short constant

    ; Offset 000D: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0012: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0013: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0018: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001D: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 001E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_Addition_MixedSigns:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #100,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.s
    MOVE.L #214,D0  ; Load short constant

    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0009: add
    MOVE.L D0,D2
    ADD.L D1,D2

    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 000B: ldc.i4.s
    MOVE.L #58,D2  ; Load short constant

    ; Offset 000D: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0012: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0013: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0018: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001D: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 001E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_Addition_Overflow:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4
    MOVE.L #2147483647,D0  ; Load constant

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.i4.1
    MOVE.L #1,D0         ; Load 1

    ; Offset 0008: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0009: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000A: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000B: add
    MOVE.L D0,D2
    ADD.L D1,D2

    ; Offset 000C: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 000D: ldc.i4
    MOVE.L #-2147483648,D2  ; Load constant

    ; Offset 0012: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0017: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0018: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 001D: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0022: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 0023: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_Subtraction_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #100,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0009: sub
    MOVE.L D0,D2
    SUB.L D1,D2

    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 000B: ldc.i4.s
    MOVE.L #58,D2  ; Load short constant

    ; Offset 000D: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0012: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0013: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0018: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001D: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 001E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_Subtraction_NegativeResult:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.s
    MOVE.L #100,D0  ; Load short constant

    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0009: sub
    MOVE.L D0,D2
    SUB.L D1,D2

    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 000B: ldc.i4.s
    MOVE.L #198,D2  ; Load short constant

    ; Offset 000D: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0012: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0013: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0018: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001D: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 001E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_Subtraction_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #214,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.s
    MOVE.L #156,D0  ; Load short constant

    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0009: sub
    MOVE.L D0,D2
    SUB.L D1,D2

    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 000B: ldc.i4.s
    MOVE.L #58,D2  ; Load short constant

    ; Offset 000D: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0012: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0013: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0018: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001D: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 001E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #12,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.7
    MOVE.L #7,D0         ; Load 7

    ; Offset 0005: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0006: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0007: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0008: mul
    MOVE.L D0,D2
    MULS.L D1,D2

    ; Offset 0009: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 000A: ldc.i4.s
    MOVE.L #84,D2  ; Load short constant

    ; Offset 000C: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0011: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0012: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0017: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001C: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 001D: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_ByZero:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 0005: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0006: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0007: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0008: mul
    MOVE.L D0,D2
    MULS.L D1,D2

    ; Offset 0009: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 000A: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 000B: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0010: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0011: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0016: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001B: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 001C: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #244,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.s
    MOVE.L #249,D0  ; Load short constant

    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0009: mul
    MOVE.L D0,D2
    MULS.L D1,D2

    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 000B: ldc.i4.s
    MOVE.L #84,D2  ; Load short constant

    ; Offset 000D: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0012: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0013: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0018: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001D: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 001E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_MixedSigns:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #12,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.s
    MOVE.L #249,D0  ; Load short constant

    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0009: mul
    MOVE.L D0,D2
    MULS.L D1,D2

    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 000B: ldc.i4.s
    MOVE.L #172,D2  ; Load short constant

    ; Offset 000D: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0012: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0013: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0018: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001D: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 001E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_Division_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #84,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.7
    MOVE.L #7,D0         ; Load 7

    ; Offset 0005: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0006: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0007: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0008: div
    MOVE.L D0,D2
    DIVS.L D1,D2

    ; Offset 0009: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 000A: ldc.i4.s
    MOVE.L #12,D2  ; Load short constant

    ; Offset 000C: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0011: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0012: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0017: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001C: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 001D: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_Division_WithRemainder:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #85,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.7
    MOVE.L #7,D0         ; Load 7

    ; Offset 0005: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0006: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0007: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0008: div
    MOVE.L D0,D2
    DIVS.L D1,D2

    ; Offset 0009: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 000A: ldc.i4.s
    MOVE.L #12,D2  ; Load short constant

    ; Offset 000C: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0011: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0012: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0017: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001C: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 001D: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_Division_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #172,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.s
    MOVE.L #249,D0  ; Load short constant

    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0009: div
    MOVE.L D0,D2
    DIVS.L D1,D2

    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 000B: ldc.i4.s
    MOVE.L #12,D2  ; Load short constant

    ; Offset 000D: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0012: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0013: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0018: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001D: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 001E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_Division_MixedSigns:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #84,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.s
    MOVE.L #249,D0  ; Load short constant

    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0009: div
    MOVE.L D0,D2
    DIVS.L D1,D2

    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 000B: ldc.i4.s
    MOVE.L #244,D2  ; Load short constant

    ; Offset 000D: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0012: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0013: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0018: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001D: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 001E: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_Remainder_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #85,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.7
    MOVE.L #7,D0         ; Load 7

    ; Offset 0005: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0006: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0007: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0008: rem
    MOVE.L D0,D0
    DIVS.L D1,D0
    MOVE.L D1,D2  ; Remainder from division

    ; Offset 0009: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D2         ; Load 1

    ; Offset 000B: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0010: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0011: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0016: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001B: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 001C: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_Remainder_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #171,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.7
    MOVE.L #7,D0         ; Load 7

    ; Offset 0005: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0006: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0007: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0008: rem
    MOVE.L D0,D0
    DIVS.L D1,D0
    MOVE.L D1,D2  ; Remainder from division

    ; Offset 0009: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 000A: ldc.i4.m1
    MOVE.L #-1,D2        ; Load -1

    ; Offset 000B: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0010: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0011: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0016: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001B: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 001C: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_BitwiseAnd:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4
    MOVE.L #172,D0  ; Load constant

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.i4
    MOVE.L #195,D0  ; Load constant

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: and
    MOVE.L D0,D2
    AND.L D1,D2

    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0011: ldc.i4
    MOVE.L #128,D2  ; Load constant

    ; Offset 0016: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 001B: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 001C: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0021: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0026: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 0027: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_BitwiseOr:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4
    MOVE.L #172,D0  ; Load constant

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.i4
    MOVE.L #195,D0  ; Load constant

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: or
    MOVE.L D0,D2
    OR.L D1,D2

    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0011: ldc.i4
    MOVE.L #239,D2  ; Load constant

    ; Offset 0016: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 001B: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 001C: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0021: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0026: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 0027: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_BitwiseXor:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4
    MOVE.L #172,D0  ; Load constant

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldc.i4
    MOVE.L #195,D0  ; Load constant

    ; Offset 000C: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000D: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: xor
    MOVE.L D0,D2
    EOR.L D1,D2

    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0011: ldc.i4.s
    MOVE.L #111,D2  ; Load short constant

    ; Offset 0013: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0018: ldloc.2
    MOVE.L -16(A6),D2  ; Load local.2

    ; Offset 0019: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 001E: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0023: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 0024: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_LeftShift:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.1
    MOVE.L #1,D0         ; Load 1

    ; Offset 0002: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0003: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0004: ldc.i4.4
    MOVE.L #4,D1         ; Load 4

    ; Offset 0005: shl
    MOVE.L D0,D2
    MOVE.L D1,D0
    ASL.L D0,D2  ; Shift left

    ; Offset 0006: stloc.1
    MOVE.L D2,-8(A6)   ; Store to local 1

    ; Offset 0007: ldc.i4.s
    MOVE.L #16,D2  ; Load short constant

    ; Offset 0009: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D2  ; Load local.1

    ; Offset 000F: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0014: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0019: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 001A: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_RightShift:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #16,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0005: ldc.i4.4
    MOVE.L #4,D1         ; Load 4

    ; Offset 0006: shr
    MOVE.L D0,D2
    MOVE.L D1,D0
    ASR.L D0,D2  ; Shift right (arithmetic)

    ; Offset 0007: stloc.1
    MOVE.L D2,-8(A6)   ; Store to local 1

    ; Offset 0008: ldc.i4.1
    MOVE.L #1,D2         ; Load 1

    ; Offset 0009: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D2  ; Load local.1

    ; Offset 000F: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0014: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0019: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 001A: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_UnaryMinus:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0005: neg
    CLR.L D1
    SUB.L D0,D1

    ; Offset 0006: stloc.1
    MOVE.L D1,-8(A6)   ; Store to local 1

    ; Offset 0007: ldc.i4.s
    MOVE.L #214,D1  ; Load short constant

    ; Offset 0009: box
    ; Box type token 01000014
    MOVE.L D1,D0     ; Boxed value

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: box
    ; Box type token 01000014
    MOVE.L D1,D0     ; Boxed value

    ; Offset 0014: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0019: stloc.2
    MOVE.L D1,-12(A6)  ; Store to local 2

    ; Offset 001A: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_ChainedOperations:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #20,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #10,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.s
    MOVE.L #20,D0  ; Load short constant

    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0007: ldc.i4.3
    MOVE.L #3,D0         ; Load 3

    ; Offset 0008: stloc.2
    MOVE.L D0,-12(A6)  ; Store to local 2

    ; Offset 0009: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000A: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000B: add
    MOVE.L D0,D2
    ADD.L D1,D2

    ; Offset 000C: ldloc.2
    MOVE.L -16(A6),D1  ; Load local.2

    ; Offset 000D: mul
    MOVE.L D2,D0
    MULS.L D1,D0

    ; Offset 000E: ldc.i4.5
    MOVE.L #5,D1         ; Load 5

    ; Offset 000F: sub
    MOVE.L D0,D2
    SUB.L D1,D2

    ; Offset 0010: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 0011: ldc.i4.s
    MOVE.L #85,D2  ; Load short constant

    ; Offset 0013: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0018: ldloc.3
    MOVE.L -20(A6),D2  ; Load local.3

    ; Offset 0019: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 001E: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0023: stloc.s
    MOVE.L D2,-20(A6)  ; Store to local 4

    ; Offset 0025: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_DivideByZeroThrows:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 0005: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0006: ldc.i4.1
    MOVE.L #1,D0         ; Load 1

    ; Offset 0007: stloc.2
    MOVE.L D0,-12(A6)  ; Store to local 2

    ; Offset 0008: nop
    ; NOP

    ; Offset 0009: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000A: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000B: div
    MOVE.L D0,D2
    DIVS.L D1,D2

    ; Offset 000C: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 000D: nop
    ; NOP

    ; Offset 000E: leave.s
    BRA L_0017  ; leave - exit exception handler

    ; Offset 0010: pop
    ; WARNING: Pop on empty stack

    ; Offset 0011: nop
    ; NOP

    ; Offset 0012: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 0013: stloc.2
    MOVE.L D0,-12(A6)  ; Store to local 2

    ; Offset 0014: nop
    ; NOP

    ; Offset 0015: leave.s
    BRA L_0017  ; leave - exit exception handler

    ; Offset 0017: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.IntegerMathTests_ModuloByZeroThrows:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 0005: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0006: ldc.i4.1
    MOVE.L #1,D0         ; Load 1

    ; Offset 0007: stloc.2
    MOVE.L D0,-12(A6)  ; Store to local 2

    ; Offset 0008: nop
    ; NOP

    ; Offset 0009: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 000A: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000B: rem
    MOVE.L D0,D0
    DIVS.L D1,D0
    MOVE.L D1,D2  ; Remainder from division

    ; Offset 000C: stloc.3
    MOVE.L D2,-16(A6)  ; Store to local 3

    ; Offset 000D: nop
    ; NOP

    ; Offset 000E: leave.s
    BRA L_0017  ; leave - exit exception handler

    ; Offset 0010: pop
    ; WARNING: Pop on empty stack

    ; Offset 0011: nop
    ; NOP

    ; Offset 0012: ldc.i4.0
    CLR.L D0             ; Load 0

    ; Offset 0013: stloc.2
    MOVE.L D0,-12(A6)  ; Store to local 2

    ; Offset 0014: nop
    ; NOP

    ; Offset 0015: leave.s
    BRA L_0017  ; leave - exit exception handler

    ; Offset 0017: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS


; Methods of JumpCS.TestMath.Tests.TypeConversionTests
JumpCS.TestMath.Tests.TypeConversionTests_IntToFloat:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0005: conv.r4
    MOVE.L D0,D1  ; Convert to R4

    ; Offset 0006: stloc.1
    MOVE.L D1,-8(A6)   ; Store to local 1

    ; Offset 0007: ldc.r4
    LEA FLOAT_CONST_0007(PC),A0
    MOVE.L (A0),D1

    ; Offset 000C: box
    ; Box type token 01000012
    MOVE.L D1,D0     ; Boxed value

    ; Offset 0011: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0012: box
    ; Box type token 01000012
    MOVE.L D1,D0     ; Boxed value

    ; Offset 0017: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001C: stloc.2
    MOVE.L D1,-12(A6)  ; Store to local 2

    ; Offset 001D: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.TypeConversionTests_IntToDouble:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0005: conv.r8
    MOVE.L D0,D1  ; Convert to R8 (high word)
    CLR.L D2          ; Convert to R8 (low word)

    ; Offset 0006: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D2,-12(A6)   ; Store to local 1 (low)

    ; Offset 0007: ldc.r8
    LEA DOUBLE_CONST_0007(PC),A0
    MOVE.L (A0),D2     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 0010: box
    ; Box type token 01000013
    MOVE.L D1,D0     ; Boxed value

    ; Offset 0015: ldloc.1
    MOVE.L -12(A6),D1      ; Load local.1 (high)
    MOVE.L -8(A6),D1  ; Load local.1 (low)

    ; Offset 0016: box
    ; Box type token 01000013
    MOVE.L D1,D0     ; Boxed value

    ; Offset 001B: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0020: stloc.2
    MOVE.L D1,-12(A6)  ; Store to local 2

    ; Offset 0021: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.TypeConversionTests_IntToDecimal:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0005: call
    ; System.Decimal.op_Implicit (inline)
    ; Decimal.op_Implicit (inline)
    MOVE.L D0,D0       ; Decimal.op_Implicit: convert to decimal (simplified)

    ; Offset 000A: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000B: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 000D: newobj
    ; System.Decimal newobj - create new instance (1 parameters)
    ; TODO: Decimal newobj with 1 parameters (expected 5)

    ; Offset 0012: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0013: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A0    ; A0 = address of left operand
    MOVE.L D1,A1  ; A1 = address of right operand
    MOVE.L #1,D2     ; Assume equal
    MOVE.L (A0),D3    ; Load left flags
    CMP.L (A1),D3    ; Compare flags
    BNE .NotEqual_L_150
    MOVE.L 4(A0),D3   ; Load left high
    CMP.L 4(A1),D3   ; Compare high
    BNE .NotEqual_L_150
    MOVE.L 8(A0),D3   ; Load left low
    CMP.L 8(A1),D3   ; Compare low
    BNE .NotEqual_L_150
    MOVE.L 12(A0),D3  ; Load left mid
    CMP.L 12(A1),D3  ; Compare mid
    BNE .NotEqual_L_150
    BRA .Done_L_151
.NotEqual_L_150:
    MOVE.L #0,D2     ; Not equal
.Done_L_151:

    ; Offset 0018: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0019: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.TypeConversionTests_FloatToInt:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: conv.i4
    MOVE.L D0,D1  ; Convert to I4

    ; Offset 0009: stloc.1
    MOVE.L D1,-8(A6)   ; Store to local 1

    ; Offset 000A: ldc.i4.s
    MOVE.L #42,D1  ; Load short constant

    ; Offset 000C: box
    ; Box type token 01000014
    MOVE.L D1,D0     ; Boxed value

    ; Offset 0011: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0012: box
    ; Box type token 01000014
    MOVE.L D1,D0     ; Boxed value

    ; Offset 0017: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001C: stloc.2
    MOVE.L D1,-12(A6)  ; Store to local 2

    ; Offset 001D: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.TypeConversionTests_FloatToDouble:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: conv.r8
    MOVE.L D0,D1  ; Convert to R8 (high word)
    CLR.L D2          ; Convert to R8 (low word)

    ; Offset 0009: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D2,-12(A6)   ; Store to local 1 (low)

    ; Offset 000A: ldc.r8
    LEA DOUBLE_CONST_000A(PC),A0
    MOVE.L (A0),D2     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 0013: box
    ; Box type token 01000013
    MOVE.L D1,D0     ; Boxed value

    ; Offset 0018: ldloc.1
    MOVE.L -12(A6),D1      ; Load local.1 (high)
    MOVE.L -8(A6),D1  ; Load local.1 (low)

    ; Offset 0019: ldc.i4.5
    MOVE.L #5,D3         ; Load 5

    ; Offset 001A: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D1:D1, D3) - double precision rounding
    ; TODO: Implement IEEE double rounding to D3 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D1,D4  ; Copy high word
    MOVE.L D1,D5    ; Copy low word

    ; Offset 001F: box
    ; Box type token 01000013
    MOVE.L D5,D0     ; Boxed value

    ; Offset 0024: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0029: stloc.2
    MOVE.L D5,-12(A6)  ; Store to local 2

    ; Offset 002A: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.TypeConversionTests_FloatToDecimal:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r4
    LEA FLOAT_CONST_0001(PC),A0
    MOVE.L (A0),D0

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: call
    ; System.Decimal.op_Explicit (inline)
    ; Decimal.op_Explicit (inline)
    MOVE.L D0,D0       ; Decimal.op_Explicit: convert from decimal (simplified)

    ; Offset 000D: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D0  ; Load local.1

    ; Offset 000F: ldc.i4
    MOVE.L #425,D1  ; Load constant

    ; Offset 0014: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0015: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0016: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0017: ldc.i4.1
    MOVE.L #1,D5         ; Load 1

    ; Offset 0018: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D5   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_152
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_152:
    MOVE.L D5,(A0)      ; Store flags at offset 0
    MOVE.L D3,4(A0)          ; Store high at offset 4
    MOVE.L D1,8(A0)          ; Store low at offset 8
    MOVE.L D2,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D6   ; Convert address to data register

    ; Offset 001D: call
    ; System.Decimal.op_Subtraction (inline)
    ; System.Decimal op_Subtraction inline
    MOVE.L D0,A0    ; A0 = address of left operand
    MOVE.L D6,A1  ; A1 = address of right operand
    LEA -16(A6),A2        ; A2 = address of result
    MOVE.L 8(A0),D5   ; Load left low
    MOVE.L 8(A1),D7  ; Load right low
    SUB.L D7,D5           ; Subtract low parts
    MOVE.L D5,8(A2) ; Store result low (address preserved)
    MOVE.L 12(A0),D5  ; Load left mid
    MOVE.L 12(A1),D7 ; Load right mid
    SUBX.L D7,D5          ; Subtract mid parts with borrow
    MOVE.L D5,12(A2) ; Store result mid (address preserved)
    MOVE.L 4(A0),D5   ; Load left high
    MOVE.L 4(A1),D7  ; Load right high
    SUBX.L D7,D5          ; Subtract high parts with borrow
    MOVE.L D5,4(A2) ; Store result high (address preserved)
    MOVE.L (A0),D5    ; Load left flags
    MOVE.L D5,(A2)  ; Store result flags (address preserved)
    MOVE.L A2,D7 ; Convert address to data register for return

    ; Offset 0022: call
    ; Decimal.Abs(D7)
    ; TODO: Implement decimal absolute value
    MOVE.L D7,D7

    ; Offset 0027: ldc.i4.1
    MOVE.L #1,D0         ; Load 1

    ; Offset 0028: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0029: ldc.i4.0
    CLR.L D6             ; Load 0

    ; Offset 002A: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 002B: ldc.i4.2
    MOVE.L #2,D4         ; Load 2

    ; Offset 002C: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A2  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A2, lo=D0, mid=D5, hi=D6, sign=D1, scale=D4
    CLR.L D3           ; Clear flags
    AND.L #0xFF,D4      ; Ensure scale is 0-255
    LSL.L #16,D4        ; Shift scale to bits 16-23
    OR.L D4,D3   ; Set scale in flags
    TST.L D1        ; Check if negative
    BEQ .SkipNegative_L_153
    OR.L #0x80000000,D3 ; Set sign bit if negative
.SkipNegative_L_153:
    MOVE.L D3,(A2)      ; Store flags at offset 0
    MOVE.L D6,4(A2)          ; Store high at offset 4
    MOVE.L D0,8(A2)          ; Store low at offset 8
    MOVE.L D5,12(A2)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A2,D2   ; Convert address to data register

    ; Offset 0031: call
    ; System.Decimal.op_LessThan (inline)
    ; System.Decimal op_LessThan inline
    MOVE.L D7,A2    ; A2 = address of left operand
    MOVE.L D2,A1  ; A1 = address of right operand
    CLR.L D3     ; Assume not less than (default: 0)
    MOVE.L (A2),D1    ; Load left flags
    MOVE.L (A1),D4          ; Load right flags
    TST.L D1                     ; Check left sign (bit 31)
    BPL .LeftPositive_L_154
    TST.L D4
    BMI .BothNegative_L_154   ; Both negative, compare magnitude
    MOVE.L #1,D3              ; Left negative, right positive: left < right
    BRA .Done_L_156
.LeftPositive_L_154:
    TST.L D4
    BMI .Done_L_156              ; Left positive, right negative: left >= right (return 0)
.BothNegative_L_154:
    MOVE.L 4(A2),D1   ; Load left high
    CMP.L 4(A1),D1   ; Compare high
    BLT .IsLessThan_L_154
    BGT .Done_L_156              ; If left high > right high, not less
    MOVE.L 12(A2),D1  ; Load left mid
    CMP.L 12(A1),D1  ; Compare mid
    BLT .IsLessThan_L_154
    BGT .Done_L_156
    MOVE.L 8(A2),D1   ; Load left low
    CMP.L 8(A1),D1   ; Compare low
    BLT .IsLessThan_L_154
    BRA .Done_L_156
.IsLessThan_L_154:
    MOVE.L #1,D3              ; Left < Right
.Done_L_156:

    ; Offset 0036: stloc.2
    MOVE.L D3,-12(A6)  ; Store to local 2

    ; Offset 0037: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.TypeConversionTests_DoubleToInt:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldloc.0
    MOVE.L -8(A6),D1      ; Load local.0 (high)
    MOVE.L -4(A6),D0  ; Load local.0 (low)

    ; Offset 000C: conv.i4
    MOVE.L D0,D2  ; Convert to I4

    ; Offset 000D: stloc.1
    MOVE.L D2,-8(A6)   ; Store to local 1

    ; Offset 000E: ldc.i4.s
    MOVE.L #42,D2  ; Load short constant

    ; Offset 0010: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0015: ldloc.1
    MOVE.L -12(A6),D2  ; Load local.1

    ; Offset 0016: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 001B: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0020: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 0021: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.TypeConversionTests_DoubleToFloat:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldloc.0
    MOVE.L -8(A6),D1      ; Load local.0 (high)
    MOVE.L -4(A6),D0  ; Load local.0 (low)

    ; Offset 000C: conv.r4
    MOVE.L D0,D2  ; Convert to R4

    ; Offset 000D: stloc.1
    MOVE.L D2,-8(A6)   ; Store to local 1

    ; Offset 000E: ldc.r4
    LEA FLOAT_CONST_000E(PC),A0
    MOVE.L (A0),D2

    ; Offset 0013: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0018: ldloc.1
    MOVE.L -12(A6),D2  ; Load local.1

    ; Offset 0019: conv.r8
    MOVE.L D2,D2  ; Convert to R8 (high word)
    CLR.L D3          ; Convert to R8 (low word)

    ; Offset 001A: ldc.i4.5
    MOVE.L #5,D4         ; Load 5

    ; Offset 001B: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D2:D3, D4) - double precision rounding
    ; TODO: Implement IEEE double rounding to D4 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D2,D4  ; Copy high word
    MOVE.L D3,D5    ; Copy low word

    ; Offset 0020: box
    ; Box type token 01000013
    MOVE.L D5,D0     ; Boxed value

    ; Offset 0025: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 002A: stloc.2
    MOVE.L D5,-12(A6)  ; Store to local 2

    ; Offset 002B: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.TypeConversionTests_DoubleToDecimal:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 000A: stloc.0
    MOVE.L D0,-4(A6)    ; Store to local 0 (high)
    MOVE.L D1,-8(A6)    ; Store to local 0 (low)

    ; Offset 000B: ldloc.0
    MOVE.L -8(A6),D1      ; Load local.0 (high)
    MOVE.L -4(A6),D0  ; Load local.0 (low)

    ; Offset 000C: call
    ; System.Decimal.op_Explicit (inline)
    ; Decimal.op_Explicit (inline)
    MOVE.L D0,D0       ; Decimal.op_Explicit: convert from decimal (simplified)

    ; Offset 0011: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0012: ldc.i4
    MOVE.L #425,D0  ; Load constant

    ; Offset 0017: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0018: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D5         ; Load 1

    ; Offset 001B: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D0, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D5           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D5   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_157
    OR.L #0x80000000,D5 ; Set sign bit if negative
.SkipNegative_L_157:
    MOVE.L D5,(A0)      ; Store flags at offset 0
    MOVE.L D3,4(A0)          ; Store high at offset 4
    MOVE.L D0,8(A0)          ; Store low at offset 8
    MOVE.L D2,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D6   ; Convert address to data register

    ; Offset 0020: ldloc.1
    MOVE.L -12(A6),D5  ; Load local.1

    ; Offset 0021: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D6,A0    ; A0 = address of left operand
    MOVE.L D5,A1  ; A1 = address of right operand
    MOVE.L #1,D7     ; Assume equal
    MOVE.L (A0),D7    ; Load left flags
    CMP.L (A1),D7    ; Compare flags
    BNE .NotEqual_L_158
    MOVE.L 4(A0),D7   ; Load left high
    CMP.L 4(A1),D7   ; Compare high
    BNE .NotEqual_L_158
    MOVE.L 8(A0),D7   ; Load left low
    CMP.L 8(A1),D7   ; Compare low
    BNE .NotEqual_L_158
    MOVE.L 12(A0),D7  ; Load left mid
    CMP.L 12(A1),D7  ; Compare mid
    BNE .NotEqual_L_158
    BRA .Done_L_159
.NotEqual_L_158:
    MOVE.L #0,D7     ; Not equal
.Done_L_159:

    ; Offset 0026: stloc.2
    MOVE.L D7,-12(A6)  ; Store to local 2

    ; Offset 0027: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.TypeConversionTests_DecimalToInt:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #427,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.1
    MOVE.L #1,D5         ; Load 1

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_160
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_160:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0012: call
    ; System.Decimal.op_Explicit (inline)
    ; Decimal.op_Explicit (inline)
    MOVE.L D0,D0       ; Decimal.op_Explicit: convert from decimal (simplified)

    ; Offset 0017: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0018: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 001A: box
    ; Box type token 01000014
    MOVE.L D0,D0     ; Boxed value

    ; Offset 001F: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0020: box
    ; Box type token 01000014
    MOVE.L D1,D0     ; Boxed value

    ; Offset 0025: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 002A: stloc.2
    MOVE.L D1,-12(A6)  ; Store to local 2

    ; Offset 002B: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.TypeConversionTests_DecimalToFloat:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #425,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.1
    MOVE.L #1,D5         ; Load 1

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_161
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_161:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0012: call
    ; System.Decimal.op_Explicit (inline)
    ; Decimal.op_Explicit (inline)
    MOVE.L D0,D0       ; Decimal.op_Explicit: convert from decimal (simplified)

    ; Offset 0017: conv.r4
    MOVE.L D0,D0  ; Convert to R4

    ; Offset 0018: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0019: ldc.r4
    LEA FLOAT_CONST_0019(PC),A0
    MOVE.L (A0),D0

    ; Offset 001E: box
    ; Box type token 01000012
    MOVE.L D0,D0     ; Boxed value

    ; Offset 0023: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0024: conv.r8
    MOVE.L D1,D1  ; Convert to R8 (high word)
    CLR.L D1          ; Convert to R8 (low word)

    ; Offset 0025: ldc.i4.1
    MOVE.L #1,D2         ; Load 1

    ; Offset 0026: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D1:D1, D2) - double precision rounding
    ; TODO: Implement IEEE double rounding to D2 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D1,D2  ; Copy high word
    MOVE.L D1,D3    ; Copy low word

    ; Offset 002B: box
    ; Box type token 01000013
    MOVE.L D3,D0     ; Boxed value

    ; Offset 0030: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0035: stloc.2
    MOVE.L D3,-12(A6)  ; Store to local 2

    ; Offset 0036: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.TypeConversionTests_DecimalToDouble:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldloca.s
    LEA -8(A6),A0  ; Load address of local.0
    MOVE.L A0,D0

    ; Offset 0003: ldc.i4
    MOVE.L #425,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.1
    MOVE.L #1,D5         ; Load 1

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    MOVE.L D0,A0 ; A0 = address of this
    ; System.Decimal constructor inline
    ; this @ A0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D6           ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D6   ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_162
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_162:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0012: call
    ; System.Decimal.op_Explicit (inline)
    ; Decimal.op_Explicit (inline)
    MOVE.L D0,D0       ; Decimal.op_Explicit: convert from decimal (simplified)
    CLR.L D1              ; Decimal.op_Explicit: low word (simplified 64-bit)

    ; Offset 0017: conv.r8
    MOVE.L D1,D1  ; Convert to R8 (high word)
    CLR.L D1          ; Convert to R8 (low word)

    ; Offset 0018: stloc.1
    MOVE.L D1,-8(A6)    ; Store to local 1 (high)
    MOVE.L D1,-12(A6)   ; Store to local 1 (low)

    ; Offset 0019: ldc.r8
    LEA DOUBLE_CONST_0019(PC),A0
    MOVE.L (A0),D1     ; Double high word
    MOVE.L 4(A0),D1    ; Double low word

    ; Offset 0022: box
    ; Box type token 01000013
    MOVE.L D1,D0     ; Boxed value

    ; Offset 0027: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D2  ; Load local.1 (low)

    ; Offset 0028: ldc.i4.5
    MOVE.L #5,D3         ; Load 5

    ; Offset 0029: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D2:D2, D3) - double precision rounding
    ; TODO: Implement IEEE double rounding to D3 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D2,D3  ; Copy high word
    MOVE.L D2,D4    ; Copy low word

    ; Offset 002E: box
    ; Box type token 01000013
    MOVE.L D4,D0     ; Boxed value

    ; Offset 0033: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0038: stloc.2
    MOVE.L D4,-12(A6)  ; Store to local 2

    ; Offset 0039: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.TypeConversionTests_ByteToInt:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0005: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0006: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 0008: box
    ; Box type token 01000014
    MOVE.L D0,D0     ; Boxed value

    ; Offset 000D: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000E: box
    ; Box type token 01000014
    MOVE.L D1,D0     ; Boxed value

    ; Offset 0013: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0018: stloc.2
    MOVE.L D1,-12(A6)  ; Store to local 2

    ; Offset 0019: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.TypeConversionTests_IntToByte_WithOverflow:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4
    MOVE.L #300,D0  ; Load constant

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: conv.u1
    MOVE.L D0,D1
    ANDI.L #$FF,D1   ; Conv_U1: mask to unsigned byte

    ; Offset 0009: stloc.1
    MOVE.L D1,-8(A6)   ; Store to local 1

    ; Offset 000A: ldc.i4.s
    MOVE.L #44,D1  ; Load short constant

    ; Offset 000C: box
    ; Box type token 01000014
    MOVE.L D1,D0     ; Boxed value

    ; Offset 0011: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0012: box
    ; Box type token 01000015
    MOVE.L D1,D0     ; Boxed value

    ; Offset 0017: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001C: stloc.2
    MOVE.L D1,-12(A6)  ; Store to local 2

    ; Offset 001D: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.TypeConversionTests_ShortToInt:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4
    MOVE.L #1000,D0  ; Load constant

    ; Offset 0006: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0007: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0008: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0009: ldc.i4
    MOVE.L #1000,D0  ; Load constant

    ; Offset 000E: box
    ; Box type token 01000014
    MOVE.L D0,D0     ; Boxed value

    ; Offset 0013: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0014: box
    ; Box type token 01000014
    MOVE.L D1,D0     ; Boxed value

    ; Offset 0019: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001E: stloc.2
    MOVE.L D1,-12(A6)  ; Store to local 2

    ; Offset 001F: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.TypeConversionTests_LongToInt:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 0003: conv.i8
    MOVE.L D0,D2  ; Conv_I8: low word = original value
    MOVE.L D0,D1  ; Conv_I8: copy for sign extension
    ASR.L #8,D1
    ASR.L #8,D1
    ASR.L #8,D1
    ASR.L #7,D1       ; Sign-extend to 32 bits (high word)

    ; Offset 0004: stloc.0
    MOVE.L D2,-4(A6)   ; Store to local 0

    ; Offset 0005: ldloc.0
    MOVE.L -8(A6),D2  ; Load local.0

    ; Offset 0006: conv.i4
    MOVE.L D2,D0  ; Convert to I4

    ; Offset 0007: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0008: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 000A: box
    ; Box type token 01000014
    MOVE.L D0,D0     ; Boxed value

    ; Offset 000F: ldloc.1
    MOVE.L -12(A6),D2  ; Load local.1

    ; Offset 0010: box
    ; Box type token 01000014
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0015: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2

    ; Offset 001B: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.TypeConversionTests_IntToLong:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0005: conv.i8
    MOVE.L D0,D2  ; Conv_I8: low word = original value
    MOVE.L D0,D1  ; Conv_I8: copy for sign extension
    ASR.L #8,D1
    ASR.L #8,D1
    ASR.L #8,D1
    ASR.L #7,D1       ; Sign-extend to 32 bits (high word)

    ; Offset 0006: stloc.1
    MOVE.L D2,-8(A6)   ; Store to local 1

    ; Offset 0007: ldc.i4.s
    MOVE.L #42,D2  ; Load short constant

    ; Offset 0009: conv.i8
    MOVE.L D2,D3  ; Conv_I8: low word = original value
    MOVE.L D2,D0  ; Conv_I8: copy for sign extension
    ASR.L #8,D0
    ASR.L #8,D0
    ASR.L #8,D0
    ASR.L #7,D0       ; Sign-extend to 32 bits (high word)

    ; Offset 000A: box
    ; Box type token 01000016
    MOVE.L D3,D0     ; Boxed value

    ; Offset 000F: ldloc.1
    MOVE.L -12(A6),D3  ; Load local.1

    ; Offset 0010: box
    ; Box type token 01000016
    MOVE.L D3,D0     ; Boxed value

    ; Offset 0015: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001A: stloc.2
    MOVE.L D3,-12(A6)  ; Store to local 2

    ; Offset 001B: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.TypeConversionTests_NegativeIntToUnsigned:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.m1
    MOVE.L #-1,D0        ; Load -1

    ; Offset 0002: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0003: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0004: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0005: ldc.i4.m1
    MOVE.L #-1,D0        ; Load -1

    ; Offset 0006: box
    ; Box type token 01000017
    MOVE.L D0,D0     ; Boxed value

    ; Offset 000B: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000C: box
    ; Box type token 01000017
    MOVE.L D1,D0     ; Boxed value

    ; Offset 0011: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0016: stloc.2
    MOVE.L D1,-12(A6)  ; Store to local 2

    ; Offset 0017: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.TypeConversionTests_ChainedConversions:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #20,A7

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0004: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0005: conv.r4
    MOVE.L D0,D1  ; Convert to R4

    ; Offset 0006: stloc.1
    MOVE.L D1,-8(A6)   ; Store to local 1

    ; Offset 0007: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0008: conv.r8
    MOVE.L D1,D0  ; Convert to R8 (high word)
    CLR.L D2          ; Convert to R8 (low word)

    ; Offset 0009: stloc.2
    MOVE.L D0,-12(A6)   ; Store to local 2 (high)
    MOVE.L D2,-16(A6)   ; Store to local 2 (low)

    ; Offset 000A: ldloc.2
    MOVE.L -16(A6),D2      ; Load local.2 (high)
    MOVE.L -12(A6),D0  ; Load local.2 (low)

    ; Offset 000B: call
    ; System.Decimal.op_Explicit (inline)
    ; Decimal.op_Explicit (inline)
    MOVE.L D0,D0       ; Decimal.op_Explicit: convert from decimal (simplified)

    ; Offset 0010: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3

    ; Offset 0011: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 0013: newobj
    ; System.Decimal newobj - create new instance (1 parameters)
    ; TODO: Decimal newobj with 1 parameters (expected 5)

    ; Offset 0018: ldloc.3
    MOVE.L -20(A6),D1  ; Load local.3

    ; Offset 0019: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D0,A0    ; A0 = address of left operand
    MOVE.L D1,A1  ; A1 = address of right operand
    MOVE.L #1,D3     ; Assume equal
    MOVE.L (A0),D4    ; Load left flags
    CMP.L (A1),D4    ; Compare flags
    BNE .NotEqual_L_163
    MOVE.L 4(A0),D4   ; Load left high
    CMP.L 4(A1),D4   ; Compare high
    BNE .NotEqual_L_163
    MOVE.L 8(A0),D4   ; Load left low
    CMP.L 8(A1),D4   ; Compare low
    BNE .NotEqual_L_163
    MOVE.L 12(A0),D4  ; Load left mid
    CMP.L 12(A1),D4  ; Compare mid
    BNE .NotEqual_L_163
    BRA .Done_L_164
.NotEqual_L_163:
    MOVE.L #0,D3     ; Not equal
.Done_L_164:

    ; Offset 001E: stloc.s
    MOVE.L D3,-20(A6)  ; Store to local 4

    ; Offset 0020: ret
    MOVE.L D2,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS



    ; --- Constants Section ---
DOUBLE_CONST_0001:
    DC.L $00000000
    DC.L $40454000
DOUBLE_CONST_0007:
    DC.L $00000000
    DC.L $40450000
DOUBLE_CONST_000A:
    DC.L $00000000
    DC.L $40454000
DOUBLE_CONST_000B:
    DC.L $CCCCCCCD
    DC.L $FFFFFFFF
DOUBLE_CONST_000E:
    DC.L $00000000
    DC.L $C0454000
DOUBLE_CONST_0010:
    DC.L $00000000
    DC.L $3FF00000
DOUBLE_CONST_0012:
    DC.L $00000000
    DC.L $3FF00000
DOUBLE_CONST_0015:
    DC.L $00000000
    DC.L $40080000
DOUBLE_CONST_0019:
    DC.L $00000000
    DC.L $40454000
DOUBLE_CONST_001A:
    DC.L $66666666
    DC.L $3FF66666
DOUBLE_CONST_001D:
    DC.L $00000000
    DC.L $40700000
DOUBLE_CONST_0024:
    DC.L $CCCCCCCD
    DC.L $FFFFFFFF
DOUBLE_CONST_0026:
    DC.L $9999999A
    DC.L $FFFFFFFF
DOUBLE_CONST_0030:
    DC.L $F5C28F5C
    DC.L $FFFFFFFF
DOUBLE_CONST_003C:
    DC.L $A3D70A3D
    DC.L $FFFFFFFF
FLOAT_CONST_0001:
    DC.L $422A0000
FLOAT_CONST_0007:
    DC.L $42280000
FLOAT_CONST_000A:
    DC.L $C22A0000
FLOAT_CONST_000D:
    DC.L $40400000
FLOAT_CONST_000E:
    DC.L $422A0000
FLOAT_CONST_0010:
    DC.L $41400000
FLOAT_CONST_0011:
    DC.L $C1400000
FLOAT_CONST_0012:
    DC.L $3FB33333
FLOAT_CONST_0018:
    DC.L $40A66666
FLOAT_CONST_0019:
    DC.L $422A0000
FLOAT_CONST_001A:
    DC.L $3FCCCCCD
FLOAT_CONST_0020:
    DC.L $42AE6148
FLOAT_CONST_0028:
    DC.L $42AE6B85

    ; --- Data Section ---
    SECTION DATA

JumpCS.TestMath.Program_vtable:
    DC.L JumpCS.TestMath.Program         ; Class pointer

JumpCS.TestMath.Tests.DecimalMathTests_vtable:
    DC.L JumpCS.TestMath.Tests.DecimalMathTests         ; Class pointer

JumpCS.TestMath.Tests.DoubleMathTests_vtable:
    DC.L JumpCS.TestMath.Tests.DoubleMathTests         ; Class pointer

JumpCS.TestMath.Tests.FloatMathTests_vtable:
    DC.L JumpCS.TestMath.Tests.FloatMathTests         ; Class pointer

JumpCS.TestMath.Tests.IntegerMathTests_vtable:
    DC.L JumpCS.TestMath.Tests.IntegerMathTests         ; Class pointer

JumpCS.TestMath.Tests.TypeConversionTests_vtable:
    DC.L JumpCS.TestMath.Tests.TypeConversionTests         ; Class pointer

    END
