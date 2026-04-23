; System.Single (float) native runtime support for Motorola 68000
; Generated for m68k-atari-elf target
;
; IEEE 754 single-precision (32-bit) helper functions
; These supplement the LIBGCC float functions (__addsf3, __subsf3, etc.)

    SECTION CODE

;;
;; Single.IsNaN - Check if a float value is NaN (Not a Number)
;;
;; Input:  D0 = IEEE 754 single-precision float value
;;
;; Output: D0 = 1 if NaN, 0 if not NaN
;;
;; IEEE 754 NaN: Exponent = 0xFF (all 1s), Mantissa != 0
;;
;; jvm-method System/Single.IsNaN(F)Z
Single_IsNaN:
    MOVE.L D0,D1            ; Copy value to D1
    ANDI.L #$7F800000,D1    ; Isolate exponent (bits 23-30)
    CMPI.L #$7F800000,D1    ; Check if exponent is all 1s
    BNE .IsNaN_False

    ; Exponent is all 1s - check if mantissa is non-zero
    MOVE.L D0,D1
    ANDI.L #$007FFFFF,D1    ; Isolate mantissa (bits 0-22)
    TST.L D1
    BEQ .IsNaN_False

    ; Both exponent and mantissa match NaN pattern
    MOVE.L #1,D0            ; Return true (1)
    RTS

.IsNaN_False:
    CLR.L D0                ; Return false (0)
    RTS

;;
;; Single.IsInfinity - Check if float is positive or negative infinity
;;
;; Input:  D0 = IEEE 754 single-precision float value
;;
;; Output: D0 = 1 if infinity (+ or -), 0 otherwise
;;
;; IEEE 754 Infinity: Exponent = 0xFF, Mantissa = 0
;;
;; jvm-method System/Single.IsInfinity(F)Z
Single_IsInfinity:
    MOVE.L D0,D1
    ANDI.L #$7FFFFFFF,D1    ; Clear sign bit
    CMPI.L #$7F800000,D1    ; Compare with positive infinity
    BNE .IsInf_False

    ; Matches infinity pattern
    MOVE.L #1,D0
    RTS

.IsInf_False:
    CLR.L D0
    RTS

;;
;; Single.IsPositiveInfinity - Check if float is positive infinity
;;
;; Input:  D0 = IEEE 754 single-precision float value
;;
;; Output: D0 = 1 if positive infinity, 0 otherwise
;;
;; Positive Infinity: 0x7F800000
;;
;; jvm-method System/Single.IsPositiveInfinity(F)Z
Single_IsPositiveInfinity:
    CMPI.L #$7F800000,D0
    BNE .IsPositiveInf_False

    MOVE.L #1,D0
    RTS

.IsPositiveInf_False:
    CLR.L D0
    RTS

;;
;; Single.IsNegativeInfinity - Check if float is negative infinity
;;
;; Input:  D0 = IEEE 754 single-precision float value
;;
;; Output: D0 = 1 if negative infinity, 0 otherwise
;;
;; Negative Infinity: 0xFF800000
;;
;; jvm-method System/Single.IsNegativeInfinity(F)Z
Single_IsNegativeInfinity:
    CMPI.L #$FF800000,D0
    BNE .IsNegativeInf_False

    MOVE.L #1,D0
    RTS

.IsNegativeInf_False:
    CLR.L D0
    RTS

    END