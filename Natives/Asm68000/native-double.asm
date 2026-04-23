; System.Double (double) native runtime support for Motorola 68000
; Generated for m68k-atari-elf target
;
; IEEE 754 double-precision (64-bit) helper functions
; These supplement the LIBGCC double functions (__adddf3, __subdf3, etc.)

    SECTION CODE

;;
;; Double.IsNaN - Check if a double value is NaN (Not a Number)
;;
;; Input:  D0:D1 = IEEE 754 double-precision value (D0=high, D1=low)
;;
;; Output: D0 = 1 if NaN, 0 if not NaN
;;
;; IEEE 754 NaN (64-bit): Exponent = 0x7FF (all 1s), Mantissa != 0
;;                        Exponent bits are in D0 bits 20-30
;;                        Mantissa is D0 bits 0-19 and all of D1
;;
;; jvm-method System/Double.IsNaN(D)Z
Double_IsNaN:
    MOVE.L D0,D2            ; Copy high word to D2
    ANDI.L #$7FF00000,D2    ; Isolate exponent (bits 20-30 in high word)
    CMPI.L #$7FF00000,D2    ; Check if exponent is all 1s
    BNE .IsNaN_False

    ; Exponent is all 1s - check if mantissa is non-zero
    MOVE.L D0,D2
    ANDI.L #$000FFFFF,D2    ; Isolate mantissa high (bits 0-19)
    TST.L D2
    BNE .IsNaN_True
    TST.L D1                ; Check mantissa low
    BEQ .IsNaN_False

.IsNaN_True:
    MOVE.L #1,D0            ; Return true (1)
    RTS

.IsNaN_False:
    CLR.L D0                ; Return false (0)
    RTS

;;
;; Double.IsInfinity - Check if double is positive or negative infinity
;;
;; Input:  D0:D1 = IEEE 754 double-precision value (D0=high, D1=low)
;;
;; Output: D0 = 1 if infinity (+ or -), 0 otherwise
;;
;; IEEE 754 Infinity (64-bit): Exponent = 0x7FF, Mantissa = 0
;;
;; jvm-method System/Double.IsInfinity(D)Z
Double_IsInfinity:
    MOVE.L D0,D2
    ANDI.L #$7FFFFFFF,D2    ; Clear sign bit
    CMPI.L #$7FF00000,D2    ; Compare exponent with all 1s
    BNE .IsInf_False

    ; Check if mantissa is zero
    MOVE.L D0,D2
    ANDI.L #$000FFFFF,D2    ; Mantissa high
    TST.L D2
    BNE .IsInf_False
    TST.L D1                ; Mantissa low
    BNE .IsInf_False

    ; Matches infinity pattern
    MOVE.L #1,D0
    RTS

.IsInf_False:
    CLR.L D0
    RTS

;;
;; Double.IsPositiveInfinity - Check if double is positive infinity
;;
;; Input:  D0:D1 = IEEE 754 double-precision value
;;
;; Output: D0 = 1 if positive infinity, 0 otherwise
;;
;; Positive Infinity: 0x7FF0000000000000
;;
;; jvm-method System/Double.IsPositiveInfinity(D)Z
Double_IsPositiveInfinity:
    CMPI.L #$7FF00000,D0    ; Check high word
    BNE .IsPositiveInf_False

    TST.L D1                ; Check low word
    BNE .IsPositiveInf_False

    MOVE.L #1,D0
    RTS

.IsPositiveInf_False:
    CLR.L D0
    RTS

;;
;; Double.IsNegativeInfinity - Check if double is negative infinity
;;
;; Input:  D0:D1 = IEEE 754 double-precision value
;;
;; Output: D0 = 1 if negative infinity, 0 otherwise
;;
;; Negative Infinity: 0xFFF0000000000000
;;
;; jvm-method System/Double.IsNegativeInfinity(D)Z
Double_IsNegativeInfinity:
    CMPI.L #$FFF00000,D0    ; Check high word for negative infinity
    BNE .IsNegativeInf_False

    TST.L D1                ; Check low word is zero
    BNE .IsNegativeInf_False

    MOVE.L #1,D0
    RTS

.IsNegativeInf_False:
    CLR.L D0
    RTS

    END