; System.Decimal native runtime support for Motorola 68000
; Generated for m68k-atari-elf target
;
; Decimal structure (16 bytes):
;   Offset 0:  Flags (scale in bits 16-23, sign in bit 31)
;   Offset 4:  High 32-bit mantissa
;   Offset 8:  Low 32-bit mantissa
;   Offset 12: Mid 32-bit mantissa
;
; Calling Convention:
;   Input:  A0 = address of left/operand Decimal
;           A1 = address of right Decimal (for binary ops)
;           A6 = frame pointer (result buffer at A6-32)
;   Output: Result Decimal at A6-32
;   Modifies: D0-D7, A2-A3
;   Preserves: A4-A7 (system registers)

    SECTION CODE

;;
;; System.Decimal.op_Multiply - Multiply two Decimal values
;;
;; Input:  A0 = address of left operand (Decimal)
;;         A1 = address of right operand (Decimal)
;;         A6 = frame pointer (can use local stack at A6-32 for result)
;;
;; Output: Result Decimal at A6-32
;;
;; Registers used: D0-D7, A2-A3
;; Registers preserved: A4-A7
;;
;; Note: This implementation handles multiplication of the low 32-bit parts
;;       and adjusts the scale appropriately. Full 128-bit multiplication
;;       would require more complex 96-bit mantissa handling.
;;
;; jvm-method System/Decimal.op_Multiply(Decimal;Decimal;)Decimal
System_Decimal_Multiply:
    ; Save work registers
    MOVEM.L D2-D7/A2-A3,-(A7)

    ; A0 = left operand address
    ; A1 = right operand address
    LEA -32(A6),A2        ; A2 = result buffer address

    ; Load flags and extract scales and signs
    MOVE.L (A0),D0        ; D0 = flags of left
    MOVE.L (A1),D1        ; D1 = flags of right

    ; Extract scales (bits 16-23)
    MOVE.L D0,D2
    MOVE.L D1,D3
    LSR.L #16,D2
    LSR.L #16,D3
    AND.L #0xFF,D2        ; D2 = scale of left
    AND.L #0xFF,D3        ; D3 = scale of right
    ADD.L D3,D2           ; D2 = combined scale

    ; Extract signs (bit 31)
    MOVE.L D0,D4
    MOVE.L D1,D5
    LSR.L #31,D4          ; D4 = sign of left
    LSR.L #31,D5          ; D5 = sign of right
    EOR.L D5,D4           ; D4 = result sign (XOR)

    ; Load low mantissas for multiplication
    MOVE.L 8(A0),D6       ; D6 = left low
    MOVE.L 8(A1),D7       ; D7 = right low

    ; Multiply: D0:D6 = D6 * D7 (64-bit result)
    ; Note: MULU.L is 32x32->64 on 68020+
    MULU.L D7,D0:D6       ; D0 = high part, D6 = low part of product
    MOVE.L D6,D1          ; D1 = low part of result

    ; Check if scale exceeds 255
    CMP.L #256,D2
    BLT .Mult_ScaleOK
    MOVE.L #255,D2        ; Cap scale at 255
.Mult_ScaleOK:

    ; Build result flags
    CLR.L D3
    LSL.L #16,D2          ; Shift scale to bits 16-23
    OR.L D2,D3            ; Set scale in flags

    ; Add sign if negative
    TST.L D4
    BEQ .Mult_NoSign
    OR.L #0x80000000,D3   ; Set sign bit if negative (result is negative)
.Mult_NoSign:

    ; Store result in buffer at A6-32
    MOVE.L D3,(A2)        ; Store flags at offset 0
    MOVE.L #0,4(A2)       ; Store high=0 at offset 4 (simplified)
    MOVE.L D1,8(A2)       ; Store low at offset 8
    CLR.L 12(A2)          ; Store mid=0 at offset 12 (simplified)

    ; Return (result at A6-32)
    MOVEM.L (A7)+,D2-D7/A2-A3
    RTS

;;
;; System.Decimal.op_Division - Divide two Decimal values
;;
;; Includes divide-by-zero protection
;;
;; Input:  A0 = address of left operand (numerator)
;;         A1 = address of right operand (denominator)
;;         A6 = frame pointer
;;
;; Output: Result Decimal at A6-32
;;
;; Exception:
;;   If denominator is zero, stores a zero Decimal in result and returns.
;;   (Caller should check for this or be prepared for undefined behavior)
;;
;; jvm-method System/Decimal.op_Division(Decimal;Decimal;)Decimal
System_Decimal_Divide:
    ; Save work registers
    MOVEM.L D2-D7/A2-A3,-(A7)

    LEA -32(A6),A2        ; A2 = result address

    ; Check for division by zero
    MOVE.L 8(A1),D7       ; D7 = denominator low
    BNE .Div_CheckMid
    MOVE.L 12(A1),D7      ; D7 = denominator mid
    BNE .Div_CheckMid
    MOVE.L 4(A1),D7       ; D7 = denominator high
    BNE .Div_CheckMid

    ; Division by zero - store zero and return
    CLR.L (A2)            ; Flags = 0
    CLR.L 4(A2)           ; High = 0
    CLR.L 8(A2)           ; Low = 0
    CLR.L 12(A2)          ; Mid = 0
    BRA .Div_Exit

.Div_CheckMid:
    ; Load flags and extract scales and signs
    MOVE.L (A0),D0        ; D0 = flags of numerator
    MOVE.L (A1),D1        ; D1 = flags of denominator

    ; Extract scales
    MOVE.L D0,D2
    MOVE.L D1,D3
    LSR.L #16,D2
    LSR.L #16,D3
    AND.L #0xFF,D2        ; D2 = scale of numerator
    AND.L #0xFF,D3        ; D3 = scale of denominator
    SUB.L D3,D2           ; D2 = result scale

    ; Ensure scale is non-negative and <= 255
    TST.L D2
    BGE .Div_ScalePos
    CLR.L D2              ; Clamp to 0 if negative
.Div_ScalePos:
    CMP.L #255,D2
    BLE .Div_ScaleOK
    MOVE.L #255,D2        ; Cap at 255
.Div_ScaleOK:

    ; Extract signs
    MOVE.L D0,D4
    MOVE.L D1,D5
    LSR.L #31,D4
    LSR.L #31,D5
    EOR.L D5,D4           ; D4 = result sign

    ; Load mantissas and perform division
    MOVE.L 8(A0),D6       ; D6 = numerator low
    MOVE.L 8(A1),D7       ; D7 = denominator low

    ; Divide: D6 = D6 / D7
    DIVU.L D7,D6          ; D6 = quotient (remainder in upper part)

    ; Build result flags
    CLR.L D3
    LSL.L #16,D2
    OR.L D2,D3

    ; Add sign if negative
    TST.L D4
    BEQ .Div_NoSign
    OR.L #0x80000000,D3
.Div_NoSign:

    ; Store result
    MOVE.L D3,(A2)
    MOVE.L #0,4(A2)
    MOVE.L D6,8(A2)
    CLR.L 12(A2)

.Div_Exit:
    MOVEM.L (A7)+,D2-D7/A2-A3
    RTS

;;
;; System.Decimal.op_Modulus - Modulus (remainder) of two Decimal values
;;
;; Includes divide-by-zero protection
;;
;; jvm-method System/Decimal.op_Modulus(Decimal;Decimal;)Decimal
System_Decimal_Modulus:
    ; Save work registers
    MOVEM.L D2-D7/A2-A3,-(A7)

    LEA -32(A6),A2        ; Result address

    ; Check for division by zero
    MOVE.L 8(A1),D7
    BNE .Mod_CheckMid
    MOVE.L 12(A1),D7
    BNE .Mod_CheckMid
    MOVE.L 4(A1),D7
    BNE .Mod_CheckMid

    ; Division by zero - store zero and return
    CLR.L (A2)
    CLR.L 4(A2)
    CLR.L 8(A2)
    CLR.L 12(A2)
    BRA .Mod_Exit

.Mod_CheckMid:
    ; Load operands
    MOVE.L (A0),D0        ; Flags of left
    MOVE.L (A1),D1        ; Flags of right
    MOVE.L 8(A0),D6       ; Low of left (numerator)
    MOVE.L 8(A1),D7       ; Low of right (divisor)

    ; Perform modulus: D6 = D6 % D7
    ; First divide to get remainder
    MOVE.L D6,D2
    DIVU.L D7,D2          ; D2 = quotient (upper) / remainder (lower)

    ; Extract remainder from upper 32 bits
    SWAP D2               ; Move remainder to low word
    AND.L #0xFFFF,D2

    ; Keep scale from left operand
    MOVE.L D0,D3
    AND.L #0x80FF0000,D3  ; Keep sign and scale

    ; Store result
    MOVE.L D3,(A2)
    MOVE.L #0,4(A2)
    MOVE.L D2,8(A2)
    CLR.L 12(A2)

.Mod_Exit:
    MOVEM.L (A7)+,D2-D7/A2-A3
    RTS

;;
;; System.Decimal.op_UnaryNegation - Negate a Decimal value
;;
;; Input:  A0 = address of operand
;;         A6 = frame pointer
;;
;; Output: Result Decimal at A6-32
;;
;; jvm-method System/Decimal.op_UnaryNegation(Decimal;)Decimal
System_Decimal_Negate:
    ; Save registers
    MOVEM.L D0-D1/A2,-(A7)

    LEA -32(A6),A2        ; Result address

    ; Load flags
    MOVE.L (A0),D0        ; D0 = flags

    ; Toggle sign bit (XOR with 0x80000000)
    EOR.L #0x80000000,D0

    ; Store result (copy with negated sign)
    MOVE.L D0,(A2)
    MOVE.L 4(A0),4(A2)
    MOVE.L 8(A0),8(A2)
    MOVE.L 12(A0),12(A2)

    MOVEM.L (A7)+,D0-D1/A2
    RTS

;;
;; System.Decimal.Abs - Absolute value of a Decimal
;;
;; Input:  A0 = address of operand
;;         A6 = frame pointer
;;
;; Output: Result Decimal at A6-32 (always positive)
;;
;; jvm-method System/Decimal.Abs(Decimal;)Decimal
System_Decimal_Abs:
    ; Save registers
    MOVEM.L D0/A2,-(A7)

    LEA -32(A6),A2        ; Result address

    ; Load flags and clear sign bit
    MOVE.L (A0),D0
    AND.L #0x7FFFFFFF,D0  ; Clear sign bit (make positive)

    ; Store result
    MOVE.L D0,(A2)
    MOVE.L 4(A0),4(A2)
    MOVE.L 8(A0),8(A2)
    MOVE.L 12(A0),12(A2)

    MOVEM.L (A7)+,D0/A2
    RTS

    END