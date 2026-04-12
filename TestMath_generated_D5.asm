; Generated 68000 Assembly Code
; Converted from C# MSIL
; Generated: 2026-04-12 01:16:35

    ; --- Code Section ---
    SECTION CODE

    ; --- Class Definitions ---
; Class: JumpCS.TestMath.Program
    CLASS_0 EQU 0
    CLASS_SIZE_0 EQU 0
; Class: JumpCS.TestMath.Tests.DoubleMathTests
    CLASS_1 EQU 1
    CLASS_SIZE_1 EQU 0

    ; --- Class Table ---
CLASS_TABLE:
    DC.L JumpCS.TestMath.Program_vtable     ; Class JumpCS.TestMath.Program
    DC.L 0             ; Instance size
    DC.L JumpCS.TestMath.Tests.DoubleMathTests_vtable     ; Class JumpCS.TestMath.Tests.DoubleMathTests
    DC.L 0             ; Instance size

    ; --- Method Implementations ---
; Methods of JumpCS.TestMath.Program
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

JumpCS.TestMath.Program_Main:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: call
    ; Call JumpCS.TestMath.Program.AllDoubleMathTests()V
    JSR JumpCS.TestMath.Program_AllDoubleMathTests

    ; Offset 0006: nop
    ; NOP

    ; Offset 0007: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS


; Methods of JumpCS.TestMath.Tests.DoubleMathTests
JumpCS.TestMath.Tests.DoubleMathTests_Addition_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7

    ; Offset 0000: nops
    ; NOP

    ; Offset 0001: ldc.r8
    LEA DOUBLE_CONST_0001(PC),A0
    MOVE.L (A0),D0
    MOVE.L 4(A0),D1

    ; Offset 000A: stloc.0
    MOVE.L D1,-8(A6)  ; Store local.0

    ; Offset 000B: ldc.r8
    LEA DOUBLE_CONST_000B(PC),A0
    MOVE.L (A0),D2
    MOVE.L 4(A0),D3

    ; Offset 0014: stloc.1
    MOVE.L D3,-12(A6)  ; Store local.1

    ; Offset 0015: ldloc.0
    MOVE.L -8(A6),D4  ; Load local.0

    ; Offset 0016: ldloc.1
    MOVE.L -12(A6),D5  ; Load local.1
