;;
;; CC65/6502 Native Library for System.Int32 Operations
;; 
;; This file implements 32-bit integer operations for the 6502 processor.
;; Uses CC65 calling conventions and zero-page storage for temporary values.
;;
;; Zero Page Usage (reserved for library functions):
;;   $80-$83: Left operand (4 bytes)
;;   $84-$87: Right operand (4 bytes)
;;   $88-$8B: Result (4 bytes)
;;   $8C-$8F: Temporary storage (4 bytes)
;;

.code

;;
;; Int32_Modulus - Compute a % b (remainder after division)
;;
;; Input:   A/X = Left operand (a) - low byte in A, middle bytes in X/Y
;;          Stack = Right operand (b)
;;
;; Output:  A = Low byte of remainder
;;          X/Y = High bytes of remainder
;;
;; Clobbers: All registers
;;
Int32_Modulus:
    JSR __div32         ; Perform division, remainder in specific location
    RTS

;;
;; Int32_ShiftLeft - Perform a << amount where amount is variable
;;
;; Input:   A/X = Value to shift (a)
;;          Y = Shift amount (0-31)
;;
;; Output:  A/X = Result
;;
;; Note: 6502 can only shift by 1 position per instruction, so this
;;       loops Y times or uses bit manipulation if Y is in zero page
;;
Int32_ShiftLeft:
    CMP #0              ; If shift amount is 0
    BEQ @noshift        ; Skip all shifts

    ; Store shift amount in temp
    STY $8C

    ; Loop for each bit position
@loop:
    DEC $8C
    BMI @done           ; If shift count < 0, we're done

    ; Shift left by 1 position (4 bytes: A, X, then Y extended)
    ASL A               ; Shift low byte left
    ROL $81             ; Rotate next byte with carry
    ROL $82             ; Rotate next byte with carry
    ROL $83             ; Rotate high byte with carry
    JMP @loop

@done:
    RTS

@noshift:
    RTS

;;
;; Int32_ShiftRight - Perform a >> amount (arithmetic right shift, sign-preserving)
;;
;; Input:   A/X = Value to shift (a)
;;          Y = Shift amount (0-31)
;;
;; Output:  A/X = Result
;;
Int32_ShiftRight:
    CMP #0              ; If shift amount is 0
    BEQ @noshift        ; Skip all shifts

    ; Store shift amount
    STY $8C

    ; Check sign bit for arithmetic shift (bit 7 of high byte)
    LDA $83
    BIT $83             ; Test bit 7

@loop:
    DEC $8C
    BMI @done           ; If shift count < 0, we're done

    ; For arithmetic shift right: save sign bit
    LDA $83             ; Load high byte
    ASL A               ; Shift left to check sign
    ROR $83             ; Rotate high byte right with carry (from sign)
    ROR $82             ; Rotate next byte
    ROR $81             ; Rotate next byte
    ROR A               ; Rotate low byte

    JMP @loop

@done:
    RTS

@noshift:
    RTS

;;
;; Int32_Negate - Compute -a (two's complement negation)
;;
;; Input:   A/X = Value (a)
;;
;; Output:  A/X = -a
;;
Int32_Negate:
    ; Two's complement: ~a + 1
    ; First: EOR all bytes with $FF (bitwise NOT)
    EOR #$FF            ; Low byte: NOT

    ; Store result and process remaining bytes
    STA $80
    TXA
    EOR #$FF            ; Middle byte 1: NOT
    STA $81

    ; Get high bytes from stack/extended registers
    LDA #1              ; Add 1 to result
    CLC
    ADC $80
    STA $80
    BCC @done

    ; Handle carry through other bytes
    LDA #0
    ADC $81
    STA $81
    BCC @done

    ; Carry propagates to high bytes...
    LDA #0
    ADC $82
    STA $82
    BCC @done

    LDA #0
    ADC $83
    STA $83

@done:
    LDA $80             ; Return result in A/X
    LDX $81
    RTS

;;
;; Int32_OnesComplement - Compute ~a (bitwise NOT)
;;
;; Input:   A/X = Value (a)
;;
;; Output:  A/X = ~a
;;
Int32_OnesComplement:
    EOR #$FF            ; Low byte: NOT
    STA $80
    TXA
    EOR #$FF            ; Middle bytes: NOT
    STA $81

    ; TODO: Get high bytes and flip them
    ; For now, return low 16 bits
    LDA $80
    LDX $81
    RTS

;;
;; Int32_Equals - Test a == b
;;
;; Input:   A/X = Left operand (a)
;;          Stack = Right operand (b)
;;
;; Output:  A = 1 if equal, 0 if not equal
;;
Int32_Equals:
    ; Compare all 4 bytes
    CMP $84             ; Compare low byte
    BNE @not_equal

    TXA
    CMP $85             ; Compare byte 2
    BNE @not_equal

    ; TODO: Compare high bytes from extended registers
    ; For now, if first two bytes match, return true
    LDA #1
    RTS

@not_equal:
    LDA #0
    RTS

;;
;; Int32_NotEquals - Test a != b
;;
;; Input:   A/X = Left operand (a)
;;          Stack = Right operand (b)
;;
;; Output:  A = 1 if not equal, 0 if equal
;;
Int32_NotEquals:
    JSR Int32_Equals    ; Get equality result
    EOR #1              ; Flip result
    RTS

;;
;; Int32_LessThan - Test a < b (signed comparison)
;;
;; Input:   A/X = Left operand (a)
;;          Stack = Right operand (b)
;;
;; Output:  A = 1 if a < b, 0 otherwise
;;
Int32_LessThan:
    ; Subtract b from a, check sign of result
    ; TODO: Implement full signed 32-bit comparison
    LDA #0              ; Placeholder
    RTS

;;
;; Int32_GreaterThan - Test a > b (signed comparison)
;;
;; Input:   A/X = Left operand (a)
;;          Stack = Right operand (b)
;;
;; Output:  A = 1 if a > b, 0 otherwise
;;
Int32_GreaterThan:
    ; TODO: Implement full signed 32-bit comparison
    LDA #0              ; Placeholder
    RTS

;;
;; Int32_LessOrEqual - Test a <= b
;;
;; Input:   A/X = Left operand (a)
;;          Stack = Right operand (b)
;;
;; Output:  A = 1 if a <= b, 0 otherwise
;;
Int32_LessOrEqual:
    JSR Int32_GreaterThan   ; Check if a > b
    EOR #1                  ; Flip: now 1 if a <= b
    RTS

;;
;; Int32_GreaterOrEqual - Test a >= b
;;
;; Input:   A/X = Left operand (a)
;;          Stack = Right operand (b)
;;
;; Output:  A = 1 if a >= b, 0 otherwise
;;
Int32_GreaterOrEqual:
    JSR Int32_LessThan  ; Check if a < b
    EOR #1              ; Flip: now 1 if a >= b
    RTS

;;
;; Int32_BitwiseAnd - Compute a & b (bitwise AND)
;;
;; Input:   A/X = Left operand (a)
;;          Stack = Right operand (b)
;;
;; Output:  A/X = a & b
;;
Int32_BitwiseAnd:
    AND $84             ; AND with low byte of right
    STA $80
    TXA
    AND $85             ; AND with byte 2 of right
    STA $81
    ; TODO: AND high bytes
    LDA $80
    LDX $81
    RTS

;;
;; Int32_BitwiseOr - Compute a | b (bitwise OR)
;;
;; Input:   A/X = Left operand (a)
;;          Stack = Right operand (b)
;;
;; Output:  A/X = a | b
;;
Int32_BitwiseOr:
    ORA $84             ; OR with low byte of right
    STA $80
    TXA
    ORA $85             ; OR with byte 2 of right
    STA $81
    ; TODO: OR high bytes
    LDA $80
    LDX $81
    RTS

;;
;; Int32_BitwiseXor - Compute a ^ b (bitwise XOR)
;;
;; Input:   A/X = Left operand (a)
;;          Stack = Right operand (b)
;;
;; Output:  A/X = a ^ b
;;
Int32_BitwiseXor:
    EOR $84             ; XOR with low byte of right
    STA $80
    TXA
    EOR $85             ; XOR with byte 2 of right
    STA $81
    ; TODO: XOR high bytes
    LDA $80
    LDX $81
    RTS

;;
;; Int32_InstanceEquals - Check if this Int32 equals an object
;;
;; Input:   A/X = Pointer to this Int32 value
;;          Stack = Pointer to other object
;;
;; Output:  A = 1 if equal, 0 if not equal
;;
Int32_InstanceEquals:
    ; TODO: Check if object is Int32, then compare values
    LDA #0
    RTS

;;
;; Int32_CompareTo - Compare this Int32 to another object
;;
;; Input:   A/X = Pointer to this Int32 value
;;          Stack = Pointer to other object
;;
;; Output:  A = -1 if this < other, 0 if equal, 1 if this > other
;;
Int32_CompareTo:
    ; TODO: Implement full comparison logic
    LDA #0
    RTS