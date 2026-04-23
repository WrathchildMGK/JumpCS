; System.Int32 (int) native runtime support for Motorola 68000
; Generated for m68k-atari-elf target
;
; Integer arithmetic and comparison operations

    SECTION CODE

;;
;; Int32.Modulus - Integer remainder operation
;;
;; Input:  D0 = dividend (numerator)
;;         D1 = divisor (denominator)
;;
;; Output: D0 = remainder (dividend % divisor)
;;
;; Note: Uses DIVS.L which on 68020+ gives quotient in D0 and remainder in D1
;;
;; jvm-method System/Int32.op_Modulus(II)I
Int32_Modulus:
    DIVS.L D1,D0            ; D0 = quotient, D1 = remainder (68020+)
    MOVE.L D1,D0            ; Move remainder to D0
    RTS

;;
;; Int32.ShiftLeft - Arithmetic left shift by variable amount
;;
;; Input:  D0 = value to shift
;;         D1 = shift amount (in bits, must be 0-31 for 32-bit)
;;
;; Output: D0 = shifted value
;;
;; Note: On 68000, shift instructions can only shift by immediate 1-8 or via register
;;       For variable shifts, we use shift with D1 in register (counts modulo 64)
;;
;; jvm-method System/Int32.op_LeftShift(II)I
Int32_ShiftLeft:
    ANDI.L #0x1F,D1         ; Mask shift amount to 0-31 (32-bit values)
    LSL.L D1,D0             ; Logical shift left by D1 bits
    RTS

;;
;; Int32.ShiftRight - Arithmetic right shift (sign-extending)
;;
;; Input:  D0 = value to shift
;;         D1 = shift amount (in bits, must be 0-31 for 32-bit)
;;
;; Output: D0 = shifted value (sign-extended)
;;
;; Note: Uses ASR (arithmetic shift right) to preserve sign bit
;;
;; jvm-method System/Int32.op_RightShift(II)I
Int32_ShiftRight:
    ANDI.L #0x1F,D1         ; Mask shift amount to 0-31
    ASR.L D1,D0             ; Arithmetic shift right (sign-extending)
    RTS

;;
;; Int32.Equals - Check if two integer values are equal
;;
;; Input:  D0 = first value
;;         D1 = second value
;;
;; Output: D0 = 1 if equal, 0 if not equal
;;
;; This is called from the Object.Equals override
;;
;; jvm-method System/Int32.Equals(LSystem/Object;)Z
Int32_Equals:
    CMP.L D1,D0             ; Compare D0 with D1
    BNE .Equals_False

    MOVE.L #1,D0            ; Return 1 (true)
    RTS

.Equals_False:
    CLR.L D0                ; Return 0 (false)
    RTS

;;
;; Int32.CompareTo - Compare two integer values
;;
;; Input:  D0 = this value
;;         D1 = other value
;;
;; Output: D0 = -1 if this < other
;;            = 0 if this == other
;;            = 1 if this > other
;;
;; This implements the IComparable interface
;;
;; jvm-method System/Int32.CompareTo(LSystem/Object;)I
Int32_CompareTo:
    CMP.L D1,D0             ; Compare D0 with D1
    BEQ .CompareTo_Equal
    BLT .CompareTo_Less

    ; D0 > D1
    MOVE.L #1,D0
    RTS

.CompareTo_Less:
    MOVE.L #-1,D0
    RTS

.CompareTo_Equal:
    CLR.L D0
    RTS

    END