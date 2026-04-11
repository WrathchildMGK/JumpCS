; Generated 68000 Assembly Code
; Converted from C# MSIL
; Generated: 2026-04-11 04:46:14

    ; --- Code Section ---
    SECTION CODE

    ; --- Class Definitions ---
; Class: JumpCS.TestMath.Program
    CLASS_0 EQU 0
    CLASS_SIZE_0 EQU 0
; Class: JumpCS.TestMath.Tests.DecimalMathTests
    CLASS_1 EQU 1
    CLASS_SIZE_1 EQU 0
; Class: JumpCS.TestMath.Tests.DoubleMathTests
    CLASS_2 EQU 2
    CLASS_SIZE_2 EQU 0
; Class: JumpCS.TestMath.Tests.FloatMathTests
    CLASS_3 EQU 3
    CLASS_SIZE_3 EQU 0
; Class: JumpCS.TestMath.Tests.IntegerMathTests
    CLASS_4 EQU 4
    CLASS_SIZE_4 EQU 0
; Class: JumpCS.TestMath.Tests.TypeConversionTests
    CLASS_5 EQU 5
    CLASS_SIZE_5 EQU 0
; Class: System.Decimal
    CLASS_6 EQU 6
    CLASS_SIZE_6 EQU 11
; Class: System.ValueType
    CLASS_7 EQU 7
    CLASS_SIZE_7 EQU 0
; Class: System.ISpanFormattable
    CLASS_8 EQU 8
    CLASS_SIZE_8 EQU 0
; Class: System.IFormattable
    CLASS_9 EQU 9
    CLASS_SIZE_9 EQU 0
; Class: System.IComparable
    CLASS_10 EQU 10
    CLASS_SIZE_10 EQU 0
; Class: System.IConvertible
    CLASS_11 EQU 11
    CLASS_SIZE_11 EQU 0
; Class: System.IComparable`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_12 EQU 12
    CLASS_SIZE_12 EQU 0
; Class: System.IEquatable`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_13 EQU 13
    CLASS_SIZE_13 EQU 0
; Class: System.Runtime.Serialization.ISerializable
    CLASS_14 EQU 14
    CLASS_SIZE_14 EQU 0
; Class: System.Runtime.Serialization.IDeserializationCallback
    CLASS_15 EQU 15
    CLASS_SIZE_15 EQU 0
; Class: System.Numerics.IFloatingPoint`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_16 EQU 16
    CLASS_SIZE_16 EQU 0
; Class: System.Numerics.IFloatingPointConstants`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_17 EQU 17
    CLASS_SIZE_17 EQU 0
; Class: System.Numerics.INumberBase`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_18 EQU 18
    CLASS_SIZE_18 EQU 0
; Class: System.Numerics.IAdditionOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_19 EQU 19
    CLASS_SIZE_19 EQU 0
; Class: System.Numerics.IAdditiveIdentity`2[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_20 EQU 20
    CLASS_SIZE_20 EQU 0
; Class: System.Numerics.IDecrementOperators`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_21 EQU 21
    CLASS_SIZE_21 EQU 0
; Class: System.Numerics.IDivisionOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_22 EQU 22
    CLASS_SIZE_22 EQU 0
; Class: System.Numerics.IEqualityOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_23 EQU 23
    CLASS_SIZE_23 EQU 0
; Class: System.Numerics.IIncrementOperators`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_24 EQU 24
    CLASS_SIZE_24 EQU 0
; Class: System.Numerics.IMultiplicativeIdentity`2[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_25 EQU 25
    CLASS_SIZE_25 EQU 0
; Class: System.Numerics.IMultiplyOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_26 EQU 26
    CLASS_SIZE_26 EQU 0
; Class: System.ISpanParsable`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_27 EQU 27
    CLASS_SIZE_27 EQU 0
; Class: System.IParsable`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_28 EQU 28
    CLASS_SIZE_28 EQU 0
; Class: System.Numerics.ISubtractionOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_29 EQU 29
    CLASS_SIZE_29 EQU 0
; Class: System.Numerics.IUnaryPlusOperators`2[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_30 EQU 30
    CLASS_SIZE_30 EQU 0
; Class: System.Numerics.IUnaryNegationOperators`2[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_31 EQU 31
    CLASS_SIZE_31 EQU 0
; Class: System.IUtf8SpanFormattable
    CLASS_32 EQU 32
    CLASS_SIZE_32 EQU 0
; Class: System.IUtf8SpanParsable`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_33 EQU 33
    CLASS_SIZE_33 EQU 0
; Class: System.Numerics.INumber`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_34 EQU 34
    CLASS_SIZE_34 EQU 0
; Class: System.Numerics.IComparisonOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_35 EQU 35
    CLASS_SIZE_35 EQU 0
; Class: System.Numerics.IModulusOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_36 EQU 36
    CLASS_SIZE_36 EQU 0
; Class: System.Numerics.ISignedNumber`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_37 EQU 37
    CLASS_SIZE_37 EQU 0
; Class: System.Numerics.IMinMaxValue`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_38 EQU 38
    CLASS_SIZE_38 EQU 0
; Class: System.Math
    CLASS_39 EQU 39
    CLASS_SIZE_39 EQU 0
; Class: System.Object
    CLASS_40 EQU 40
    CLASS_SIZE_40 EQU 0
; Class: System.Double
    CLASS_41 EQU 41
    CLASS_SIZE_41 EQU 8
; Class: System.IComparable`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_42 EQU 42
    CLASS_SIZE_42 EQU 0
; Class: System.IEquatable`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_43 EQU 43
    CLASS_SIZE_43 EQU 0
; Class: System.Numerics.IBinaryFloatingPointIeee754`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_44 EQU 44
    CLASS_SIZE_44 EQU 0
; Class: System.Numerics.IBinaryNumber`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_45 EQU 45
    CLASS_SIZE_45 EQU 0
; Class: System.Numerics.IBitwiseOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_46 EQU 46
    CLASS_SIZE_46 EQU 0
; Class: System.Numerics.INumber`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_47 EQU 47
    CLASS_SIZE_47 EQU 0
; Class: System.Numerics.IComparisonOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_48 EQU 48
    CLASS_SIZE_48 EQU 0
; Class: System.Numerics.IEqualityOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_49 EQU 49
    CLASS_SIZE_49 EQU 0
; Class: System.Numerics.IModulusOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_50 EQU 50
    CLASS_SIZE_50 EQU 0
; Class: System.Numerics.INumberBase`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_51 EQU 51
    CLASS_SIZE_51 EQU 0
; Class: System.Numerics.IAdditionOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_52 EQU 52
    CLASS_SIZE_52 EQU 0
; Class: System.Numerics.IAdditiveIdentity`2[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_53 EQU 53
    CLASS_SIZE_53 EQU 0
; Class: System.Numerics.IDecrementOperators`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_54 EQU 54
    CLASS_SIZE_54 EQU 0
; Class: System.Numerics.IDivisionOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_55 EQU 55
    CLASS_SIZE_55 EQU 0
; Class: System.Numerics.IIncrementOperators`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_56 EQU 56
    CLASS_SIZE_56 EQU 0
; Class: System.Numerics.IMultiplicativeIdentity`2[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_57 EQU 57
    CLASS_SIZE_57 EQU 0
; Class: System.Numerics.IMultiplyOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_58 EQU 58
    CLASS_SIZE_58 EQU 0
; Class: System.ISpanParsable`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_59 EQU 59
    CLASS_SIZE_59 EQU 0
; Class: System.IParsable`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_60 EQU 60
    CLASS_SIZE_60 EQU 0
; Class: System.Numerics.ISubtractionOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_61 EQU 61
    CLASS_SIZE_61 EQU 0
; Class: System.Numerics.IUnaryPlusOperators`2[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_62 EQU 62
    CLASS_SIZE_62 EQU 0
; Class: System.Numerics.IUnaryNegationOperators`2[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_63 EQU 63
    CLASS_SIZE_63 EQU 0
; Class: System.IUtf8SpanParsable`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_64 EQU 64
    CLASS_SIZE_64 EQU 0
; Class: System.Numerics.IFloatingPointIeee754`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_65 EQU 65
    CLASS_SIZE_65 EQU 0
; Class: System.Numerics.IExponentialFunctions`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_66 EQU 66
    CLASS_SIZE_66 EQU 0
; Class: System.Numerics.IFloatingPointConstants`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_67 EQU 67
    CLASS_SIZE_67 EQU 0
; Class: System.Numerics.IFloatingPoint`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_68 EQU 68
    CLASS_SIZE_68 EQU 0
; Class: System.Numerics.ISignedNumber`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_69 EQU 69
    CLASS_SIZE_69 EQU 0
; Class: System.Numerics.IHyperbolicFunctions`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_70 EQU 70
    CLASS_SIZE_70 EQU 0
; Class: System.Numerics.ILogarithmicFunctions`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_71 EQU 71
    CLASS_SIZE_71 EQU 0
; Class: System.Numerics.IPowerFunctions`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_72 EQU 72
    CLASS_SIZE_72 EQU 0
; Class: System.Numerics.IRootFunctions`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_73 EQU 73
    CLASS_SIZE_73 EQU 0
; Class: System.Numerics.ITrigonometricFunctions`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_74 EQU 74
    CLASS_SIZE_74 EQU 0
; Class: System.Numerics.IMinMaxValue`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_75 EQU 75
    CLASS_SIZE_75 EQU 0
; Class: System.IBinaryFloatParseAndFormatInfo`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_76 EQU 76
    CLASS_SIZE_76 EQU 0
; Class: System.Single
    CLASS_77 EQU 77
    CLASS_SIZE_77 EQU 4
; Class: System.IComparable`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_78 EQU 78
    CLASS_SIZE_78 EQU 0
; Class: System.IEquatable`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_79 EQU 79
    CLASS_SIZE_79 EQU 0
; Class: System.Numerics.IBinaryFloatingPointIeee754`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_80 EQU 80
    CLASS_SIZE_80 EQU 0
; Class: System.Numerics.IBinaryNumber`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_81 EQU 81
    CLASS_SIZE_81 EQU 0
; Class: System.Numerics.IBitwiseOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_82 EQU 82
    CLASS_SIZE_82 EQU 0
; Class: System.Numerics.INumber`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_83 EQU 83
    CLASS_SIZE_83 EQU 0
; Class: System.Numerics.IComparisonOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_84 EQU 84
    CLASS_SIZE_84 EQU 0
; Class: System.Numerics.IEqualityOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_85 EQU 85
    CLASS_SIZE_85 EQU 0
; Class: System.Numerics.IModulusOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_86 EQU 86
    CLASS_SIZE_86 EQU 0
; Class: System.Numerics.INumberBase`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_87 EQU 87
    CLASS_SIZE_87 EQU 0
; Class: System.Numerics.IAdditionOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_88 EQU 88
    CLASS_SIZE_88 EQU 0
; Class: System.Numerics.IAdditiveIdentity`2[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_89 EQU 89
    CLASS_SIZE_89 EQU 0
; Class: System.Numerics.IDecrementOperators`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_90 EQU 90
    CLASS_SIZE_90 EQU 0
; Class: System.Numerics.IDivisionOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_91 EQU 91
    CLASS_SIZE_91 EQU 0
; Class: System.Numerics.IIncrementOperators`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_92 EQU 92
    CLASS_SIZE_92 EQU 0
; Class: System.Numerics.IMultiplicativeIdentity`2[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_93 EQU 93
    CLASS_SIZE_93 EQU 0
; Class: System.Numerics.IMultiplyOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_94 EQU 94
    CLASS_SIZE_94 EQU 0
; Class: System.ISpanParsable`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_95 EQU 95
    CLASS_SIZE_95 EQU 0
; Class: System.IParsable`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_96 EQU 96
    CLASS_SIZE_96 EQU 0
; Class: System.Numerics.ISubtractionOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_97 EQU 97
    CLASS_SIZE_97 EQU 0
; Class: System.Numerics.IUnaryPlusOperators`2[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_98 EQU 98
    CLASS_SIZE_98 EQU 0
; Class: System.Numerics.IUnaryNegationOperators`2[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_99 EQU 99
    CLASS_SIZE_99 EQU 0
; Class: System.IUtf8SpanParsable`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_100 EQU 100
    CLASS_SIZE_100 EQU 0
; Class: System.Numerics.IFloatingPointIeee754`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_101 EQU 101
    CLASS_SIZE_101 EQU 0
; Class: System.Numerics.IExponentialFunctions`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_102 EQU 102
    CLASS_SIZE_102 EQU 0
; Class: System.Numerics.IFloatingPointConstants`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_103 EQU 103
    CLASS_SIZE_103 EQU 0
; Class: System.Numerics.IFloatingPoint`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_104 EQU 104
    CLASS_SIZE_104 EQU 0
; Class: System.Numerics.ISignedNumber`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_105 EQU 105
    CLASS_SIZE_105 EQU 0
; Class: System.Numerics.IHyperbolicFunctions`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_106 EQU 106
    CLASS_SIZE_106 EQU 0
; Class: System.Numerics.ILogarithmicFunctions`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_107 EQU 107
    CLASS_SIZE_107 EQU 0
; Class: System.Numerics.IPowerFunctions`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_108 EQU 108
    CLASS_SIZE_108 EQU 0
; Class: System.Numerics.IRootFunctions`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_109 EQU 109
    CLASS_SIZE_109 EQU 0
; Class: System.Numerics.ITrigonometricFunctions`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_110 EQU 110
    CLASS_SIZE_110 EQU 0
; Class: System.Numerics.IMinMaxValue`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_111 EQU 111
    CLASS_SIZE_111 EQU 0
; Class: System.IBinaryFloatParseAndFormatInfo`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_112 EQU 112
    CLASS_SIZE_112 EQU 0
; Class: System.Decimal+DecCalc
    CLASS_113 EQU 113
    CLASS_SIZE_113 EQU 20
; Class: System.BitConverter
    CLASS_114 EQU 114
    CLASS_SIZE_114 EQU 0
; Class: System.ThrowHelper
    CLASS_115 EQU 115
    CLASS_SIZE_115 EQU 0
; Class: System.SR
    CLASS_116 EQU 116
    CLASS_SIZE_116 EQU 0
; Class: System.Runtime.Intrinsics.Vector128
    CLASS_117 EQU 117
    CLASS_SIZE_117 EQU 0
; Class: System.String
    CLASS_118 EQU 118
    CLASS_SIZE_118 EQU 5
; Class: System.Collections.IEnumerable
    CLASS_119 EQU 119
    CLASS_SIZE_119 EQU 0
; Class: System.Collections.Generic.IEnumerable`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_120 EQU 120
    CLASS_SIZE_120 EQU 0
; Class: System.IComparable`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_121 EQU 121
    CLASS_SIZE_121 EQU 0
; Class: System.IEquatable`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_122 EQU 122
    CLASS_SIZE_122 EQU 0
; Class: System.ICloneable
    CLASS_123 EQU 123
    CLASS_SIZE_123 EQU 0
; Class: System.ISpanParsable`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_124 EQU 124
    CLASS_SIZE_124 EQU 0
; Class: System.IParsable`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_125 EQU 125
    CLASS_SIZE_125 EQU 0
; Class: System.Runtime.Intrinsics.X86.Bmi2+X64
    CLASS_126 EQU 126
    CLASS_SIZE_126 EQU -1
; Class: System.Runtime.Intrinsics.X86.X86Base+X64
    CLASS_127 EQU 127
    CLASS_SIZE_127 EQU 0
; Class: System.MemoryExtensions
    CLASS_128 EQU 128
    CLASS_SIZE_128 EQU 0
; Class: System.ArgumentNullException
    CLASS_129 EQU 129
    CLASS_SIZE_129 EQU 3
; Class: System.ArgumentException
    CLASS_130 EQU 130
    CLASS_SIZE_130 EQU 7
; Class: System.SystemException
    CLASS_131 EQU 131
    CLASS_SIZE_131 EQU 3
; Class: System.Exception
    CLASS_132 EQU 132
    CLASS_SIZE_132 EQU 56
; Class: System.Text.ValueStringBuilder
    CLASS_133 EQU 133
    CLASS_SIZE_133 EQU 12
; Class: System.Type
    CLASS_134 EQU 134
    CLASS_SIZE_134 EQU -1
; Class: System.Reflection.MemberInfo
    CLASS_135 EQU 135
    CLASS_SIZE_135 EQU 0
; Class: System.Reflection.ICustomAttributeProvider
    CLASS_136 EQU 136
    CLASS_SIZE_136 EQU 0
; Class: System.Reflection.IReflect
    CLASS_137 EQU 137
    CLASS_SIZE_137 EQU 0
; Class: System.IFormatProvider
    CLASS_138 EQU 138
    CLASS_SIZE_138 EQU 0
; Class: System.Char
    CLASS_139 EQU 139
    CLASS_SIZE_139 EQU 1
; Class: System.IComparable`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_140 EQU 140
    CLASS_SIZE_140 EQU 0
; Class: System.IEquatable`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_141 EQU 141
    CLASS_SIZE_141 EQU 0
; Class: System.Numerics.IBinaryInteger`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_142 EQU 142
    CLASS_SIZE_142 EQU 0
; Class: System.Numerics.IBinaryNumber`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_143 EQU 143
    CLASS_SIZE_143 EQU 0
; Class: System.Numerics.IBitwiseOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_144 EQU 144
    CLASS_SIZE_144 EQU 0
; Class: System.Numerics.INumber`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_145 EQU 145
    CLASS_SIZE_145 EQU 0
; Class: System.Numerics.IComparisonOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_146 EQU 146
    CLASS_SIZE_146 EQU 0
; Class: System.Numerics.IEqualityOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_147 EQU 147
    CLASS_SIZE_147 EQU 0
; Class: System.Numerics.IModulusOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_148 EQU 148
    CLASS_SIZE_148 EQU 0
; Class: System.Numerics.INumberBase`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_149 EQU 149
    CLASS_SIZE_149 EQU 0
; Class: System.Numerics.IAdditionOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_150 EQU 150
    CLASS_SIZE_150 EQU 0
; Class: System.Numerics.IAdditiveIdentity`2[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_151 EQU 151
    CLASS_SIZE_151 EQU 0
; Class: System.Numerics.IDecrementOperators`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_152 EQU 152
    CLASS_SIZE_152 EQU 0
; Class: System.Numerics.IDivisionOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_153 EQU 153
    CLASS_SIZE_153 EQU 0
; Class: System.Numerics.IIncrementOperators`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_154 EQU 154
    CLASS_SIZE_154 EQU 0
; Class: System.Numerics.IMultiplicativeIdentity`2[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_155 EQU 155
    CLASS_SIZE_155 EQU 0
; Class: System.Numerics.IMultiplyOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_156 EQU 156
    CLASS_SIZE_156 EQU 0
; Class: System.ISpanParsable`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_157 EQU 157
    CLASS_SIZE_157 EQU 0
; Class: System.IParsable`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_158 EQU 158
    CLASS_SIZE_158 EQU 0
; Class: System.Numerics.ISubtractionOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_159 EQU 159
    CLASS_SIZE_159 EQU 0
; Class: System.Numerics.IUnaryPlusOperators`2[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_160 EQU 160
    CLASS_SIZE_160 EQU 0
; Class: System.Numerics.IUnaryNegationOperators`2[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_161 EQU 161
    CLASS_SIZE_161 EQU 0
; Class: System.IUtf8SpanParsable`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_162 EQU 162
    CLASS_SIZE_162 EQU 0
; Class: System.Numerics.IShiftOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Int32, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_163 EQU 163
    CLASS_SIZE_163 EQU 0
; Class: System.Numerics.IMinMaxValue`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_164 EQU 164
    CLASS_SIZE_164 EQU 0
; Class: System.Numerics.IUnsignedNumber`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_165 EQU 165
    CLASS_SIZE_165 EQU 0
; Class: System.IUtfChar`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_166 EQU 166
    CLASS_SIZE_166 EQU 0
; Class: System.IBinaryIntegerParseAndFormatInfo`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_167 EQU 167
    CLASS_SIZE_167 EQU 0
; Class: System.ICustomFormatter
    CLASS_168 EQU 168
    CLASS_SIZE_168 EQU 0
; Class: System.Runtime.CompilerServices.RuntimeHelpers
    CLASS_169 EQU 169
    CLASS_SIZE_169 EQU 0
; Class: System.RuntimeTypeHandle
    CLASS_170 EQU 170
    CLASS_SIZE_170 EQU 4
; Class: System.IEquatable`1[[System.RuntimeTypeHandle, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    CLASS_171 EQU 171
    CLASS_SIZE_171 EQU 0
; Class: System.GC
    CLASS_172 EQU 172
    CLASS_SIZE_172 EQU 0

    ; --- Class Table ---
CLASS_TABLE:
    DC.L JumpCS.TestMath.Program_vtable     ; Class JumpCS.TestMath.Program
    DC.L 0             ; Instance size
    DC.L JumpCS.TestMath.Tests.DecimalMathTests_vtable     ; Class JumpCS.TestMath.Tests.DecimalMathTests
    DC.L 0             ; Instance size
    DC.L JumpCS.TestMath.Tests.DoubleMathTests_vtable     ; Class JumpCS.TestMath.Tests.DoubleMathTests
    DC.L 0             ; Instance size
    DC.L JumpCS.TestMath.Tests.FloatMathTests_vtable     ; Class JumpCS.TestMath.Tests.FloatMathTests
    DC.L 0             ; Instance size
    DC.L JumpCS.TestMath.Tests.IntegerMathTests_vtable     ; Class JumpCS.TestMath.Tests.IntegerMathTests
    DC.L 0             ; Instance size
    DC.L JumpCS.TestMath.Tests.TypeConversionTests_vtable     ; Class JumpCS.TestMath.Tests.TypeConversionTests
    DC.L 0             ; Instance size
    DC.L System.Decimal_vtable     ; Class System.Decimal
    DC.L 11             ; Instance size
    DC.L System.ValueType_vtable     ; Class System.ValueType
    DC.L 0             ; Instance size
    DC.L System.ISpanFormattable_vtable     ; Class System.ISpanFormattable
    DC.L 0             ; Instance size
    DC.L System.IFormattable_vtable     ; Class System.IFormattable
    DC.L 0             ; Instance size
    DC.L System.IComparable_vtable     ; Class System.IComparable
    DC.L 0             ; Instance size
    DC.L System.IConvertible_vtable     ; Class System.IConvertible
    DC.L 0             ; Instance size
    DC.L System.IComparable`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IComparable`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IEquatable`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IEquatable`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Runtime.Serialization.ISerializable_vtable     ; Class System.Runtime.Serialization.ISerializable
    DC.L 0             ; Instance size
    DC.L System.Runtime.Serialization.IDeserializationCallback_vtable     ; Class System.Runtime.Serialization.IDeserializationCallback
    DC.L 0             ; Instance size
    DC.L System.Numerics.IFloatingPoint`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IFloatingPoint`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IFloatingPointConstants`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IFloatingPointConstants`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.INumberBase`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.INumberBase`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IAdditionOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IAdditionOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IAdditiveIdentity`2[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IAdditiveIdentity`2[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IDecrementOperators`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IDecrementOperators`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IDivisionOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IDivisionOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IEqualityOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IEqualityOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IIncrementOperators`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IIncrementOperators`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IMultiplicativeIdentity`2[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IMultiplicativeIdentity`2[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IMultiplyOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IMultiplyOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.ISpanParsable`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.ISpanParsable`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IParsable`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IParsable`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.ISubtractionOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.ISubtractionOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IUnaryPlusOperators`2[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IUnaryPlusOperators`2[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IUnaryNegationOperators`2[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IUnaryNegationOperators`2[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IUtf8SpanFormattable_vtable     ; Class System.IUtf8SpanFormattable
    DC.L 0             ; Instance size
    DC.L System.IUtf8SpanParsable`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IUtf8SpanParsable`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.INumber`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.INumber`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IComparisonOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IComparisonOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IModulusOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IModulusOperators`3[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.ISignedNumber`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.ISignedNumber`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IMinMaxValue`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IMinMaxValue`1[[System.Decimal, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Math_vtable     ; Class System.Math
    DC.L 0             ; Instance size
    DC.L System.Object_vtable     ; Class System.Object
    DC.L 0             ; Instance size
    DC.L System.Double_vtable     ; Class System.Double
    DC.L 8             ; Instance size
    DC.L System.IComparable`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IComparable`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IEquatable`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IEquatable`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IBinaryFloatingPointIeee754`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IBinaryFloatingPointIeee754`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IBinaryNumber`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IBinaryNumber`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IBitwiseOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IBitwiseOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.INumber`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.INumber`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IComparisonOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IComparisonOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IEqualityOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IEqualityOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IModulusOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IModulusOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.INumberBase`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.INumberBase`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IAdditionOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IAdditionOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IAdditiveIdentity`2[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IAdditiveIdentity`2[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IDecrementOperators`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IDecrementOperators`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IDivisionOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IDivisionOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IIncrementOperators`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IIncrementOperators`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IMultiplicativeIdentity`2[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IMultiplicativeIdentity`2[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IMultiplyOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IMultiplyOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.ISpanParsable`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.ISpanParsable`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IParsable`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IParsable`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.ISubtractionOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.ISubtractionOperators`3[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IUnaryPlusOperators`2[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IUnaryPlusOperators`2[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IUnaryNegationOperators`2[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IUnaryNegationOperators`2[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IUtf8SpanParsable`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IUtf8SpanParsable`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IFloatingPointIeee754`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IFloatingPointIeee754`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IExponentialFunctions`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IExponentialFunctions`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IFloatingPointConstants`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IFloatingPointConstants`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IFloatingPoint`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IFloatingPoint`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.ISignedNumber`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.ISignedNumber`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IHyperbolicFunctions`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IHyperbolicFunctions`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.ILogarithmicFunctions`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.ILogarithmicFunctions`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IPowerFunctions`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IPowerFunctions`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IRootFunctions`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IRootFunctions`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.ITrigonometricFunctions`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.ITrigonometricFunctions`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IMinMaxValue`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IMinMaxValue`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IBinaryFloatParseAndFormatInfo`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IBinaryFloatParseAndFormatInfo`1[[System.Double, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Single_vtable     ; Class System.Single
    DC.L 4             ; Instance size
    DC.L System.IComparable`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IComparable`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IEquatable`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IEquatable`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IBinaryFloatingPointIeee754`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IBinaryFloatingPointIeee754`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IBinaryNumber`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IBinaryNumber`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IBitwiseOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IBitwiseOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.INumber`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.INumber`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IComparisonOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IComparisonOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IEqualityOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IEqualityOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IModulusOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IModulusOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.INumberBase`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.INumberBase`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IAdditionOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IAdditionOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IAdditiveIdentity`2[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IAdditiveIdentity`2[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IDecrementOperators`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IDecrementOperators`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IDivisionOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IDivisionOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IIncrementOperators`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IIncrementOperators`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IMultiplicativeIdentity`2[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IMultiplicativeIdentity`2[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IMultiplyOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IMultiplyOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.ISpanParsable`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.ISpanParsable`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IParsable`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IParsable`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.ISubtractionOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.ISubtractionOperators`3[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IUnaryPlusOperators`2[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IUnaryPlusOperators`2[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IUnaryNegationOperators`2[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IUnaryNegationOperators`2[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IUtf8SpanParsable`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IUtf8SpanParsable`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IFloatingPointIeee754`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IFloatingPointIeee754`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IExponentialFunctions`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IExponentialFunctions`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IFloatingPointConstants`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IFloatingPointConstants`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IFloatingPoint`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IFloatingPoint`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.ISignedNumber`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.ISignedNumber`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IHyperbolicFunctions`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IHyperbolicFunctions`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.ILogarithmicFunctions`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.ILogarithmicFunctions`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IPowerFunctions`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IPowerFunctions`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IRootFunctions`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IRootFunctions`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.ITrigonometricFunctions`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.ITrigonometricFunctions`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IMinMaxValue`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IMinMaxValue`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IBinaryFloatParseAndFormatInfo`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IBinaryFloatParseAndFormatInfo`1[[System.Single, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Decimal+DecCalc_vtable     ; Class System.Decimal+DecCalc
    DC.L 20             ; Instance size
    DC.L System.BitConverter_vtable     ; Class System.BitConverter
    DC.L 0             ; Instance size
    DC.L System.ThrowHelper_vtable     ; Class System.ThrowHelper
    DC.L 0             ; Instance size
    DC.L System.SR_vtable     ; Class System.SR
    DC.L 0             ; Instance size
    DC.L System.Runtime.Intrinsics.Vector128_vtable     ; Class System.Runtime.Intrinsics.Vector128
    DC.L 0             ; Instance size
    DC.L System.String_vtable     ; Class System.String
    DC.L 5             ; Instance size
    DC.L System.Collections.IEnumerable_vtable     ; Class System.Collections.IEnumerable
    DC.L 0             ; Instance size
    DC.L System.Collections.Generic.IEnumerable`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Collections.Generic.IEnumerable`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IComparable`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IComparable`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IEquatable`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IEquatable`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.ICloneable_vtable     ; Class System.ICloneable
    DC.L 0             ; Instance size
    DC.L System.ISpanParsable`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.ISpanParsable`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IParsable`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IParsable`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Runtime.Intrinsics.X86.Bmi2+X64_vtable     ; Class System.Runtime.Intrinsics.X86.Bmi2+X64
    DC.L -1             ; Instance size
    DC.L System.Runtime.Intrinsics.X86.X86Base+X64_vtable     ; Class System.Runtime.Intrinsics.X86.X86Base+X64
    DC.L 0             ; Instance size
    DC.L System.MemoryExtensions_vtable     ; Class System.MemoryExtensions
    DC.L 0             ; Instance size
    DC.L System.ArgumentNullException_vtable     ; Class System.ArgumentNullException
    DC.L 3             ; Instance size
    DC.L System.ArgumentException_vtable     ; Class System.ArgumentException
    DC.L 7             ; Instance size
    DC.L System.SystemException_vtable     ; Class System.SystemException
    DC.L 3             ; Instance size
    DC.L System.Exception_vtable     ; Class System.Exception
    DC.L 56             ; Instance size
    DC.L System.Text.ValueStringBuilder_vtable     ; Class System.Text.ValueStringBuilder
    DC.L 12             ; Instance size
    DC.L System.Type_vtable     ; Class System.Type
    DC.L -1             ; Instance size
    DC.L System.Reflection.MemberInfo_vtable     ; Class System.Reflection.MemberInfo
    DC.L 0             ; Instance size
    DC.L System.Reflection.ICustomAttributeProvider_vtable     ; Class System.Reflection.ICustomAttributeProvider
    DC.L 0             ; Instance size
    DC.L System.Reflection.IReflect_vtable     ; Class System.Reflection.IReflect
    DC.L 0             ; Instance size
    DC.L System.IFormatProvider_vtable     ; Class System.IFormatProvider
    DC.L 0             ; Instance size
    DC.L System.Char_vtable     ; Class System.Char
    DC.L 1             ; Instance size
    DC.L System.IComparable`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IComparable`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IEquatable`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IEquatable`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IBinaryInteger`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IBinaryInteger`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IBinaryNumber`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IBinaryNumber`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IBitwiseOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IBitwiseOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.INumber`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.INumber`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IComparisonOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IComparisonOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IEqualityOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IEqualityOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Boolean, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IModulusOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IModulusOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.INumberBase`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.INumberBase`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IAdditionOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IAdditionOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IAdditiveIdentity`2[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IAdditiveIdentity`2[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IDecrementOperators`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IDecrementOperators`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IDivisionOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IDivisionOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IIncrementOperators`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IIncrementOperators`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IMultiplicativeIdentity`2[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IMultiplicativeIdentity`2[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IMultiplyOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IMultiplyOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.ISpanParsable`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.ISpanParsable`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IParsable`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IParsable`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.ISubtractionOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.ISubtractionOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IUnaryPlusOperators`2[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IUnaryPlusOperators`2[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IUnaryNegationOperators`2[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IUnaryNegationOperators`2[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IUtf8SpanParsable`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IUtf8SpanParsable`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IShiftOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Int32, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IShiftOperators`3[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Int32, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IMinMaxValue`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IMinMaxValue`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.Numerics.IUnsignedNumber`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.Numerics.IUnsignedNumber`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IUtfChar`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IUtfChar`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.IBinaryIntegerParseAndFormatInfo`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IBinaryIntegerParseAndFormatInfo`1[[System.Char, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.ICustomFormatter_vtable     ; Class System.ICustomFormatter
    DC.L 0             ; Instance size
    DC.L System.Runtime.CompilerServices.RuntimeHelpers_vtable     ; Class System.Runtime.CompilerServices.RuntimeHelpers
    DC.L 0             ; Instance size
    DC.L System.RuntimeTypeHandle_vtable     ; Class System.RuntimeTypeHandle
    DC.L 4             ; Instance size
    DC.L System.IEquatable`1[[System.RuntimeTypeHandle, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]_vtable     ; Class System.IEquatable`1[[System.RuntimeTypeHandle, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
    DC.L 0             ; Instance size
    DC.L System.GC_vtable     ; Class System.GC
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

    ; Offset 0006: nop
    ; TODO: nop

    ; Offset 0007: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Addition_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Addition_NegativeNumbers

    ; Offset 000C: nop
    ; TODO: nop

    ; Offset 000D: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Addition_MixedSigns()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Addition_MixedSigns

    ; Offset 0012: nop
    ; TODO: nop

    ; Offset 0013: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Addition_Overflow()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Addition_Overflow

    ; Offset 0018: nop
    ; TODO: nop

    ; Offset 0019: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Subtraction_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Subtraction_PositiveNumbers

    ; Offset 001E: nop
    ; TODO: nop

    ; Offset 001F: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Subtraction_NegativeResult()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Subtraction_NegativeResult

    ; Offset 0024: nop
    ; TODO: nop

    ; Offset 0025: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Subtraction_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Subtraction_NegativeNumbers

    ; Offset 002A: nop
    ; TODO: nop

    ; Offset 002B: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Multiplication_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_PositiveNumbers

    ; Offset 0030: nop
    ; TODO: nop

    ; Offset 0031: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Multiplication_ByZero()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_ByZero

    ; Offset 0036: nop
    ; TODO: nop

    ; Offset 0037: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Multiplication_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_NegativeNumbers

    ; Offset 003C: nop
    ; TODO: nop

    ; Offset 003D: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Multiplication_MixedSigns()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Multiplication_MixedSigns

    ; Offset 0042: nop
    ; TODO: nop

    ; Offset 0043: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Division_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Division_PositiveNumbers

    ; Offset 0048: nop
    ; TODO: nop

    ; Offset 0049: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Division_WithRemainder()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Division_WithRemainder

    ; Offset 004E: nop
    ; TODO: nop

    ; Offset 004F: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Division_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Division_NegativeNumbers

    ; Offset 0054: nop
    ; TODO: nop

    ; Offset 0055: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Division_MixedSigns()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Division_MixedSigns

    ; Offset 005A: nop
    ; TODO: nop

    ; Offset 005B: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Remainder_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Remainder_PositiveNumbers

    ; Offset 0060: nop
    ; TODO: nop

    ; Offset 0061: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.Remainder_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_Remainder_NegativeNumbers

    ; Offset 0066: nop
    ; TODO: nop

    ; Offset 0067: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.BitwiseAnd()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_BitwiseAnd

    ; Offset 006C: nop
    ; TODO: nop

    ; Offset 006D: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.BitwiseOr()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_BitwiseOr

    ; Offset 0072: nop
    ; TODO: nop

    ; Offset 0073: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.BitwiseXor()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_BitwiseXor

    ; Offset 0078: nop
    ; TODO: nop

    ; Offset 0079: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.LeftShift()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_LeftShift

    ; Offset 007E: nop
    ; TODO: nop

    ; Offset 007F: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.RightShift()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_RightShift

    ; Offset 0084: nop
    ; TODO: nop

    ; Offset 0085: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.UnaryMinus()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_UnaryMinus

    ; Offset 008A: nop
    ; TODO: nop

    ; Offset 008B: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.ChainedOperations()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_ChainedOperations

    ; Offset 0090: nop
    ; TODO: nop

    ; Offset 0091: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.DivideByZeroThrows()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_DivideByZeroThrows

    ; Offset 0096: nop
    ; TODO: nop

    ; Offset 0097: call
    ; Call JumpCS.TestMath.Tests.IntegerMathTests.ModuloByZeroThrows()V
    JSR JumpCS.TestMath.Tests.IntegerMathTests_ModuloByZeroThrows

    ; Offset 009C: nop
    ; TODO: nop

    ; Offset 009D: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Addition_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Addition_PositiveNumbers

    ; Offset 00A2: nop
    ; TODO: nop

    ; Offset 00A3: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Addition_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Addition_NegativeNumbers

    ; Offset 00A8: nop
    ; TODO: nop

    ; Offset 00A9: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Addition_MixedSigns()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Addition_MixedSigns

    ; Offset 00AE: nop
    ; TODO: nop

    ; Offset 00AF: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Subtraction_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Subtraction_PositiveNumbers

    ; Offset 00B4: nop
    ; TODO: nop

    ; Offset 00B5: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Subtraction_NegativeResult()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Subtraction_NegativeResult

    ; Offset 00BA: nop
    ; TODO: nop

    ; Offset 00BB: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Multiplication_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Multiplication_PositiveNumbers

    ; Offset 00C0: nop
    ; TODO: nop

    ; Offset 00C1: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Multiplication_ByZero()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Multiplication_ByZero

    ; Offset 00C6: nop
    ; TODO: nop

    ; Offset 00C7: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Multiplication_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Multiplication_NegativeNumbers

    ; Offset 00CC: nop
    ; TODO: nop

    ; Offset 00CD: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Division_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Division_PositiveNumbers

    ; Offset 00D2: nop
    ; TODO: nop

    ; Offset 00D3: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Division_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Division_NegativeNumbers

    ; Offset 00D8: nop
    ; TODO: nop

    ; Offset 00D9: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Division_MixedSigns()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Division_MixedSigns

    ; Offset 00DE: nop
    ; TODO: nop

    ; Offset 00DF: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Division_ByZeroPositive()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Division_ByZeroPositive

    ; Offset 00E4: nop
    ; TODO: nop

    ; Offset 00E5: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Division_ByZeroNegative()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Division_ByZeroNegative

    ; Offset 00EA: nop
    ; TODO: nop

    ; Offset 00EB: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Remainder_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Remainder_PositiveNumbers

    ; Offset 00F0: nop
    ; TODO: nop

    ; Offset 00F1: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.UnaryMinus()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_UnaryMinus

    ; Offset 00F6: nop
    ; TODO: nop

    ; Offset 00F7: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Comparison_LessThan()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Comparison_LessThan

    ; Offset 00FC: nop
    ; TODO: nop

    ; Offset 00FD: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Comparison_GreaterThan()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Comparison_GreaterThan

    ; Offset 0102: nop
    ; TODO: nop

    ; Offset 0103: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Comparison_Equal()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Comparison_Equal

    ; Offset 0108: nop
    ; TODO: nop

    ; Offset 0109: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.SpecialValue_NaN()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_SpecialValue_NaN

    ; Offset 010E: nop
    ; TODO: nop

    ; Offset 010F: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.SpecialValue_Infinity()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_SpecialValue_Infinity

    ; Offset 0114: nop
    ; TODO: nop

    ; Offset 0115: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Sqrt()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Sqrt

    ; Offset 011A: nop
    ; TODO: nop

    ; Offset 011B: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.Abs()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_Abs

    ; Offset 0120: nop
    ; TODO: nop

    ; Offset 0121: call
    ; Call JumpCS.TestMath.Tests.FloatMathTests.ChainedOperations()V
    JSR JumpCS.TestMath.Tests.FloatMathTests_ChainedOperations

    ; Offset 0126: nop
    ; TODO: nop

    ; Offset 0127: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Addition_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Addition_PositiveNumbers

    ; Offset 012C: nop
    ; TODO: nop

    ; Offset 012D: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Addition_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Addition_NegativeNumbers

    ; Offset 0132: nop
    ; TODO: nop

    ; Offset 0133: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Addition_MixedSigns()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Addition_MixedSigns

    ; Offset 0138: nop
    ; TODO: nop

    ; Offset 0139: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Subtraction_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Subtraction_PositiveNumbers

    ; Offset 013E: nop
    ; TODO: nop

    ; Offset 013F: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Subtraction_NegativeResult()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Subtraction_NegativeResult

    ; Offset 0144: nop
    ; TODO: nop

    ; Offset 0145: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Multiplication_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Multiplication_PositiveNumbers

    ; Offset 014A: nop
    ; TODO: nop

    ; Offset 014B: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Multiplication_ByZero()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Multiplication_ByZero

    ; Offset 0150: nop
    ; TODO: nop

    ; Offset 0151: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Multiplication_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Multiplication_NegativeNumbers

    ; Offset 0156: nop
    ; TODO: nop

    ; Offset 0157: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Division_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Division_PositiveNumbers

    ; Offset 015C: nop
    ; TODO: nop

    ; Offset 015D: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Division_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Division_NegativeNumbers

    ; Offset 0162: nop
    ; TODO: nop

    ; Offset 0163: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Division_MixedSigns()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Division_MixedSigns

    ; Offset 0168: nop
    ; TODO: nop

    ; Offset 0169: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Division_ByZeroPositive()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Division_ByZeroPositive

    ; Offset 016E: nop
    ; TODO: nop

    ; Offset 016F: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Division_ByZeroNegative()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Division_ByZeroNegative

    ; Offset 0174: nop
    ; TODO: nop

    ; Offset 0175: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Remainder_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Remainder_PositiveNumbers

    ; Offset 017A: nop
    ; TODO: nop

    ; Offset 017B: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.UnaryMinus()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_UnaryMinus

    ; Offset 0180: nop
    ; TODO: nop

    ; Offset 0181: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Comparison_LessThan()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Comparison_LessThan

    ; Offset 0186: nop
    ; TODO: nop

    ; Offset 0187: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Comparison_GreaterThan()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Comparison_GreaterThan

    ; Offset 018C: nop
    ; TODO: nop

    ; Offset 018D: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Comparison_Equal()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Comparison_Equal

    ; Offset 0192: nop
    ; TODO: nop

    ; Offset 0193: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.SpecialValue_NaN()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_SpecialValue_NaN

    ; Offset 0198: nop
    ; TODO: nop

    ; Offset 0199: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.SpecialValue_Infinity()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_SpecialValue_Infinity

    ; Offset 019E: nop
    ; TODO: nop

    ; Offset 019F: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Sqrt()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Sqrt

    ; Offset 01A4: nop
    ; TODO: nop

    ; Offset 01A5: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Abs()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Abs

    ; Offset 01AA: nop
    ; TODO: nop

    ; Offset 01AB: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Pow()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Pow

    ; Offset 01B0: nop
    ; TODO: nop

    ; Offset 01B1: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Log()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Log

    ; Offset 01B6: nop
    ; TODO: nop

    ; Offset 01B7: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Trigonometric_Sin()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Trigonometric_Sin

    ; Offset 01BC: nop
    ; TODO: nop

    ; Offset 01BD: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.Trigonometric_Cos()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_Trigonometric_Cos

    ; Offset 01C2: nop
    ; TODO: nop

    ; Offset 01C3: call
    ; Call JumpCS.TestMath.Tests.DoubleMathTests.ChainedOperations()V
    JSR JumpCS.TestMath.Tests.DoubleMathTests_ChainedOperations

    ; Offset 01C8: nop
    ; TODO: nop

    ; Offset 01C9: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Addition_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Addition_PositiveNumbers

    ; Offset 01CE: nop
    ; TODO: nop

    ; Offset 01CF: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Addition_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Addition_NegativeNumbers

    ; Offset 01D4: nop
    ; TODO: nop

    ; Offset 01D5: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Addition_MixedSigns()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Addition_MixedSigns

    ; Offset 01DA: nop
    ; TODO: nop

    ; Offset 01DB: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Subtraction_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Subtraction_PositiveNumbers

    ; Offset 01E0: nop
    ; TODO: nop

    ; Offset 01E1: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Subtraction_NegativeResult()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Subtraction_NegativeResult

    ; Offset 01E6: nop
    ; TODO: nop

    ; Offset 01E7: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Multiplication_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Multiplication_PositiveNumbers

    ; Offset 01EC: nop
    ; TODO: nop

    ; Offset 01ED: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Multiplication_ByZero()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Multiplication_ByZero

    ; Offset 01F2: nop
    ; TODO: nop

    ; Offset 01F3: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Multiplication_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Multiplication_NegativeNumbers

    ; Offset 01F8: nop
    ; TODO: nop

    ; Offset 01F9: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Division_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Division_PositiveNumbers

    ; Offset 01FE: nop
    ; TODO: nop

    ; Offset 01FF: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Division_WithPrecision()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Division_WithPrecision

    ; Offset 0204: nop
    ; TODO: nop

    ; Offset 0205: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Division_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Division_NegativeNumbers

    ; Offset 020A: nop
    ; TODO: nop

    ; Offset 020B: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Division_MixedSigns()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Division_MixedSigns

    ; Offset 0210: nop
    ; TODO: nop

    ; Offset 0211: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Remainder_PositiveNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Remainder_PositiveNumbers

    ; Offset 0216: nop
    ; TODO: nop

    ; Offset 0217: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Remainder_NegativeNumbers()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Remainder_NegativeNumbers

    ; Offset 021C: nop
    ; TODO: nop

    ; Offset 021D: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.UnaryMinus()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_UnaryMinus

    ; Offset 0222: nop
    ; TODO: nop

    ; Offset 0223: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.UnaryPlus()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_UnaryPlus

    ; Offset 0228: nop
    ; TODO: nop

    ; Offset 0229: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Comparison_LessThan()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Comparison_LessThan

    ; Offset 022E: nop
    ; TODO: nop

    ; Offset 022F: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Comparison_GreaterThan()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Comparison_GreaterThan

    ; Offset 0234: nop
    ; TODO: nop

    ; Offset 0235: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Comparison_Equal()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Comparison_Equal

    ; Offset 023A: nop
    ; TODO: nop

    ; Offset 023B: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Comparison_NotEqual()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Comparison_NotEqual

    ; Offset 0240: nop
    ; TODO: nop

    ; Offset 0241: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Abs()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Abs

    ; Offset 0246: nop
    ; TODO: nop

    ; Offset 0247: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Round_ToNearestEven()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Round_ToNearestEven

    ; Offset 024C: nop
    ; TODO: nop

    ; Offset 024D: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Round_AwayFromZero()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Round_AwayFromZero

    ; Offset 0252: nop
    ; TODO: nop

    ; Offset 0253: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Truncate()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Truncate

    ; Offset 0258: nop
    ; TODO: nop

    ; Offset 0259: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Floor()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Floor

    ; Offset 025E: nop
    ; TODO: nop

    ; Offset 025F: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.Ceiling()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_Ceiling

    ; Offset 0264: nop
    ; TODO: nop

    ; Offset 0265: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.DivideByZeroThrows()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_DivideByZeroThrows

    ; Offset 026A: nop
    ; TODO: nop

    ; Offset 026B: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.ChainedOperations()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_ChainedOperations

    ; Offset 0270: nop
    ; TODO: nop

    ; Offset 0271: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.FinancialCalculation_CompoundInterest()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_FinancialCalculation_CompoundInterest

    ; Offset 0276: nop
    ; TODO: nop

    ; Offset 0277: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.FinancialCalculation_PercentageIncrease()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_FinancialCalculation_PercentageIncrease

    ; Offset 027C: nop
    ; TODO: nop

    ; Offset 027D: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.ConversionFromFloat()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_ConversionFromFloat

    ; Offset 0282: nop
    ; TODO: nop

    ; Offset 0283: call
    ; Call JumpCS.TestMath.Tests.DecimalMathTests.ConversionToFloat()V
    JSR JumpCS.TestMath.Tests.DecimalMathTests_ConversionToFloat

    ; Offset 0288: nop
    ; TODO: nop

    ; Offset 0289: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.IntToFloat()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_IntToFloat

    ; Offset 028E: nop
    ; TODO: nop

    ; Offset 028F: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.IntToDouble()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_IntToDouble

    ; Offset 0294: nop
    ; TODO: nop

    ; Offset 0295: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.IntToDecimal()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_IntToDecimal

    ; Offset 029A: nop
    ; TODO: nop

    ; Offset 029B: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.FloatToInt()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_FloatToInt

    ; Offset 02A0: nop
    ; TODO: nop

    ; Offset 02A1: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.FloatToDouble()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_FloatToDouble

    ; Offset 02A6: nop
    ; TODO: nop

    ; Offset 02A7: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.FloatToDecimal()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_FloatToDecimal

    ; Offset 02AC: nop
    ; TODO: nop

    ; Offset 02AD: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.DoubleToInt()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_DoubleToInt

    ; Offset 02B2: nop
    ; TODO: nop

    ; Offset 02B3: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.DoubleToFloat()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_DoubleToFloat

    ; Offset 02B8: nop
    ; TODO: nop

    ; Offset 02B9: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.DoubleToDecimal()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_DoubleToDecimal

    ; Offset 02BE: nop
    ; TODO: nop

    ; Offset 02BF: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.DecimalToInt()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_DecimalToInt

    ; Offset 02C4: nop
    ; TODO: nop

    ; Offset 02C5: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.DecimalToFloat()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_DecimalToFloat

    ; Offset 02CA: nop
    ; TODO: nop

    ; Offset 02CB: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.DecimalToDouble()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_DecimalToDouble

    ; Offset 02D0: nop
    ; TODO: nop

    ; Offset 02D1: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.ByteToInt()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_ByteToInt

    ; Offset 02D6: nop
    ; TODO: nop

    ; Offset 02D7: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.IntToByte_WithOverflow()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_IntToByte_WithOverflow

    ; Offset 02DC: nop
    ; TODO: nop

    ; Offset 02DD: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.ShortToInt()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_ShortToInt

    ; Offset 02E2: nop
    ; TODO: nop

    ; Offset 02E3: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.LongToInt()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_LongToInt

    ; Offset 02E8: nop
    ; TODO: nop

    ; Offset 02E9: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.IntToLong()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_IntToLong

    ; Offset 02EE: nop
    ; TODO: nop

    ; Offset 02EF: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.NegativeIntToUnsigned()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_NegativeIntToUnsigned

    ; Offset 02F4: nop
    ; TODO: nop

    ; Offset 02F5: call
    ; Call JumpCS.TestMath.Tests.TypeConversionTests.ChainedConversions()V
    JSR JumpCS.TestMath.Tests.TypeConversionTests_ChainedConversions

    ; Offset 02FA: nop
    ; TODO: nop

    ; Offset 02FB: ret
    CLR.L D0            ; Clear return value (void)


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS


; Methods of JumpCS.TestMath.Tests.DecimalMathTests
JumpCS.TestMath.Tests.DecimalMathTests_Addition_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7 ; Allocate locals

    ; MSIL Code (63 bytes, 6 max stack, 4 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_0
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_0:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),D0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #5830,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_1
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_1:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Addition (inline)
    ; System.Decimal op_Addition inline (simplified)
    LEA -16(A6),D0  ; Allocate result space
    MOVE.L 8(D0),D0   ; Load left low
    MOVE.L 8(D1),D1  ; Load right low
    ADD.L D1,D0               ; Add low parts
    MOVE.L D0,8(D0) ; Store result low
    ; TODO: Complete decimal addition with carry

    ; Offset 0028: stloc.2
    ; TODO: stloc.2

    ; Offset 0029: ldc.i4
    MOVE.L #10080,D1  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),D1  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ D1, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_2
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_2:
    MOVE.L D2,(D1)    ; Store flags at offset 0
    MOVE.L D3,4(D1) ; Store high at offset 4
    MOVE.L D1,8(D1) ; Store low at offset 8
    MOVE.L D2,12(D1) ; Store mid at offset 12
    ; newobj complete - push result address

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D2  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal Equals inline
    MOVE.L #1,D1     ; Assume equal
    MOVE.L (D1),D0    ; Load left flags
    CMP.L (D2),D0    ; Compare flags
    BNE .NotEqual_L_3
    MOVE.L 4(D1),D0   ; Load left high
    CMP.L 4(D2),D0   ; Compare high
    BNE .NotEqual_L_3
    MOVE.L 8(D1),D0   ; Load left low
    CMP.L 8(D2),D0   ; Compare low
    BNE .NotEqual_L_3
    MOVE.L 12(D1),D0  ; Load left mid
    CMP.L 12(D2),D0  ; Compare mid
    BNE .NotEqual_L_3
    BRA .EqualsDone_L_4
.NotEqual_L_3:
    CLR.L D1         ; Not equal = false
.EqualsDone_L_4:

    ; Offset 003D: stloc.3
    ; TODO: stloc.3

    ; Offset 003E: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Addition_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7 ; Allocate locals

    ; MSIL Code (63 bytes, 6 max stack, 4 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_5
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_5:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),D0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #5830,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_6
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_6:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Addition (inline)
    ; System.Decimal op_Addition inline (simplified)
    LEA -16(A6),D0  ; Allocate result space
    MOVE.L 8(D0),D0   ; Load left low
    MOVE.L 8(D1),D1  ; Load right low
    ADD.L D1,D0               ; Add low parts
    MOVE.L D0,8(D0) ; Store result low
    ; TODO: Complete decimal addition with carry

    ; Offset 0028: stloc.2
    ; TODO: stloc.2

    ; Offset 0029: ldc.i4
    MOVE.L #10080,D1  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0030: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),D1  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ D1, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_7
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_7:
    MOVE.L D2,(D1)    ; Store flags at offset 0
    MOVE.L D3,4(D1) ; Store high at offset 4
    MOVE.L D1,8(D1) ; Store low at offset 8
    MOVE.L D2,12(D1) ; Store mid at offset 12
    ; newobj complete - push result address

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D2  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal Equals inline
    MOVE.L #1,D1     ; Assume equal
    MOVE.L (D1),D0    ; Load left flags
    CMP.L (D2),D0    ; Compare flags
    BNE .NotEqual_L_8
    MOVE.L 4(D1),D0   ; Load left high
    CMP.L 4(D2),D0   ; Compare high
    BNE .NotEqual_L_8
    MOVE.L 8(D1),D0   ; Load left low
    CMP.L 8(D2),D0   ; Compare low
    BNE .NotEqual_L_8
    MOVE.L 12(D1),D0  ; Load left mid
    CMP.L 12(D2),D0  ; Compare mid
    BNE .NotEqual_L_8
    BRA .EqualsDone_L_9
.NotEqual_L_8:
    CLR.L D1         ; Not equal = false
.EqualsDone_L_9:

    ; Offset 003D: stloc.3
    ; TODO: stloc.3

    ; Offset 003E: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Addition_MixedSigns:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7 ; Allocate locals

    ; MSIL Code (63 bytes, 6 max stack, 4 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #10050,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_10
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_10:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),D0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #4230,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_11
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_11:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Addition (inline)
    ; System.Decimal op_Addition inline (simplified)
    LEA -16(A6),D0  ; Allocate result space
    MOVE.L 8(D0),D0   ; Load left low
    MOVE.L 8(D1),D1  ; Load right low
    ADD.L D1,D0               ; Add low parts
    MOVE.L D0,8(D0) ; Store result low
    ; TODO: Complete decimal addition with carry

    ; Offset 0028: stloc.2
    ; TODO: stloc.2

    ; Offset 0029: ldc.i4
    MOVE.L #5820,D1  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),D1  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ D1, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_12
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_12:
    MOVE.L D2,(D1)    ; Store flags at offset 0
    MOVE.L D3,4(D1) ; Store high at offset 4
    MOVE.L D1,8(D1) ; Store low at offset 8
    MOVE.L D2,12(D1) ; Store mid at offset 12
    ; newobj complete - push result address

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D2  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal Equals inline
    MOVE.L #1,D1     ; Assume equal
    MOVE.L (D1),D0    ; Load left flags
    CMP.L (D2),D0    ; Compare flags
    BNE .NotEqual_L_13
    MOVE.L 4(D1),D0   ; Load left high
    CMP.L 4(D2),D0   ; Compare high
    BNE .NotEqual_L_13
    MOVE.L 8(D1),D0   ; Load left low
    CMP.L 8(D2),D0   ; Compare low
    BNE .NotEqual_L_13
    MOVE.L 12(D1),D0  ; Load left mid
    CMP.L 12(D2),D0  ; Compare mid
    BNE .NotEqual_L_13
    BRA .EqualsDone_L_14
.NotEqual_L_13:
    CLR.L D1         ; Not equal = false
.EqualsDone_L_14:

    ; Offset 003D: stloc.3
    ; TODO: stloc.3

    ; Offset 003E: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Subtraction_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7 ; Allocate locals

    ; MSIL Code (63 bytes, 6 max stack, 4 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #10070,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_15
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_15:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),D0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #4230,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_16
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_16:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Subtraction (inline)
    ; System.Decimal op_Subtraction inline (simplified)
    LEA -16(A6),D0  ; Allocate result space
    MOVE.L 8(D0),D0   ; Load left low
    MOVE.L 8(D1),D1  ; Load right low
    SUB.L D1,D0               ; Subtract low parts
    MOVE.L D0,8(D0) ; Store result low
    ; TODO: Complete decimal subtraction with borrow

    ; Offset 0028: stloc.2
    ; TODO: stloc.2

    ; Offset 0029: ldc.i4
    MOVE.L #5840,D1  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),D1  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ D1, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_17
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_17:
    MOVE.L D2,(D1)    ; Store flags at offset 0
    MOVE.L D3,4(D1) ; Store high at offset 4
    MOVE.L D1,8(D1) ; Store low at offset 8
    MOVE.L D2,12(D1) ; Store mid at offset 12
    ; newobj complete - push result address

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D2  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal Equals inline
    MOVE.L #1,D1     ; Assume equal
    MOVE.L (D1),D0    ; Load left flags
    CMP.L (D2),D0    ; Compare flags
    BNE .NotEqual_L_18
    MOVE.L 4(D1),D0   ; Load left high
    CMP.L 4(D2),D0   ; Compare high
    BNE .NotEqual_L_18
    MOVE.L 8(D1),D0   ; Load left low
    CMP.L 8(D2),D0   ; Compare low
    BNE .NotEqual_L_18
    MOVE.L 12(D1),D0  ; Load left mid
    CMP.L 12(D2),D0  ; Compare mid
    BNE .NotEqual_L_18
    BRA .EqualsDone_L_19
.NotEqual_L_18:
    CLR.L D1         ; Not equal = false
.EqualsDone_L_19:

    ; Offset 003D: stloc.3
    ; TODO: stloc.3

    ; Offset 003E: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Subtraction_NegativeResult:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7 ; Allocate locals

    ; MSIL Code (63 bytes, 6 max stack, 4 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4230,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_20
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_20:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),D0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #10070,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_21
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_21:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Subtraction (inline)
    ; System.Decimal op_Subtraction inline (simplified)
    LEA -16(A6),D0  ; Allocate result space
    MOVE.L 8(D0),D0   ; Load left low
    MOVE.L 8(D1),D1  ; Load right low
    SUB.L D1,D0               ; Subtract low parts
    MOVE.L D0,8(D0) ; Store result low
    ; TODO: Complete decimal subtraction with borrow

    ; Offset 0028: stloc.2
    ; TODO: stloc.2

    ; Offset 0029: ldc.i4
    MOVE.L #5840,D1  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0030: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),D1  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ D1, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_22
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_22:
    MOVE.L D2,(D1)    ; Store flags at offset 0
    MOVE.L D3,4(D1) ; Store high at offset 4
    MOVE.L D1,8(D1) ; Store low at offset 8
    MOVE.L D2,12(D1) ; Store mid at offset 12
    ; newobj complete - push result address

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D2  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal Equals inline
    MOVE.L #1,D1     ; Assume equal
    MOVE.L (D1),D0    ; Load left flags
    CMP.L (D2),D0    ; Compare flags
    BNE .NotEqual_L_23
    MOVE.L 4(D1),D0   ; Load left high
    CMP.L 4(D2),D0   ; Compare high
    BNE .NotEqual_L_23
    MOVE.L 8(D1),D0   ; Load left low
    CMP.L 8(D2),D0   ; Compare low
    BNE .NotEqual_L_23
    MOVE.L 12(D1),D0  ; Load left mid
    CMP.L 12(D2),D0  ; Compare mid
    BNE .NotEqual_L_23
    BRA .EqualsDone_L_24
.NotEqual_L_23:
    CLR.L D1         ; Not equal = false
.EqualsDone_L_24:

    ; Offset 003D: stloc.3
    ; TODO: stloc.3

    ; Offset 003E: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Multiplication_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7 ; Allocate locals

    ; MSIL Code (63 bytes, 6 max stack, 4 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #1250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_25
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_25:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),D0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #720,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_26
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_26:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Multiply (inline)
    ; TODO: D0 * D1

    ; Offset 0028: stloc.2
    ; TODO: stloc.2

    ; Offset 0029: ldc.i4
    MOVE.L #9000,D1  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),D1  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ D1, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_27
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_27:
    MOVE.L D2,(D1)    ; Store flags at offset 0
    MOVE.L D3,4(D1) ; Store high at offset 4
    MOVE.L D1,8(D1) ; Store low at offset 8
    MOVE.L D2,12(D1) ; Store mid at offset 12
    ; newobj complete - push result address

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D2  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal Equals inline
    MOVE.L #1,D1     ; Assume equal
    MOVE.L (D1),D0    ; Load left flags
    CMP.L (D2),D0    ; Compare flags
    BNE .NotEqual_L_28
    MOVE.L 4(D1),D0   ; Load left high
    CMP.L 4(D2),D0   ; Compare high
    BNE .NotEqual_L_28
    MOVE.L 8(D1),D0   ; Load left low
    CMP.L 8(D2),D0   ; Compare low
    BNE .NotEqual_L_28
    MOVE.L 12(D1),D0  ; Load left mid
    CMP.L 12(D2),D0  ; Compare mid
    BNE .NotEqual_L_28
    BRA .EqualsDone_L_29
.NotEqual_L_28:
    CLR.L D1         ; Not equal = false
.EqualsDone_L_29:

    ; Offset 003D: stloc.3
    ; TODO: stloc.3

    ; Offset 003E: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Multiplication_ByZero:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7 ; Allocate locals

    ; MSIL Code (55 bytes, 6 max stack, 4 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_30
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_30:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),D0  ; Load address of local 1

    ; Offset 0013: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0014: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0015: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0016: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0017: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 0018: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_31
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_31:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 001D: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 001E: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 001F: call
    ; System.Decimal.op_Multiply (inline)
    ; TODO: D0 * D1

    ; Offset 0024: stloc.2
    ; TODO: stloc.2

    ; Offset 0025: ldc.i4.0
    CLR.L D1             ; Load 0

    ; Offset 0026: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0027: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0028: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0029: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 002A: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),D1  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ D1, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_32
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_32:
    MOVE.L D2,(D1)    ; Store flags at offset 0
    MOVE.L D3,4(D1) ; Store high at offset 4
    MOVE.L D1,8(D1) ; Store low at offset 8
    MOVE.L D2,12(D1) ; Store mid at offset 12
    ; newobj complete - push result address

    ; Offset 002F: ldloc.2
    MOVE.L -12(A6),D2  ; Load local 2

    ; Offset 0030: call
    ; System.Decimal Equals inline
    MOVE.L #1,D1     ; Assume equal
    MOVE.L (D1),D0    ; Load left flags
    CMP.L (D2),D0    ; Compare flags
    BNE .NotEqual_L_33
    MOVE.L 4(D1),D0   ; Load left high
    CMP.L 4(D2),D0   ; Compare high
    BNE .NotEqual_L_33
    MOVE.L 8(D1),D0   ; Load left low
    CMP.L 8(D2),D0   ; Compare low
    BNE .NotEqual_L_33
    MOVE.L 12(D1),D0  ; Load left mid
    CMP.L 12(D2),D0  ; Compare mid
    BNE .NotEqual_L_33
    BRA .EqualsDone_L_34
.NotEqual_L_33:
    CLR.L D1         ; Not equal = false
.EqualsDone_L_34:

    ; Offset 0035: stloc.3
    ; TODO: stloc.3

    ; Offset 0036: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Multiplication_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7 ; Allocate locals

    ; MSIL Code (63 bytes, 6 max stack, 4 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #1250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_35
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_35:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),D0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #720,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_36
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_36:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Multiply (inline)
    ; TODO: D0 * D1

    ; Offset 0028: stloc.2
    ; TODO: stloc.2

    ; Offset 0029: ldc.i4
    MOVE.L #9000,D1  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),D1  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ D1, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_37
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_37:
    MOVE.L D2,(D1)    ; Store flags at offset 0
    MOVE.L D3,4(D1) ; Store high at offset 4
    MOVE.L D1,8(D1) ; Store low at offset 8
    MOVE.L D2,12(D1) ; Store mid at offset 12
    ; newobj complete - push result address

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D2  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal Equals inline
    MOVE.L #1,D1     ; Assume equal
    MOVE.L (D1),D0    ; Load left flags
    CMP.L (D2),D0    ; Compare flags
    BNE .NotEqual_L_38
    MOVE.L 4(D1),D0   ; Load left high
    CMP.L 4(D2),D0   ; Compare high
    BNE .NotEqual_L_38
    MOVE.L 8(D1),D0   ; Load left low
    CMP.L 8(D2),D0   ; Compare low
    BNE .NotEqual_L_38
    MOVE.L 12(D1),D0  ; Load left mid
    CMP.L 12(D2),D0  ; Compare mid
    BNE .NotEqual_L_38
    BRA .EqualsDone_L_39
.NotEqual_L_38:
    CLR.L D1         ; Not equal = false
.EqualsDone_L_39:

    ; Offset 003D: stloc.3
    ; TODO: stloc.3

    ; Offset 003E: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Division_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7 ; Allocate locals

    ; MSIL Code (63 bytes, 6 max stack, 4 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #8400,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_40
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_40:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),D0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #700,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_41
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_41:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Division (inline)
    ; TODO: D0 / D1

    ; Offset 0028: stloc.2
    ; TODO: stloc.2

    ; Offset 0029: ldc.i4
    MOVE.L #1200,D1  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),D1  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ D1, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_42
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_42:
    MOVE.L D2,(D1)    ; Store flags at offset 0
    MOVE.L D3,4(D1) ; Store high at offset 4
    MOVE.L D1,8(D1) ; Store low at offset 8
    MOVE.L D2,12(D1) ; Store mid at offset 12
    ; newobj complete - push result address

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D2  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal Equals inline
    MOVE.L #1,D1     ; Assume equal
    MOVE.L (D1),D0    ; Load left flags
    CMP.L (D2),D0    ; Compare flags
    BNE .NotEqual_L_43
    MOVE.L 4(D1),D0   ; Load left high
    CMP.L 4(D2),D0   ; Compare high
    BNE .NotEqual_L_43
    MOVE.L 8(D1),D0   ; Load left low
    CMP.L 8(D2),D0   ; Compare low
    BNE .NotEqual_L_43
    MOVE.L 12(D1),D0  ; Load left mid
    CMP.L 12(D2),D0  ; Compare mid
    BNE .NotEqual_L_43
    BRA .EqualsDone_L_44
.NotEqual_L_43:
    CLR.L D1         ; Not equal = false
.EqualsDone_L_44:

    ; Offset 003D: stloc.3
    ; TODO: stloc.3

    ; Offset 003E: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Division_WithPrecision:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7 ; Allocate locals

    ; MSIL Code (72 bytes, 6 max stack, 4 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #8500,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_45
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_45:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),D0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #700,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_46
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_46:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Division (inline)
    ; TODO: D0 / D1

    ; Offset 0028: stloc.2
    ; TODO: stloc.2

    ; Offset 0029: ldc.i4
    MOVE.L #1859874231,D1  ; Load constant

    ; Offset 002E: ldc.i4
    MOVE.L #-1188237158,D2  ; Load constant

    ; Offset 0033: ldc.i4
    MOVE.L #658265604,D3  ; Load constant

    ; Offset 0038: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0039: ldc.i4.s
    MOVE.L #27,D5  ; Load short constant

    ; Offset 003B: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),D1  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ D1, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_47
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_47:
    MOVE.L D2,(D1)    ; Store flags at offset 0
    MOVE.L D3,4(D1) ; Store high at offset 4
    MOVE.L D1,8(D1) ; Store low at offset 8
    MOVE.L D2,12(D1) ; Store mid at offset 12
    ; newobj complete - push result address

    ; Offset 0040: ldloc.2
    MOVE.L -12(A6),D2  ; Load local 2

    ; Offset 0041: call
    ; System.Decimal Equals inline
    MOVE.L #1,D1     ; Assume equal
    MOVE.L (D1),D0    ; Load left flags
    CMP.L (D2),D0    ; Compare flags
    BNE .NotEqual_L_48
    MOVE.L 4(D1),D0   ; Load left high
    CMP.L 4(D2),D0   ; Compare high
    BNE .NotEqual_L_48
    MOVE.L 8(D1),D0   ; Load left low
    CMP.L 8(D2),D0   ; Compare low
    BNE .NotEqual_L_48
    MOVE.L 12(D1),D0  ; Load left mid
    CMP.L 12(D2),D0  ; Compare mid
    BNE .NotEqual_L_48
    BRA .EqualsDone_L_49
.NotEqual_L_48:
    CLR.L D1         ; Not equal = false
.EqualsDone_L_49:

    ; Offset 0046: stloc.3
    ; TODO: stloc.3

    ; Offset 0047: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Division_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7 ; Allocate locals

    ; MSIL Code (63 bytes, 6 max stack, 4 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #8400,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_50
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_50:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),D0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #700,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_51
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_51:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Division (inline)
    ; TODO: D0 / D1

    ; Offset 0028: stloc.2
    ; TODO: stloc.2

    ; Offset 0029: ldc.i4
    MOVE.L #1200,D1  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0030: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),D1  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ D1, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_52
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_52:
    MOVE.L D2,(D1)    ; Store flags at offset 0
    MOVE.L D3,4(D1) ; Store high at offset 4
    MOVE.L D1,8(D1) ; Store low at offset 8
    MOVE.L D2,12(D1) ; Store mid at offset 12
    ; newobj complete - push result address

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D2  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal Equals inline
    MOVE.L #1,D1     ; Assume equal
    MOVE.L (D1),D0    ; Load left flags
    CMP.L (D2),D0    ; Compare flags
    BNE .NotEqual_L_53
    MOVE.L 4(D1),D0   ; Load left high
    CMP.L 4(D2),D0   ; Compare high
    BNE .NotEqual_L_53
    MOVE.L 8(D1),D0   ; Load left low
    CMP.L 8(D2),D0   ; Compare low
    BNE .NotEqual_L_53
    MOVE.L 12(D1),D0  ; Load left mid
    CMP.L 12(D2),D0  ; Compare mid
    BNE .NotEqual_L_53
    BRA .EqualsDone_L_54
.NotEqual_L_53:
    CLR.L D1         ; Not equal = false
.EqualsDone_L_54:

    ; Offset 003D: stloc.3
    ; TODO: stloc.3

    ; Offset 003E: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Division_MixedSigns:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7 ; Allocate locals

    ; MSIL Code (63 bytes, 6 max stack, 4 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #8400,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_55
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_55:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),D0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #700,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_56
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_56:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Division (inline)
    ; TODO: D0 / D1

    ; Offset 0028: stloc.2
    ; TODO: stloc.2

    ; Offset 0029: ldc.i4
    MOVE.L #1200,D1  ; Load constant

    ; Offset 002E: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 002F: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 0030: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 0031: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 0032: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),D1  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ D1, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_57
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_57:
    MOVE.L D2,(D1)    ; Store flags at offset 0
    MOVE.L D3,4(D1) ; Store high at offset 4
    MOVE.L D1,8(D1) ; Store low at offset 8
    MOVE.L D2,12(D1) ; Store mid at offset 12
    ; newobj complete - push result address

    ; Offset 0037: ldloc.2
    MOVE.L -12(A6),D2  ; Load local 2

    ; Offset 0038: call
    ; System.Decimal Equals inline
    MOVE.L #1,D1     ; Assume equal
    MOVE.L (D1),D0    ; Load left flags
    CMP.L (D2),D0    ; Compare flags
    BNE .NotEqual_L_58
    MOVE.L 4(D1),D0   ; Load left high
    CMP.L 4(D2),D0   ; Compare high
    BNE .NotEqual_L_58
    MOVE.L 8(D1),D0   ; Load left low
    CMP.L 8(D2),D0   ; Compare low
    BNE .NotEqual_L_58
    MOVE.L 12(D1),D0  ; Load left mid
    CMP.L 12(D2),D0  ; Compare mid
    BNE .NotEqual_L_58
    BRA .EqualsDone_L_59
.NotEqual_L_58:
    CLR.L D1         ; Not equal = false
.EqualsDone_L_59:

    ; Offset 003D: stloc.3
    ; TODO: stloc.3

    ; Offset 003E: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Remainder_PositiveNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7 ; Allocate locals

    ; MSIL Code (60 bytes, 6 max stack, 4 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #8500,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_60
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_60:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),D0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #700,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_61
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_61:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Modulus (inline)
    ; TODO: D0 % D1

    ; Offset 0028: stloc.2
    ; TODO: stloc.2

    ; Offset 0029: ldc.i4.s
    MOVE.L #100,D1  ; Load short constant

    ; Offset 002B: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 002C: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 002D: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 002E: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 002F: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),D1  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ D1, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_62
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_62:
    MOVE.L D2,(D1)    ; Store flags at offset 0
    MOVE.L D3,4(D1) ; Store high at offset 4
    MOVE.L D1,8(D1) ; Store low at offset 8
    MOVE.L D2,12(D1) ; Store mid at offset 12
    ; newobj complete - push result address

    ; Offset 0034: ldloc.2
    MOVE.L -12(A6),D2  ; Load local 2

    ; Offset 0035: call
    ; System.Decimal Equals inline
    MOVE.L #1,D1     ; Assume equal
    MOVE.L (D1),D0    ; Load left flags
    CMP.L (D2),D0    ; Compare flags
    BNE .NotEqual_L_63
    MOVE.L 4(D1),D0   ; Load left high
    CMP.L 4(D2),D0   ; Compare high
    BNE .NotEqual_L_63
    MOVE.L 8(D1),D0   ; Load left low
    CMP.L 8(D2),D0   ; Compare low
    BNE .NotEqual_L_63
    MOVE.L 12(D1),D0  ; Load left mid
    CMP.L 12(D2),D0  ; Compare mid
    BNE .NotEqual_L_63
    BRA .EqualsDone_L_64
.NotEqual_L_63:
    CLR.L D1         ; Not equal = false
.EqualsDone_L_64:

    ; Offset 003A: stloc.3
    ; TODO: stloc.3

    ; Offset 003B: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Remainder_NegativeNumbers:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #16,A7 ; Allocate locals

    ; MSIL Code (60 bytes, 6 max stack, 4 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #8500,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_65
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_65:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),D0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #700,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_66
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_66:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Modulus (inline)
    ; TODO: D0 % D1

    ; Offset 0028: stloc.2
    ; TODO: stloc.2

    ; Offset 0029: ldc.i4.s
    MOVE.L #100,D1  ; Load short constant

    ; Offset 002B: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 002C: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 002D: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 002E: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 002F: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),D1  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ D1, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_67
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_67:
    MOVE.L D2,(D1)    ; Store flags at offset 0
    MOVE.L D3,4(D1) ; Store high at offset 4
    MOVE.L D1,8(D1) ; Store low at offset 8
    MOVE.L D2,12(D1) ; Store mid at offset 12
    ; newobj complete - push result address

    ; Offset 0034: ldloc.2
    MOVE.L -12(A6),D2  ; Load local 2

    ; Offset 0035: call
    ; System.Decimal Equals inline
    MOVE.L #1,D1     ; Assume equal
    MOVE.L (D1),D0    ; Load left flags
    CMP.L (D2),D0    ; Compare flags
    BNE .NotEqual_L_68
    MOVE.L 4(D1),D0   ; Load left high
    CMP.L 4(D2),D0   ; Compare high
    BNE .NotEqual_L_68
    MOVE.L 8(D1),D0   ; Load left low
    CMP.L 8(D2),D0   ; Compare low
    BNE .NotEqual_L_68
    MOVE.L 12(D1),D0  ; Load left mid
    CMP.L 12(D2),D0  ; Compare mid
    BNE .NotEqual_L_68
    BRA .EqualsDone_L_69
.NotEqual_L_68:
    CLR.L D1         ; Not equal = false
.EqualsDone_L_69:

    ; Offset 003A: stloc.3
    ; TODO: stloc.3

    ; Offset 003B: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_UnaryMinus:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7 ; Allocate locals

    ; MSIL Code (46 bytes, 6 max stack, 3 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_70
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_70:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0012: call
    ; System.Decimal.op_UnaryNegation (inline)
    NEG.L D0     ; Negate

    ; Offset 0017: stloc.1
    ; TODO: stloc.1

    ; Offset 0018: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 001D: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 001E: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001F: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 0020: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 0021: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),D1  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ D1, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_71
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_71:
    MOVE.L D2,(D1)    ; Store flags at offset 0
    MOVE.L D3,4(D1) ; Store high at offset 4
    MOVE.L D1,8(D1) ; Store low at offset 8
    MOVE.L D2,12(D1) ; Store mid at offset 12
    ; newobj complete - push result address

    ; Offset 0026: ldloc.1
    MOVE.L -8(A6),D2   ; Load local 1

    ; Offset 0027: call
    ; System.Decimal Equals inline
    MOVE.L #1,D1     ; Assume equal
    MOVE.L (D1),D0    ; Load left flags
    CMP.L (D2),D0    ; Compare flags
    BNE .NotEqual_L_72
    MOVE.L 4(D1),D0   ; Load left high
    CMP.L 4(D2),D0   ; Compare high
    BNE .NotEqual_L_72
    MOVE.L 8(D1),D0   ; Load left low
    CMP.L 8(D2),D0   ; Compare low
    BNE .NotEqual_L_72
    MOVE.L 12(D1),D0  ; Load left mid
    CMP.L 12(D2),D0  ; Compare mid
    BNE .NotEqual_L_72
    BRA .EqualsDone_L_73
.NotEqual_L_72:
    CLR.L D1         ; Not equal = false
.EqualsDone_L_73:

    ; Offset 002C: stloc.2
    ; TODO: stloc.2

    ; Offset 002D: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_UnaryPlus:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7 ; Allocate locals

    ; MSIL Code (41 bytes, 6 max stack, 3 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_74
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_74:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0012: stloc.1
    ; TODO: stloc.1

    ; Offset 0013: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: newobj
    ; System.Decimal newobj - create new instance (5 parameters)
    LEA -32(A6),D1  ; Allocate new Decimal instance
    ; System.Decimal newobj inline
    ; result @ D1, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_75
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_75:
    MOVE.L D2,(D1)    ; Store flags at offset 0
    MOVE.L D3,4(D1) ; Store high at offset 4
    MOVE.L D1,8(D1) ; Store low at offset 8
    MOVE.L D2,12(D1) ; Store mid at offset 12
    ; newobj complete - push result address

    ; Offset 0021: ldloc.1
    MOVE.L -8(A6),D2   ; Load local 1

    ; Offset 0022: call
    ; System.Decimal Equals inline
    MOVE.L #1,D1     ; Assume equal
    MOVE.L (D1),D0    ; Load left flags
    CMP.L (D2),D0    ; Compare flags
    BNE .NotEqual_L_76
    MOVE.L 4(D1),D0   ; Load left high
    CMP.L 4(D2),D0   ; Compare high
    BNE .NotEqual_L_76
    MOVE.L 8(D1),D0   ; Load left low
    CMP.L 8(D2),D0   ; Compare low
    BNE .NotEqual_L_76
    MOVE.L 12(D1),D0  ; Load left mid
    CMP.L 12(D2),D0  ; Compare mid
    BNE .NotEqual_L_76
    BRA .EqualsDone_L_77
.NotEqual_L_76:
    CLR.L D1         ; Not equal = false
.EqualsDone_L_77:

    ; Offset 0027: stloc.2
    ; TODO: stloc.2

    ; Offset 0028: ret
    MOVE.L D1,D0  ; Move return value to D0


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Comparison_LessThan:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7 ; Allocate locals

    ; MSIL Code (42 bytes, 6 max stack, 3 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_78
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_78:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),D0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #5830,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_79
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_79:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_LessThan (inline)
    ; TODO: D0 < D1

    ; Offset 0028: stloc.2
    ; TODO: stloc.2

    ; Offset 0029: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Comparison_GreaterThan:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7 ; Allocate locals

    ; MSIL Code (42 bytes, 6 max stack, 3 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #5830,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_80
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_80:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),D0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_81
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_81:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_GreaterThan (inline)
    ; TODO: D0 > D1

    ; Offset 0028: stloc.2
    ; TODO: stloc.2

    ; Offset 0029: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Comparison_Equal:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7 ; Allocate locals

    ; MSIL Code (42 bytes, 6 max stack, 3 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_82
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_82:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),D0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_83
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_83:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Equality (inline)
    ; TODO: D0 == D1

    ; Offset 0028: stloc.2
    ; TODO: stloc.2

    ; Offset 0029: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Comparison_NotEqual:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7 ; Allocate locals

    ; MSIL Code (42 bytes, 6 max stack, 3 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_84
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_84:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloca.s
    LEA -8(A6),D0  ; Load address of local 1

    ; Offset 0013: ldc.i4
    MOVE.L #4251,D1  ; Load constant

    ; Offset 0018: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0019: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001A: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 001C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_85
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_85:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0021: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0022: ldloc.1
    MOVE.L -8(A6),D1   ; Load local 1

    ; Offset 0023: call
    ; System.Decimal.op_Inequality (inline)
    ; TODO: D0 != D1

    ; Offset 0028: stloc.2
    ; TODO: stloc.2

    ; Offset 0029: ret


    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

JumpCS.TestMath.Tests.DecimalMathTests_Abs:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save return address
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #12,A7 ; Allocate locals

    ; MSIL Code (46 bytes, 6 max stack, 3 locals)

    ; Offset 0000: nop
    ; TODO: nop

    ; Offset 0001: ldloca.s
    LEA -4(A6),D0  ; Load address of local 0

    ; Offset 0003: ldc.i4
    MOVE.L #4250,D1  ; Load constant

    ; Offset 0008: ldc.i4.0
    CLR.L D2             ; Load 0

    ; Offset 0009: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 000A: ldc.i4.1
    MOVE.L #1,D4         ; Load 1

    ; Offset 000B: ldc.i4.2
    MOVE.L #2,D5         ; Load 2

    ; Offset 000C: call
    ; System.Decimal..ctor (inline)
    ; System.Decimal instance constructor (void) - 5 parameters
    ; System.Decimal constructor inline
    ; this @ D0, lo=D1, mid=D2, hi=D3, sign=D4, scale=D5
    CLR.L D2                  ; Clear flags
    AND.L #0xFF,D5      ; Ensure scale is 0-255
    LSL.L #16,D5        ; Shift scale to bits 16-23
    OR.L D5,D2           ; Set scale in flags
    TST.L D4        ; Check if negative
    BEQ .SkipNegative_L_86
    OR.L #0x80000000,D2      ; Set sign bit if negative
.SkipNegative_L_86:
    MOVE.L D2,(D0)    ; Store flags at offset 0
    MOVE.L D3,4(D0) ; Store high at offset 4
    MOVE.L D1,8(D0) ; Store low at offset 8
    MOVE.L D2,12(D0) ; Store mid at offset 12
    ; Decimal constructor complete (void - nothing pushed)

    ; Offset 0011: ldloc.0
    MOVE.L -4(A6),D0   ; Load local 0

    ; Offset 0012: call
    ; Call System.Math.Abs(LSystem/Decimal;)LSystem/Decimal;
    JSR System.Math_Abs
    ; Return value pushed (non-void method)

    ; Offset 0017: stloc.1
    ; TODO: stloc.1

    ; Offset 0018: ldc.i4
    MOVE.L #4250,D2  ; Load constant

    ; Offset 001D: ldc.i4.0
    CLR.L D3             ; Load 0

    ; Offset 001E: ldc.i4.0
    CLR.L D4             ; Load 0

    ; Offset 001F: ldc.i4.0
    CLR.L D5             ; Load 0

    ; Offset 0020: ldc.i4.2
    MOVE.L #2,D6         ; Load 2
