; Generated 68000 Assembly Code
; Converted from C# MSIL
; Generated: 2026-04-11 14:52:17

    ; --- Code Section ---
    SECTION CODE

    ; --- Class Definitions ---
; Class: JumpCS.TestMath.Program
    CLASS_0 EQU 0
    CLASS_SIZE_0 EQU 0
; Class: JumpCS.TestMath.Tests.FloatMathTests
    CLASS_1 EQU 1
    CLASS_SIZE_1 EQU 0

    ; --- Class Table ---
CLASS_TABLE:
    DC.L JumpCS.TestMath.Program_vtable     ; Class JumpCS.TestMath.Program
    DC.L 0             ; Instance size
    DC.L JumpCS.TestMath.Tests.FloatMathTests_vtable     ; Class JumpCS.TestMath.Tests.FloatMathTests
    DC.L 0             ; Instance size

    ; --- Method Implementations ---
; Methods of JumpCS.TestMath.Program
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

JumpCS.TestMath.Program_Main:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer

    ; Offset 0000: nop
    ; NOP

    ; Offset 0001: call
    ; Call JumpCS.TestMath.Program.AllFloatMathTests()V
    JSR JumpCS.TestMath.Program_AllFloatMathTests

    ; Offset 0006: nop
    ; NOP

    ; Offset 0007: ret
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
    ; WARNING: ldc.r4 operand type: null
    CLR.L D0  ; TODO: Load float constant

    ; Offset 0002: nop
    ; NOP

    ; Offset 0003: nop
    ; NOP

    ; Offset 0004: ret

    ; Offset 0005: bgt.un
    ; WARNING: Bgt_Un with insufficient stack depth (0)

    ; Offset 000A: conv.i4
    ; WARNING: Conv_I4 with empty stack

    ; Offset 000B: bgt.un
    ; WARNING: Bgt_Un with insufficient stack depth (0)

    ; Offset 0010: stloc.2
    ; WARNING: Stloc_2 with empty stack

    ; Offset 0011: ldc.r4
    ; WARNING: ldc.r4 operand type: null
    CLR.L D1  ; TODO: Load float constant

    ; Offset 0012: ldelem.ref
    ; TODO: Unimplemented opcode ldelem.ref
    CLR.L D2  ; TODO: Placeholder value

    ; Offset 0013: ldelem.r8
    ; TODO: Unimplemented opcode ldelem.r8
    CLR.L D3  ; TODO: Placeholder value

    ; Offset 0014: nop
    ; NOP

    ; Offset 0015: bgt.un
    CMP.L D3,D2
    BHI L_12A6  ; Branch if greater than (unsigned)

    ; Offset 001A: break
    ; TODO: Unimplemented opcode break

    ; Offset 001B: ldloc.2
    MOVE.L -12(A6),D4  ; Load local 2

    ; Offset 001C: conv.r8
    MOVE.L D4,D5  ; Convert to R8 (high word)
    CLR.L D6          ; Convert to R8 (low word)

    ; Offset 001D: ldc.i4.2
    MOVE.L #2,D7         ; Load 2

    ; Offset 001E: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D5:D6, D7) - double precision rounding
    ; TODO: Implement IEEE double rounding to D7 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D5,D0  ; Copy high word
    MOVE.L D6,D2    ; Copy low word

    ; Offset 0023: box
    ; Box type token 01000013
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0028: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 002D: stloc.3
    MOVE.L D3,-16(A6)  ; Store to local 3

    ; Offset 002E: ret
    MOVE.L D1,D0  ; Move return value to D0


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
    ; WARNING: ldc.r4 operand type: null
    CLR.L D0  ; TODO: Load float constant

    ; Offset 0002: nop
    ; NOP

    ; Offset 0003: nop
    ; NOP

    ; Offset 0004: ret

    ; Offset 0005: refanyval
    ; TODO: Unimplemented opcode refanyval

    ; Offset 000A: conv.i4
    ; WARNING: Conv_I4 with empty stack

    ; Offset 000B: refanyval
    ; TODO: Unimplemented opcode refanyval

    ; Offset 0010: stloc.2
    ; WARNING: Stloc_2 with empty stack

    ; Offset 0011: ldc.r4
    ; WARNING: ldc.r4 operand type: null
    CLR.L D1  ; TODO: Load float constant

    ; Offset 0012: ldelem.ref
    ; TODO: Unimplemented opcode ldelem.ref
    CLR.L D2  ; TODO: Placeholder value

    ; Offset 0013: ldelem.r8
    ; TODO: Unimplemented opcode ldelem.r8
    CLR.L D3  ; TODO: Placeholder value

    ; Offset 0014: nop
    ; NOP

    ; Offset 0015: refanyval
    ; TODO: Unimplemented opcode refanyval

    ; Offset 001A: break
    ; TODO: Unimplemented opcode break

    ; Offset 001B: ldloc.2
    MOVE.L -12(A6),D4  ; Load local 2

    ; Offset 001C: conv.r8
    MOVE.L D4,D5  ; Convert to R8 (high word)
    CLR.L D6          ; Convert to R8 (low word)
