;;
;; CC65/6502 Native Library for System.Double (64-bit float) Operations
;;
;; IEEE 754 Double format (64 bits):
;;   Sign (1): bit 63
;;   Exponent (11): bits 62-52
;;   Mantissa (52): bits 51-0
;;
;; Special values:
;;   NaN:         Exponent = 0x7FF, Mantissa ≠ 0
;;   +Infinity:   0x7FF0000000000000
;;   -Infinity:   0xFFF0000000000000
;;
;; WARNING: 64-bit operations on 6502 are VERY slow
;; Doubles require 8 bytes of storage and careful register management
;;

.code

;;
;; Double_Negate - Negate a double value (toggle sign bit)
;;
;; Input:  A/X/Y/extended = Double value (8 bytes)
;;
;; Output: A/X/Y/extended = Negated value
;;
;; Implementation: XOR sign bit of high byte with 0x80
;;
Double_Negate:
    ; TODO: Extract high byte, XOR with 0x80, store back
    EOR #$80
    RTS

;;
;; Double_Equals - Test equality (A == B)
;;
;; Input:  Stack contains: left (8 bytes), right (8 bytes)
;;
;; Output: A = 1 if equal, 0 if not (or NaN result)
;;
;; TODO: Handle NaN comparison, compare all 8 bytes
;;
Double_Equals:
    ; TODO: Full 64-bit comparison
    LDA #0
    RTS

;;
;; Double_NotEquals - Test inequality (A != B)
;;
;; Input:  Stack contains: left (8 bytes), right (8 bytes)
;;
;; Output: A = 1 if not equal, 0 if equal
;;
Double_NotEquals:
    JSR Double_Equals
    EOR #1
    RTS

;;
;; Double_LessThan - Test A < B
;;
;; Input:  Stack contains: left (8 bytes), right (8 bytes)
;;
;; Output: A = 1 if a < b, 0 otherwise
;;
;; TODO: IEEE 754 signed comparison
;;
Double_LessThan:
    LDA #0
    RTS

;;
;; Double_GreaterThan - Test A > B
;;
;; Input:  Stack contains: left (8 bytes), right (8 bytes)
;;
;; Output: A = 1 if a > b, 0 otherwise
;;
Double_GreaterThan:
    LDA #0
    RTS

;;
;; Double_LessThanOrEqual - Test A <= B
;;
;; Input:  Stack contains: left (8 bytes), right (8 bytes)
;;
;; Output: A = 1 if a <= b, 0 otherwise
;;
Double_LessThanOrEqual:
    JSR Double_GreaterThan
    EOR #1
    RTS

;;
;; Double_GreaterThanOrEqual - Test A >= B
;;
;; Input:  Stack contains: left (8 bytes), right (8 bytes)
;;
;; Output: A = 1 if a >= b, 0 otherwise
;;
Double_GreaterThanOrEqual:
    JSR Double_LessThan
    EOR #1
    RTS

;;
;; Double_InstanceEquals - Instance Equals(object) method
;;
;; Input:  Stack contains: this (8 bytes), obj (reference)
;;
;; Output: A = 1 if equal, 0 otherwise
;;
Double_InstanceEquals:
    ; TODO: Type check, then compare doubles
    LDA #0
    RTS

;;
;; Double_IsNaN - Check if value is NaN
;;
;; Input:  Stack contains: value (8 bytes)
;;
;; Output: A = 1 if NaN, 0 otherwise
;;
;; IEEE 754: NaN has exponent = 0x7FF and mantissa ≠ 0
;;
Double_IsNaN:
    ; TODO: Extract exponent and mantissa bits, check pattern
    LDA #0
    RTS

;;
;; Double_IsInfinity - Check if value is ±Infinity
;;
;; Input:  Stack contains: value (8 bytes)
;;
;; Output: A = 1 if infinity, 0 otherwise
;;
;; IEEE 754: Infinity has exponent = 0x7FF and mantissa = 0
;;
Double_IsInfinity:
    ; TODO: Extract exponent and mantissa, check pattern
    LDA #0
    RTS

;;
;; Double_IsPositiveInfinity - Check if value is +Infinity
;;
;; Input:  Stack contains: value (8 bytes)
;;
;; Output: A = 1 if +infinity, 0 otherwise
;;
;; Pattern: 0x7FF0000000000000
;;
Double_IsPositiveInfinity:
    ; TODO: Direct pattern match (8 bytes)
    LDA #0
    RTS

;;
;; Double_IsNegativeInfinity - Check if value is -Infinity
;;
;; Input:  Stack contains: value (8 bytes)
;;
;; Output: A = 1 if -infinity, 0 otherwise
;;
;; Pattern: 0xFFF0000000000000
;;
Double_IsNegativeInfinity:
    ; TODO: Direct pattern match (8 bytes)
    LDA #0
    RTS