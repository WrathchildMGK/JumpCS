; Generated 68000 Assembly Code
; Converted from C# MSIL
; Generated: 2026-04-12 12:24:28

    ; --- Code Section ---
    SECTION CODE

    ; --- Class Definitions ---
; Class: JumpCS.TestMath.Program
    CLASS_0 EQU 0
    CLASS_SIZE_0 EQU 0
; Class: JumpCS.TestMath.Tests.TypeConversionTests
    CLASS_1 EQU 1
    CLASS_SIZE_1 EQU 0

    ; --- Class Table ---
CLASS_TABLE:
    DC.L JumpCS.TestMath.Program_vtable     ; Class JumpCS.TestMath.Program
    DC.L 0             ; Instance size
    DC.L JumpCS.TestMath.Tests.TypeConversionTests_vtable     ; Class JumpCS.TestMath.Tests.TypeConversionTests
    DC.L 0             ; Instance size

    ; --- Method Implementations ---
; Methods of JumpCS.TestMath.Program
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
    ; Call JumpCS.TestMath.Program.AllTypeConversionTests()V
    JSR JumpCS.TestMath.Program_AllTypeConversionTests

    ; Offset 0006: nop
    ; NOP

    ; Offset 0007: ret
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
    ; TODO: System.Decimal.op_Implicit

    ; Offset 000A: stloc.1
    MOVE.L D1,-8(A6)   ; Store to local 1

    ; Offset 000B: ldc.i4.s
    MOVE.L #42,D1  ; Load short constant

    ; Offset 000D: newobj
    ; System.Decimal newobj - create new instance (1 parameters)
    ; TODO: Decimal newobj with 1 parameters (expected 5)

    ; Offset 0012: ldloc.1
    MOVE.L -12(A6),D3  ; Load local.1

    ; Offset 0013: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D2,A0    ; A0 = address of left operand
    MOVE.L D3,A1  ; A1 = address of right operand
    MOVE.L #1,D4     ; Assume equal
    MOVE.L (A0),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_0
    MOVE.L 4(A0),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_0
    MOVE.L 8(A0),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_0
    MOVE.L 12(A0),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_0
    BRA .Done_L_1
.NotEqual_L_0:
    MOVE.L #0,D4     ; Not equal
.Done_L_1:

    ; Offset 0018: stloc.2
    MOVE.L D4,-12(A6)  ; Store to local 2

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
    ; TODO: System.Decimal.op_Explicit

    ; Offset 000D: stloc.1
    MOVE.L D1,-8(A6)   ; Store to local 1

    ; Offset 000E: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 000F: ldc.i4
    MOVE.L #425,D2  ; Load constant

    ; Offset 0014: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0015: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0016: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0017: ldc.i4.1
    MOVE.L #1,D6         ; Load 1

    ; Offset 0018: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D2, mid=D3, hi=D4, sign=D5, scale=D6
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D6      ; Ensure scale is 0-255
    LSL.L #16,D6        ; Shift scale to bits 16-23
    OR.L D6,D7   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_2
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_2:
    MOVE.L D7,(A0)      ; Store flags at offset 0
    MOVE.L D4,4(A0)          ; Store high at offset 4
    MOVE.L D2,8(A0)          ; Store low at offset 8
    MOVE.L D3,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D7   ; Convert address to data register

    ; Offset 001D: call
    ; System.Decimal.op_Subtraction (inline)
    ; System.Decimal op_Subtraction inline
    MOVE.L D1,A0    ; A0 = address of left operand
    MOVE.L D7,A1  ; A1 = address of right operand
    LEA -16(A6),A2        ; A2 = address of result
    MOVE.L 8(A0),D7   ; Load left low
    MOVE.L 8(A1),D6  ; Load right low
    SUB.L D6,D7           ; Subtract low parts
    MOVE.L D7,8(A2) ; Store result low (address preserved)
    MOVE.L 12(A0),D7  ; Load left mid
    MOVE.L 12(A1),D6 ; Load right mid
    SUBX.L D6,D7          ; Subtract mid parts with borrow
    MOVE.L D7,12(A2) ; Store result mid (address preserved)
    MOVE.L 4(A0),D7   ; Load left high
    MOVE.L 4(A1),D6  ; Load right high
    SUBX.L D6,D7          ; Subtract high parts with borrow
    MOVE.L D7,4(A2) ; Store result high (address preserved)
    MOVE.L (A0),D7    ; Load left flags
    MOVE.L D7,(A2)  ; Store result flags (address preserved)
    MOVE.L A2,D5 ; Convert address to data register for return

    ; Offset 0022: call
    ; Decimal.Abs(D5)
    ; TODO: Implement decimal absolute value
    MOVE.L D5,D6

    ; Offset 0027: ldc.i4.1
    MOVE.L #1,D7         ; Load 1

    ; Offset 0028: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0029: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 002A: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 002B: ldc.i4.2
    MOVE.L #2,D0         ; Load 2

    ; Offset 002C: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A2  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A2, lo=D7, mid=D4, hi=D3, sign=D2, scale=D0
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D0      ; Ensure scale is 0-255
    LSL.L #16,D0        ; Shift scale to bits 16-23
    OR.L D0,D7   ; Set scale in flags
    TST.L D2        ; Check if negative
    BEQ .SkipNegative_L_3
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_3:
    MOVE.L D7,(A2)      ; Store flags at offset 0
    MOVE.L D3,4(A2)          ; Store high at offset 4
    MOVE.L D7,8(A2)          ; Store low at offset 8
    MOVE.L D4,12(A2)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A2,D5   ; Convert address to data register

    ; Offset 0031: call
    ; System.Decimal.op_LessThan (inline)
    ; System.Decimal op_LessThan inline
    MOVE.L D6,A2    ; A2 = address of left operand
    MOVE.L D5,A1  ; A1 = address of right operand
    CLR.L D7     ; Assume not less than (default: 0)
    MOVE.L (A2),D4    ; Load left flags
    MOVE.L (A1),D4          ; Load right flags
    TST.L D4                     ; Check left sign (bit 31)
    BPL .LeftPositive_L_4
    TST.L D4
    BMI .BothNegative_L_4   ; Both negative, compare magnitude
    MOVE.L #1,D7              ; Left negative, right positive: left < right
    BRA .Done_L_6
.LeftPositive_L_4:
    TST.L D4
    BMI .Done_L_6              ; Left positive, right negative: left >= right (return 0)
.BothNegative_L_4:
    MOVE.L 4(A2),D4   ; Load left high
    CMP.L 4(A1),D4   ; Compare high
    BLT .IsLessThan_L_4
    BGT .Done_L_6              ; If left high > right high, not less
    MOVE.L 12(A2),D4  ; Load left mid
    CMP.L 12(A1),D4  ; Compare mid
    BLT .IsLessThan_L_4
    BGT .Done_L_6
    MOVE.L 8(A2),D4   ; Load left low
    CMP.L 8(A1),D4   ; Compare low
    BLT .IsLessThan_L_4
    BRA .Done_L_6
.IsLessThan_L_4:
    MOVE.L #1,D7              ; Left < Right
.Done_L_6:

    ; Offset 0036: stloc.2
    MOVE.L D7,-12(A6)  ; Store to local 2

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
    ; TODO: System.Decimal.op_Explicit

    ; Offset 0011: stloc.1
    MOVE.L D2,-8(A6)   ; Store to local 1

    ; Offset 0012: ldc.i4
    MOVE.L #425,D2  ; Load constant

    ; Offset 0017: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0018: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D6         ; Load 1

    ; Offset 001B: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),A0  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ A0, lo=D2, mid=D3, hi=D4, sign=D5, scale=D6
    CLR.L D7           ; Clear flags
    AND.L #0xFF,D6      ; Ensure scale is 0-255
    LSL.L #16,D6        ; Shift scale to bits 16-23
    OR.L D6,D7   ; Set scale in flags
    TST.L D5        ; Check if negative
    BEQ .SkipNegative_L_7
    OR.L #0x80000000,D7 ; Set sign bit if negative
.SkipNegative_L_7:
    MOVE.L D7,(A0)      ; Store flags at offset 0
    MOVE.L D4,4(A0)          ; Store high at offset 4
    MOVE.L D2,8(A0)          ; Store low at offset 8
    MOVE.L D3,12(A0)        ; Store mid at offset 12
    ; newobj complete - convert address to data register for stack
    MOVE.L A0,D7   ; Convert address to data register

    ; Offset 0020: ldloc.1
    MOVE.L -12(A6),D0  ; Load local.1

    ; Offset 0021: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D7,A0    ; A0 = address of left operand
    MOVE.L D0,A1  ; A1 = address of right operand
    MOVE.L #1,D6     ; Assume equal
    MOVE.L (A0),D5    ; Load left flags
    CMP.L (A1),D5    ; Compare flags
    BNE .NotEqual_L_8
    MOVE.L 4(A0),D5   ; Load left high
    CMP.L 4(A1),D5   ; Compare high
    BNE .NotEqual_L_8
    MOVE.L 8(A0),D5   ; Load left low
    CMP.L 8(A1),D5   ; Compare low
    BNE .NotEqual_L_8
    MOVE.L 12(A0),D5  ; Load left mid
    CMP.L 12(A1),D5  ; Compare mid
    BNE .NotEqual_L_8
    BRA .Done_L_9
.NotEqual_L_8:
    MOVE.L #0,D6     ; Not equal
.Done_L_9:

    ; Offset 0026: stloc.2
    MOVE.L D6,-12(A6)  ; Store to local 2

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
    ; TODO: Unimplemented opcode ldloca.s
    CLR.L D0  ; TODO: Placeholder value

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
    BEQ .SkipNegative_L_10
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_10:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0012: call
    ; System.Decimal.op_Explicit (inline)
    ; TODO: System.Decimal.op_Explicit

    ; Offset 0017: stloc.1
    MOVE.L D1,-8(A6)   ; Store to local 1

    ; Offset 0018: ldc.i4.s
    MOVE.L #42,D1  ; Load short constant

    ; Offset 001A: box
    ; Box type token 01000014
    MOVE.L D1,D0     ; Boxed value

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
    ; TODO: Unimplemented opcode ldloca.s
    CLR.L D0  ; TODO: Placeholder value

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
    BEQ .SkipNegative_L_11
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_11:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0012: call
    ; System.Decimal.op_Explicit (inline)
    ; TODO: System.Decimal.op_Explicit

    ; Offset 0017: conv.r4
    MOVE.L D1,D2  ; Convert to R4

    ; Offset 0018: stloc.1
    MOVE.L D2,-8(A6)   ; Store to local 1

    ; Offset 0019: ldc.r4
    LEA FLOAT_CONST_0019(PC),A0
    MOVE.L (A0),D2

    ; Offset 001E: box
    ; Box type token 01000012
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0023: ldloc.1
    MOVE.L -12(A6),D2  ; Load local.1

    ; Offset 0024: conv.r8
    MOVE.L D2,D1  ; Convert to R8 (high word)
    CLR.L D3          ; Convert to R8 (low word)

    ; Offset 0025: ldc.i4.1
    MOVE.L #1,D2         ; Load 1

    ; Offset 0026: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D1:D3, D2) - double precision rounding
    ; TODO: Implement IEEE double rounding to D2 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D1,D4  ; Copy high word
    MOVE.L D3,D5    ; Copy low word

    ; Offset 002B: box
    ; Box type token 01000013
    MOVE.L D5,D0     ; Boxed value

    ; Offset 0030: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0035: stloc.2
    MOVE.L D5,-12(A6)  ; Store to local 2

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
    ; TODO: Unimplemented opcode ldloca.s
    CLR.L D0  ; TODO: Placeholder value

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
    BEQ .SkipNegative_L_12
    OR.L #0x80000000,D6 ; Set sign bit if negative
.SkipNegative_L_12:
    MOVE.L D6,(A0)   ; Store flags at offset 0
    MOVE.L D3,4(A0)       ; Store high at offset 4
    MOVE.L D1,8(A0)       ; Store low at offset 8
    MOVE.L D2,12(A0)     ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0012: call
    ; System.Decimal.op_Explicit (inline)
    ; TODO: System.Decimal.op_Explicit

    ; Offset 0017: conv.r8
    MOVE.L D1,D2  ; Convert to R8 (high word)
    CLR.L D3          ; Convert to R8 (low word)

    ; Offset 0018: stloc.1
    MOVE.L D2,-8(A6)    ; Store to local 1 (high)
    MOVE.L D3,-12(A6)   ; Store to local 1 (low)

    ; Offset 0019: ldc.r8
    LEA DOUBLE_CONST_0019(PC),A0
    MOVE.L (A0),D3     ; Double high word
    MOVE.L 4(A0),D2    ; Double low word

    ; Offset 0022: box
    ; Box type token 01000013
    MOVE.L D2,D0     ; Boxed value

    ; Offset 0027: ldloc.1
    MOVE.L -12(A6),D2      ; Load local.1 (high)
    MOVE.L -8(A6),D1  ; Load local.1 (low)

    ; Offset 0028: ldc.i4.5
    MOVE.L #5,D4         ; Load 5

    ; Offset 0029: call
    ; System.Math.Round (inline) - 2 parameters
    ; Round(D2:D1, D4) - double precision rounding
    ; TODO: Implement IEEE double rounding to D4 decimal places
    ; For now: return double value unchanged
    ; (Proper implementation requires FPU or fixed-point conversion)
    MOVE.L D2,D5  ; Copy high word
    MOVE.L D1,D6    ; Copy low word

    ; Offset 002E: box
    ; Box type token 01000013
    MOVE.L D6,D0     ; Boxed value

    ; Offset 0033: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 0038: stloc.2
    MOVE.L D6,-12(A6)  ; Store to local 2

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
    ; TODO: Unimplemented opcode conv.u1

    ; Offset 0009: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 000A: ldc.i4.s
    MOVE.L #44,D0  ; Load short constant

    ; Offset 000C: box
    ; Box type token 01000014
    MOVE.L D0,D0     ; Boxed value

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
    ; TODO: Unimplemented opcode conv.i8

    ; Offset 0004: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0

    ; Offset 0005: ldloc.0
    MOVE.L -8(A6),D0  ; Load local.0

    ; Offset 0006: conv.i4
    MOVE.L D0,D1  ; Convert to I4

    ; Offset 0007: stloc.1
    MOVE.L D1,-8(A6)   ; Store to local 1

    ; Offset 0008: ldc.i4.s
    MOVE.L #42,D1  ; Load short constant

    ; Offset 000A: box
    ; Box type token 01000014
    MOVE.L D1,D0     ; Boxed value

    ; Offset 000F: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0010: box
    ; Box type token 01000014
    MOVE.L D1,D0     ; Boxed value

    ; Offset 0015: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001A: stloc.2
    MOVE.L D1,-12(A6)  ; Store to local 2

    ; Offset 001B: ret
    CLR.L D0            ; Clear return value (void)


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
    ; TODO: Unimplemented opcode conv.i8

    ; Offset 0006: stloc.1
    MOVE.L D0,-8(A6)   ; Store to local 1

    ; Offset 0007: ldc.i4.s
    MOVE.L #42,D0  ; Load short constant

    ; Offset 0009: conv.i8
    ; TODO: Unimplemented opcode conv.i8

    ; Offset 000A: box
    ; Box type token 01000016
    MOVE.L D0,D0     ; Boxed value

    ; Offset 000F: ldloc.1
    MOVE.L -12(A6),D1  ; Load local.1

    ; Offset 0010: box
    ; Box type token 01000016
    MOVE.L D1,D0     ; Boxed value

    ; Offset 0015: call
    ; Framework method: System.Object::Equals
    ; TODO: Implement framework call

    ; Offset 001A: stloc.2
    MOVE.L D1,-12(A6)  ; Store to local 2

    ; Offset 001B: ret
    CLR.L D0            ; Clear return value (void)


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
    ; TODO: System.Decimal.op_Explicit

    ; Offset 0010: stloc.3
    MOVE.L D1,-16(A6)  ; Store to local 3

    ; Offset 0011: ldc.i4.s
    MOVE.L #42,D1  ; Load short constant

    ; Offset 0013: newobj
    ; System.Decimal newobj - create new instance (1 parameters)
    ; TODO: Decimal newobj with 1 parameters (expected 5)

    ; Offset 0018: ldloc.3
    MOVE.L -20(A6),D4  ; Load local.3

    ; Offset 0019: call
    ; System.Decimal.Equals (inline)
    ; System.Decimal Equals inline
    MOVE.L D3,A0    ; A0 = address of left operand
    MOVE.L D4,A1  ; A1 = address of right operand
    MOVE.L #1,D5     ; Assume equal
    MOVE.L (A0),D6    ; Load left flags
    CMP.L (A1),D6    ; Compare flags
    BNE .NotEqual_L_13
    MOVE.L 4(A0),D6   ; Load left high
    CMP.L 4(A1),D6   ; Compare high
    BNE .NotEqual_L_13
    MOVE.L 8(A0),D6   ; Load left low
    CMP.L 8(A1),D6   ; Compare low
    BNE .NotEqual_L_13
    MOVE.L 12(A0),D6  ; Load left mid
    CMP.L 12(A1),D6  ; Compare mid
    BNE .NotEqual_L_13
    BRA .Done_L_14
.NotEqual_L_13:
    MOVE.L #0,D5     ; Not equal
.Done_L_14:

    ; Offset 001E: stloc.s
    MOVE.L D5,-20(A6)  ; Store to local 4

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
DOUBLE_CONST_0019:
    DC.L $00000000
    DC.L $40454000
FLOAT_CONST_0001:
    DC.L $422A0000
FLOAT_CONST_0007:
    DC.L $42280000
FLOAT_CONST_000E:
    DC.L $422A0000
FLOAT_CONST_0019:
    DC.L $422A0000

    ; --- Data Section ---
    SECTION DATA

JumpCS.TestMath.Program_vtable:
    DC.L JumpCS.TestMath.Program         ; Class pointer

JumpCS.TestMath.Tests.TypeConversionTests_vtable:
    DC.L JumpCS.TestMath.Tests.TypeConversionTests         ; Class pointer

    END
