; Generated 68000 Assembly Code
; Converted from C# MSIL
; Generated: 2026-04-13 20:13:11

    ; --- Code Section ---
    SECTION CODE

    ; --- Class Definitions ---
; Class: JumpCS.TestMath.Program
    CLASS_0 EQU 0
    CLASS_SIZE_0 EQU 0
; Class: JumpCS.TestMath.Tests.IntegerMathTests
    CLASS_1 EQU 1
    CLASS_SIZE_1 EQU 0

    ; --- Class Table ---
CLASS_TABLE:
    DC.L JumpCS.TestMath.Program_vtable     ; Class JumpCS.TestMath.Program
    DC.L 0             ; Instance size
    DC.L JumpCS.TestMath.Tests.IntegerMathTests_vtable     ; Class JumpCS.TestMath.Tests.IntegerMathTests
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
    ; Offset 0007: ret
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
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0008: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 0009: add
    MOVE.L D0,D2
    ADD.L D1,D2
    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 000B: ldc.i4.s
    MOVE.L #100,D2  ; Load short constant
    ; Offset 000D: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0012: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 0013: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0018: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_0_eq
    CLR.L D0
    BRA L_0_end
L_0_eq:
    MOVE.L #1,D0
L_0_end:
    ; Offset 001D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L #-42,D0  ; Load short constant
    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0
    ; Offset 0004: ldc.i4.s
    MOVE.L #-58,D0  ; Load short constant
    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1
    ; Offset 0007: ldloc.0
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0008: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 0009: add
    MOVE.L D0,D2
    ADD.L D1,D2
    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 000B: ldc.i4.s
    MOVE.L #-100,D2  ; Load short constant
    ; Offset 000D: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0012: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 0013: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0018: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_1_eq
    CLR.L D0
    BRA L_1_end
L_1_eq:
    MOVE.L #1,D0
L_1_end:
    ; Offset 001D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L #-42,D0  ; Load short constant
    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1
    ; Offset 0007: ldloc.0
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0008: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 0009: add
    MOVE.L D0,D2
    ADD.L D1,D2
    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 000B: ldc.i4.s
    MOVE.L #58,D2  ; Load short constant
    ; Offset 000D: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0012: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 0013: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0018: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_2_eq
    CLR.L D0
    BRA L_2_end
L_2_eq:
    MOVE.L #1,D0
L_2_end:
    ; Offset 001D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 000A: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 000B: add
    MOVE.L D0,D2
    ADD.L D1,D2
    ; Offset 000C: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 000D: ldc.i4
    MOVE.L #-2147483648,D2  ; Load constant
    ; Offset 0012: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0017: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 0018: box
    ; Box (passthrough ? value stays in register)
    ; Offset 001D: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_3_eq
    CLR.L D0
    BRA L_3_end
L_3_eq:
    MOVE.L #1,D0
L_3_end:
    ; Offset 0022: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0008: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 0009: sub
    MOVE.L D0,D2
    SUB.L D1,D2
    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 000B: ldc.i4.s
    MOVE.L #58,D2  ; Load short constant
    ; Offset 000D: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0012: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 0013: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0018: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_4_eq
    CLR.L D0
    BRA L_4_end
L_4_eq:
    MOVE.L #1,D0
L_4_end:
    ; Offset 001D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0008: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 0009: sub
    MOVE.L D0,D2
    SUB.L D1,D2
    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 000B: ldc.i4.s
    MOVE.L #-58,D2  ; Load short constant
    ; Offset 000D: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0012: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 0013: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0018: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_5_eq
    CLR.L D0
    BRA L_5_end
L_5_eq:
    MOVE.L #1,D0
L_5_end:
    ; Offset 001D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L #-42,D0  ; Load short constant
    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0
    ; Offset 0004: ldc.i4.s
    MOVE.L #-100,D0  ; Load short constant
    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1
    ; Offset 0007: ldloc.0
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0008: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 0009: sub
    MOVE.L D0,D2
    SUB.L D1,D2
    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 000B: ldc.i4.s
    MOVE.L #58,D2  ; Load short constant
    ; Offset 000D: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0012: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 0013: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0018: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_6_eq
    CLR.L D0
    BRA L_6_end
L_6_eq:
    MOVE.L #1,D0
L_6_end:
    ; Offset 001D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0007: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 0008: mul
    MOVE.L D0,D2
    MULS.L D1,D2
    ; Offset 0009: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 000A: ldc.i4.s
    MOVE.L #84,D2  ; Load short constant
    ; Offset 000C: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0011: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 0012: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0017: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_7_eq
    CLR.L D0
    BRA L_7_end
L_7_eq:
    MOVE.L #1,D0
L_7_end:
    ; Offset 001C: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0007: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 0008: mul
    MOVE.L D0,D2
    MULS.L D1,D2
    ; Offset 0009: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 000A: ldc.i4.0
    CLR.L D2             ; Load 0
    ; Offset 000B: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0010: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 0011: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0016: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_8_eq
    CLR.L D0
    BRA L_8_end
L_8_eq:
    MOVE.L #1,D0
L_8_end:
    ; Offset 001B: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L #-12,D0  ; Load short constant
    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0
    ; Offset 0004: ldc.i4.s
    MOVE.L #-7,D0  ; Load short constant
    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1
    ; Offset 0007: ldloc.0
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0008: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 0009: mul
    MOVE.L D0,D2
    MULS.L D1,D2
    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 000B: ldc.i4.s
    MOVE.L #84,D2  ; Load short constant
    ; Offset 000D: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0012: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 0013: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0018: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_9_eq
    CLR.L D0
    BRA L_9_end
L_9_eq:
    MOVE.L #1,D0
L_9_end:
    ; Offset 001D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L #-7,D0  ; Load short constant
    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1
    ; Offset 0007: ldloc.0
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0008: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 0009: mul
    MOVE.L D0,D2
    MULS.L D1,D2
    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 000B: ldc.i4.s
    MOVE.L #-84,D2  ; Load short constant
    ; Offset 000D: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0012: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 0013: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0018: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_10_eq
    CLR.L D0
    BRA L_10_end
L_10_eq:
    MOVE.L #1,D0
L_10_end:
    ; Offset 001D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0007: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 0008: div
    MOVE.L D0,D2
    DIVS.L D1,D2
    ; Offset 0009: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 000A: ldc.i4.s
    MOVE.L #12,D2  ; Load short constant
    ; Offset 000C: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0011: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 0012: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0017: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_11_eq
    CLR.L D0
    BRA L_11_end
L_11_eq:
    MOVE.L #1,D0
L_11_end:
    ; Offset 001C: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0007: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 0008: div
    MOVE.L D0,D2
    DIVS.L D1,D2
    ; Offset 0009: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 000A: ldc.i4.s
    MOVE.L #12,D2  ; Load short constant
    ; Offset 000C: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0011: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 0012: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0017: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_12_eq
    CLR.L D0
    BRA L_12_end
L_12_eq:
    MOVE.L #1,D0
L_12_end:
    ; Offset 001C: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L #-84,D0  ; Load short constant
    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0
    ; Offset 0004: ldc.i4.s
    MOVE.L #-7,D0  ; Load short constant
    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1
    ; Offset 0007: ldloc.0
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0008: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 0009: div
    MOVE.L D0,D2
    DIVS.L D1,D2
    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 000B: ldc.i4.s
    MOVE.L #12,D2  ; Load short constant
    ; Offset 000D: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0012: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 0013: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0018: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_13_eq
    CLR.L D0
    BRA L_13_end
L_13_eq:
    MOVE.L #1,D0
L_13_end:
    ; Offset 001D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L #-7,D0  ; Load short constant
    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1
    ; Offset 0007: ldloc.0
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0008: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 0009: div
    MOVE.L D0,D2
    DIVS.L D1,D2
    ; Offset 000A: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 000B: ldc.i4.s
    MOVE.L #-12,D2  ; Load short constant
    ; Offset 000D: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0012: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 0013: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0018: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_14_eq
    CLR.L D0
    BRA L_14_end
L_14_eq:
    MOVE.L #1,D0
L_14_end:
    ; Offset 001D: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0007: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 0008: rem
    MOVE.L D0,D0
    DIVSL.L D1,D1:D0  ; Quotient in D0, remainder in D1
    MOVE.L D1,D2  ; Remainder
    ; Offset 0009: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D2         ; Load 1
    ; Offset 000B: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0010: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 0011: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0016: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_15_eq
    CLR.L D0
    BRA L_15_end
L_15_eq:
    MOVE.L #1,D0
L_15_end:
    ; Offset 001B: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L #-85,D0  ; Load short constant
    ; Offset 0003: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0
    ; Offset 0004: ldc.i4.7
    MOVE.L #7,D0         ; Load 7
    ; Offset 0005: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1
    ; Offset 0006: ldloc.0
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0007: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 0008: rem
    MOVE.L D0,D0
    DIVSL.L D1,D1:D0  ; Quotient in D0, remainder in D1
    MOVE.L D1,D2  ; Remainder
    ; Offset 0009: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 000A: ldc.i4.m1
    MOVE.L #-1,D2        ; Load -1
    ; Offset 000B: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0010: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 0011: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0016: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_16_eq
    CLR.L D0
    BRA L_16_end
L_16_eq:
    MOVE.L #1,D0
L_16_end:
    ; Offset 001B: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 000E: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 000F: and
    MOVE.L D0,D2
    AND.L D1,D2
    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 0011: ldc.i4
    MOVE.L #128,D2  ; Load constant
    ; Offset 0016: box
    ; Box (passthrough ? value stays in register)
    ; Offset 001B: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 001C: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0021: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_17_eq
    CLR.L D0
    BRA L_17_end
L_17_eq:
    MOVE.L #1,D0
L_17_end:
    ; Offset 0026: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 000E: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 000F: or
    MOVE.L D0,D2
    OR.L D1,D2
    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 0011: ldc.i4
    MOVE.L #239,D2  ; Load constant
    ; Offset 0016: box
    ; Box (passthrough ? value stays in register)
    ; Offset 001B: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 001C: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0021: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_18_eq
    CLR.L D0
    BRA L_18_end
L_18_eq:
    MOVE.L #1,D0
L_18_end:
    ; Offset 0026: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 000E: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 000F: xor
    MOVE.L D0,D2
    EOR.L D1,D2
    ; Offset 0010: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
    ; Offset 0011: ldc.i4.s
    MOVE.L #111,D2  ; Load short constant
    ; Offset 0013: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0018: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
    ; Offset 0019: box
    ; Box (passthrough ? value stays in register)
    ; Offset 001E: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_19_eq
    CLR.L D0
    BRA L_19_end
L_19_eq:
    MOVE.L #1,D0
L_19_end:
    ; Offset 0023: stloc.3
    MOVE.L D0,-16(A6)  ; Store to local 3
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
    MOVE.L -4(A6),D0  ; Load local.0
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
    ; Box (passthrough ? value stays in register)
    ; Offset 000E: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 000F: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0014: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_20_eq
    CLR.L D0
    BRA L_20_end
L_20_eq:
    MOVE.L #1,D0
L_20_end:
    ; Offset 0019: stloc.2
    MOVE.L D0,-12(A6)  ; Store to local 2
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
    MOVE.L -4(A6),D0  ; Load local.0
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
    ; Box (passthrough ? value stays in register)
    ; Offset 000E: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 000F: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0014: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_21_eq
    CLR.L D0
    BRA L_21_end
L_21_eq:
    MOVE.L #1,D0
L_21_end:
    ; Offset 0019: stloc.2
    MOVE.L D0,-12(A6)  ; Store to local 2
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
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0005: neg
    CLR.L D1
    SUB.L D0,D1
    ; Offset 0006: stloc.1
    MOVE.L D1,-8(A6)   ; Store to local 1
    ; Offset 0007: ldc.i4.s
    MOVE.L #-42,D1  ; Load short constant
    ; Offset 0009: box
    ; Box (passthrough ? value stays in register)
    ; Offset 000E: ldloc.1
    MOVE.L -8(A6),D0  ; Load local.1
    ; Offset 000F: box
    ; Box (passthrough ? value stays in register)
    ; Offset 0014: call
    ; System.Object.Equals (inline)
    CMP.L D0,D1
    BEQ L_22_eq
    CLR.L D2
    BRA L_22_end
L_22_eq:
    MOVE.L #1,D2
L_22_end:
    ; Offset 0019: stloc.2
    MOVE.L D2,-12(A6)  ; Store to local 2
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
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 000A: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 000B: add
    MOVE.L D0,D2
    ADD.L D1,D2
    ; Offset 000C: ldloc.2
    MOVE.L -12(A6),D1  ; Load local.2
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
    ; Box (passthrough ? value stays in register)
    ; Offset 0018: ldloc.3
    MOVE.L -16(A6),D1  ; Load local.3
    ; Offset 0019: box
    ; Box (passthrough ? value stays in register)
    ; Offset 001E: call
    ; System.Object.Equals (inline)
    CMP.L D1,D2
    BEQ L_23_eq
    CLR.L D0
    BRA L_23_end
L_23_eq:
    MOVE.L #1,D0
L_23_end:
    ; Offset 0023: stloc.s
    MOVE.L D0,-20(A6)  ; Store to local 4
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
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 000A: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
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
L_0017:
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
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 000A: ldloc.1
    MOVE.L -8(A6),D1  ; Load local.1
    ; Offset 000B: rem
    MOVE.L D0,D0
    DIVSL.L D1,D1:D0  ; Quotient in D0, remainder in D1
    MOVE.L D1,D2  ; Remainder
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
L_0017:
    ; Offset 0017: ret
    CLR.L D0            ; Clear return value (void)

    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS


    ; --- Data Section ---
    SECTION DATA

JumpCS.TestMath.Program_vtable:
    DC.L JumpCS.TestMath.Program         ; Class pointer

JumpCS.TestMath.Tests.IntegerMathTests_vtable:
    DC.L JumpCS.TestMath.Tests.IntegerMathTests         ; Class pointer

    END
