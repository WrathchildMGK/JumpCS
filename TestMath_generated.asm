; Generated 68000 Assembly Code
; Converted from C# MSIL
; Generated: 2026-04-06 18:30:24

    ; --- Code Section ---
    SECTION CODE

    ; --- Class Definitions ---
; Class: JumpCS.TestMath.Program
    CLASS_0 EQU 0
    CLASS_SIZE_0 EQU 0
; Class: JumpCS.TestMath.Tests.FloatMathTests
    CLASS_1 EQU 1
    CLASS_SIZE_1 EQU 0
; Class: JumpCS.TestMath.Tests.IntegerMathTests
    CLASS_2 EQU 2
    CLASS_SIZE_2 EQU 0

    ; --- Class Table ---
CLASS_TABLE:
    DC.L JumpCS.TestMath.Program_vtable     ; Class JumpCS.TestMath.Program
    DC.L 0             ; Instance size
    DC.L JumpCS.TestMath.Tests.FloatMathTests_vtable     ; Class JumpCS.TestMath.Tests.FloatMathTests
    DC.L 0             ; Instance size
    DC.L JumpCS.TestMath.Tests.IntegerMathTests_vtable     ; Class JumpCS.TestMath.Tests.IntegerMathTests
    DC.L 0             ; Instance size

    ; --- Method Implementations ---
; Methods of JumpCS.TestMath.Program
JumpCS.TestMath.Program_Main:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #0,A7 ; Allocate locals

    ; MSIL Code (764 bytes, 2 max stack, 0 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Addition_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Addition_PositiveNumbers

    ; Offset 0002: stind.i4
    ; TODO: stind.i4

    ; Offset 0003: nop
    ; TODO: nop

    ; Offset 0004: nop
    ; TODO: nop

    ; Offset 0005: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0006: nop
    ; TODO: nop

    ; Offset 0007: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Addition_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Addition_NegativeNumbers

    ; Offset 0008: stind.i8
    ; TODO: stind.i8

    ; Offset 0009: nop
    ; TODO: nop

    ; Offset 000A: nop
    ; TODO: nop

    ; Offset 000B: ldloc.0
    MOVE.L -4(A6),D1   ; Load local 0

    ; Offset 000C: nop
    ; TODO: nop

    ; Offset 000D: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Addition_MixedSigns()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Addition_MixedSigns

    ; Offset 000E: stind.r4
    ; TODO: stind.r4

    ; Offset 000F: nop
    ; TODO: nop

    ; Offset 0010: nop
    ; TODO: nop

    ; Offset 0011: ldloc.0
    MOVE.L D1,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0012: nop
    ; TODO: nop

    ; Offset 0013: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Addition_Overflow()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Addition_Overflow

    ; Offset 0014: stind.r8
    ; TODO: stind.r8

    ; Offset 0015: nop
    ; TODO: nop

    ; Offset 0016: nop
    ; TODO: nop

    ; Offset 0017: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0018: nop
    ; TODO: nop

    ; Offset 0019: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Subtraction_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Subtraction_PositiveNumbers

    ; Offset 001A: add
    ADD.L D0,D0  ; Add

    ; Offset 001B: nop
    ; TODO: nop

    ; Offset 001C: nop
    ; TODO: nop

    ; Offset 001D: ldloc.0
    MOVE.L -4(A6),D1   ; Load local 0

    ; Offset 001E: nop
    ; TODO: nop

    ; Offset 001F: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Subtraction_NegativeResult()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Subtraction_NegativeResult

    ; Offset 0020: sub
    SUB.L D1,D0  ; Subtract

    ; Offset 0021: nop
    ; TODO: nop

    ; Offset 0022: nop
    ; TODO: nop

    ; Offset 0023: ldloc.0
    MOVE.L -4(A6),D1   ; Load local 0

    ; Offset 0024: nop
    ; TODO: nop

    ; Offset 0025: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Subtraction_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Subtraction_NegativeNumbers

    ; Offset 0026: mul
    MULS.L D1,D0 ; Multiply

    ; Offset 0027: nop
    ; TODO: nop

    ; Offset 0028: nop
    ; TODO: nop

    ; Offset 0029: ldloc.0
    MOVE.L -4(A6),D1   ; Load local 0

    ; Offset 002A: nop
    ; TODO: nop

    ; Offset 002B: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Multiplication_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_PositiveNumbers

    ; Offset 002C: div
    DIVS.L D1,D0 ; Divide

    ; Offset 002D: nop
    ; TODO: nop

    ; Offset 002E: nop
    ; TODO: nop

    ; Offset 002F: ldloc.0
    MOVE.L -4(A6),D1   ; Load local 0

    ; Offset 0030: nop
    ; TODO: nop

    ; Offset 0031: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Multiplication_ByZero()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_ByZero

    ; Offset 0032: div.un
    ; TODO: div.un

    ; Offset 0033: nop
    ; TODO: nop

    ; Offset 0034: nop
    ; TODO: nop

    ; Offset 0035: ldloc.0
    MOVE.L D1,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0036: nop
    ; TODO: nop

    ; Offset 0037: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Multiplication_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_NegativeNumbers

    ; Offset 0038: rem
    ; TODO: rem

    ; Offset 0039: nop
    ; TODO: nop

    ; Offset 003A: nop
    ; TODO: nop

    ; Offset 003B: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 003C: nop
    ; TODO: nop

    ; Offset 003D: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Multiplication_MixedSigns()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_MixedSigns

    ; Offset 003E: rem.un
    ; TODO: rem.un

    ; Offset 003F: nop
    ; TODO: nop

    ; Offset 0040: nop
    ; TODO: nop

    ; Offset 0041: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0042: nop
    ; TODO: nop

    ; Offset 0043: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Division_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Division_PositiveNumbers

    ; Offset 0044: and
    ; TODO: and

    ; Offset 0045: nop
    ; TODO: nop

    ; Offset 0046: nop
    ; TODO: nop

    ; Offset 0047: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0048: nop
    ; TODO: nop

    ; Offset 0049: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Division_WithRemainder()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Division_WithRemainder

    ; Offset 004A: or
    ; TODO: or

    ; Offset 004B: nop
    ; TODO: nop

    ; Offset 004C: nop
    ; TODO: nop

    ; Offset 004D: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 004E: nop
    ; TODO: nop

    ; Offset 004F: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Division_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Division_NegativeNumbers

    ; Offset 0050: xor
    ; TODO: xor

    ; Offset 0051: nop
    ; TODO: nop

    ; Offset 0052: nop
    ; TODO: nop

    ; Offset 0053: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0054: nop
    ; TODO: nop

    ; Offset 0055: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Division_MixedSigns()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Division_MixedSigns

    ; Offset 0056: shl
    ; TODO: shl

    ; Offset 0057: nop
    ; TODO: nop

    ; Offset 0058: nop
    ; TODO: nop

    ; Offset 0059: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 005A: nop
    ; TODO: nop

    ; Offset 005B: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Remainder_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Remainder_PositiveNumbers

    ; Offset 005C: shr
    ; TODO: shr

    ; Offset 005D: nop
    ; TODO: nop

    ; Offset 005E: nop
    ; TODO: nop

    ; Offset 005F: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0060: nop
    ; TODO: nop

    ; Offset 0061: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Remainder_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Remainder_NegativeNumbers

    ; Offset 0062: shr.un
    ; TODO: shr.un

    ; Offset 0063: nop
    ; TODO: nop

    ; Offset 0064: nop
    ; TODO: nop

    ; Offset 0065: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0066: nop
    ; TODO: nop

    ; Offset 0067: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.BitwiseAnd()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_BitwiseAnd

    ; Offset 0068: neg
    ; TODO: neg

    ; Offset 0069: nop
    ; TODO: nop

    ; Offset 006A: nop
    ; TODO: nop

    ; Offset 006B: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 006C: nop
    ; TODO: nop

    ; Offset 006D: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.BitwiseOr()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_BitwiseOr

    ; Offset 006E: not
    ; TODO: not

    ; Offset 006F: nop
    ; TODO: nop

    ; Offset 0070: nop
    ; TODO: nop

    ; Offset 0071: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0072: nop
    ; TODO: nop

    ; Offset 0073: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.BitwiseXor()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_BitwiseXor

    ; Offset 0074: conv.i1
    ; TODO: conv.i1

    ; Offset 0075: nop
    ; TODO: nop

    ; Offset 0076: nop
    ; TODO: nop

    ; Offset 0077: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0078: nop
    ; TODO: nop

    ; Offset 0079: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.LeftShift()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_LeftShift

    ; Offset 007A: conv.i2
    ; TODO: conv.i2

    ; Offset 007B: nop
    ; TODO: nop

    ; Offset 007C: nop
    ; TODO: nop

    ; Offset 007D: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 007E: nop
    ; TODO: nop

    ; Offset 007F: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.RightShift()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_RightShift

    ; Offset 0080: conv.i4
    ; TODO: conv.i4

    ; Offset 0081: nop
    ; TODO: nop

    ; Offset 0082: nop
    ; TODO: nop

    ; Offset 0083: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0084: nop
    ; TODO: nop

    ; Offset 0085: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.UnaryMinus()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_UnaryMinus

    ; Offset 0086: conv.i8
    ; TODO: conv.i8

    ; Offset 0087: nop
    ; TODO: nop

    ; Offset 0088: nop
    ; TODO: nop

    ; Offset 0089: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 008A: nop
    ; TODO: nop

    ; Offset 008B: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.ChainedOperations()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_ChainedOperations

    ; Offset 008C: conv.r4
    ; TODO: conv.r4

    ; Offset 008D: nop
    ; TODO: nop

    ; Offset 008E: nop
    ; TODO: nop

    ; Offset 008F: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0090: nop
    ; TODO: nop

    ; Offset 0091: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.DivideByZeroThrows()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_DivideByZeroThrows

    ; Offset 0092: conv.r8
    ; TODO: conv.r8

    ; Offset 0093: nop
    ; TODO: nop

    ; Offset 0094: nop
    ; TODO: nop

    ; Offset 0095: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0096: nop
    ; TODO: nop

    ; Offset 0097: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.ModuloByZeroThrows()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_ModuloByZeroThrows

    ; Offset 0098: conv.u4
    ; TODO: conv.u4

    ; Offset 0099: nop
    ; TODO: nop

    ; Offset 009A: nop
    ; TODO: nop

    ; Offset 009B: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 009C: nop
    ; TODO: nop

    ; Offset 009D: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Addition_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Addition_PositiveNumbers

    ; Offset 009E: bgt
    ; TODO: bgt

    ; Offset 009F: nop
    ; TODO: nop

    ; Offset 00A0: nop
    ; TODO: nop

    ; Offset 00A1: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 00A2: nop
    ; TODO: nop

    ; Offset 00A3: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Addition_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Addition_NegativeNumbers

    ; Offset 00A4: ble
    ; TODO: ble

    ; Offset 00A5: nop
    ; TODO: nop

    ; Offset 00A6: nop
    ; TODO: nop

    ; Offset 00A7: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 00A8: nop
    ; TODO: nop

    ; Offset 00A9: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Addition_MixedSigns()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Addition_MixedSigns

    ; Offset 00AA: blt
    ; TODO: blt

    ; Offset 00AB: nop
    ; TODO: nop

    ; Offset 00AC: nop
    ; TODO: nop

    ; Offset 00AD: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 00AE: nop
    ; TODO: nop

    ; Offset 00AF: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Subtraction_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Subtraction_PositiveNumbers

    ; Offset 00B0: bne.un
    CMP.L D0,D0
    BNE L_600B1

    ; Offset 00B1: nop
    ; TODO: nop

    ; Offset 00B2: nop
    ; TODO: nop

    ; Offset 00B3: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 00B4: nop
    ; TODO: nop

    ; Offset 00B5: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Subtraction_NegativeResult()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Subtraction_NegativeResult

    ; Offset 00B6: bge.un
    ; TODO: bge.un

    ; Offset 00B7: nop
    ; TODO: nop

    ; Offset 00B8: nop
    ; TODO: nop

    ; Offset 00B9: ldloc.0
    MOVE.L -4(A6),D1   ; Load local 0

    ; Offset 00BA: nop
    ; TODO: nop

    ; Offset 00BB: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Multiplication_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Multiplication_PositiveNumbers

    ; Offset 00BC: bgt.un
    ; TODO: bgt.un

    ; Offset 00BD: nop
    ; TODO: nop

    ; Offset 00BE: nop
    ; TODO: nop

    ; Offset 00BF: ldloc.0
    MOVE.L D1,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 00C0: nop
    ; TODO: nop

    ; Offset 00C1: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Multiplication_ByZero()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Multiplication_ByZero

    ; Offset 00C2: ble.un
    ; TODO: ble.un

    ; Offset 00C3: nop
    ; TODO: nop

    ; Offset 00C4: nop
    ; TODO: nop

    ; Offset 00C5: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 00C6: nop
    ; TODO: nop

    ; Offset 00C7: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Multiplication_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Multiplication_NegativeNumbers

    ; Offset 00C8: blt.un
    ; TODO: blt.un

    ; Offset 00C9: nop
    ; TODO: nop

    ; Offset 00CA: nop
    ; TODO: nop

    ; Offset 00CB: ldloc.0
    MOVE.L D0,0(A6)  ; Spill to frame
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 00CC: nop
    ; TODO: nop

    ; Offset 00CD: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Division_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Division_PositiveNumbers

    ; Offset 00CE: switch
    ; TODO: switch


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS


; Methods of JumpCS.TestMath.Tests.FloatMathTests
JumpCS.TestMath.Tests.FloatMathTests_Addition_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7 ; Allocate locals

    ; MSIL Code (47 bytes, 3 max stack, 4 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldc.r4
    ; TODO: ldc.r4

    ; Offset 0002: nop
    ; TODO: nop

    ; Offset 0003: nop
    ; TODO: nop

    ; Offset 0004: ret
    CLR.L D0            ; Clear return value (void)

    ; Offset 0005: bgt.un
    ; TODO: bgt.un

    ; Offset 0006: stloc.0
