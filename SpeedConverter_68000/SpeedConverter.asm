; Generated 68000 Assembly Code
; Converted from C# MSIL
; Generated: 2026-04-23 20:25:19

    ; --- Code Section ---
    SECTION CODE

    ; --- Class Definitions ---
; Class: SpeedConverter.Program
    CLASS_0 EQU 0
    CLASS_SIZE_0 EQU 0
; Class: SpeedConverter.Tests.SpeedConversionServiceTests
    CLASS_1 EQU 1
    CLASS_SIZE_1 EQU 4
; Class: System.IDisposable
    CLASS_2 EQU 2
    CLASS_SIZE_2 EQU 0
; Class: SpeedConverter.Code.SpeedConversionService
    CLASS_3 EQU 3
    CLASS_SIZE_3 EQU 0

    ; --- Class Table ---
CLASS_TABLE:
    DC.L SpeedConverter.Program_vtable     ; Class SpeedConverter.Program
    DC.L 0             ; Instance size
    DC.L SpeedConverter.Tests.SpeedConversionServiceTests_vtable     ; Class SpeedConverter.Tests.SpeedConversionServiceTests
    DC.L 4             ; Instance size
    DC.L System.IDisposable_vtable     ; Class System.IDisposable
    DC.L 0             ; Instance size
    DC.L SpeedConverter.Code.SpeedConversionService_vtable     ; Class SpeedConverter.Code.SpeedConversionService
    DC.L 0             ; Instance size

    ; --- Method Implementations ---
; Methods of SpeedConverter.Program
SpeedConverter_Program_RunTest:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #8,A7

    ; Offset 0000: ldarg.0
    MOVE.L 8(A6),D0  ; Load arg.0 (this/first param)
    ; Offset 0001: ldarg.1
    MOVE.L 12(A6),D1  ; Load arg.1 (second param)
    ; Offset 0002: ldarg.2
    MOVE.L 16(A6),D2  ; Load arg.2 (third param)
    ; Offset 0003: callvirt
    ; Virtual call SpeedConverter.Tests.SpeedConversionServiceTests::ConvertToMilesPerHour_Input_Expected
    JSR SpeedConverter.Tests.SpeedConversionServiceTests_ConvertToMilesPerHour_Input_Expected  ; Virtual dispatch
    ; Offset 0008: stloc.0
    MOVE.L D3,-4(A6)   ; Store to local 0
    ; Offset 0009: ldloca.s
    LEA -8(A6),A0  ; Load address of local.1
    MOVE.L A0,D3
    ; Offset 000B: ldc.i4.s
    MOVE.L #17,D4  ; Load short constant
    ; Offset 000D: ldc.i4.3
    MOVE.L #3,D5         ; Load 3
    ; Offset 000E: call
    ; ERROR: Unsupported framework method: System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::.ctor
    ; Not in FrameworkMethodRegistry
    ; Offset 0013: ldloca.s
    LEA -8(A6),A0  ; Load address of local.1
    MOVE.L A0,D6
    ; Offset 0015: ldstr
    LEA STRING_70000001,A0  ; Load string literal
    MOVE.L A0,D7
    ; Offset 001A: call
    ; ERROR: Unsupported framework method: System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendLiteral
    ; Not in FrameworkMethodRegistry
    ; Offset 001F: ldloca.s
    LEA -8(A6),A0  ; Load address of local.1
    MOVE.L A0,D7
    ; Offset 0021: ldarg.1
    MOVE.L 12(A6),D2  ; Load arg.1 (second param)
    ; Offset 0022: call
    ; ERROR: Unsupported framework method: System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendFormatted
    ; Not in FrameworkMethodRegistry
    ; Offset 0027: ldloca.s
    LEA -8(A6),A0  ; Load address of local.1
    MOVE.L A0,D1
    ; Offset 0029: ldstr
    LEA STRING_7000000D,A0  ; Load string literal
    MOVE.L A0,D0
    ; Offset 002E: call
    ; ERROR: Unsupported framework method: System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendLiteral
    ; Not in FrameworkMethodRegistry
    ; Offset 0033: ldloca.s
    LEA -8(A6),A0  ; Load address of local.1
    MOVE.L A0,D2
    ; Offset 0035: ldarg.2
    MOVE.L 16(A6),D0  ; Load arg.2 (third param)
    ; ERROR: Exception processing ldarg.2 at offset 0035
    ; Evaluation stack overflow
    ; Offset 0036: call
    ; ERROR: Unsupported framework method: System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendFormatted
    ; Not in FrameworkMethodRegistry
    ; Offset 003B: ldloca.s
    LEA -8(A6),A0  ; Load address of local.1
    MOVE.L A0,D2
    ; Offset 003D: ldstr
    LEA STRING_70000021,A0  ; Load string literal
    MOVE.L A0,D0
    ; ERROR: Exception processing ldstr at offset 003D
    ; Evaluation stack overflow
    ; Offset 0042: call
    ; ERROR: Unsupported framework method: System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendLiteral
    ; Not in FrameworkMethodRegistry
    ; Offset 0047: ldloca.s
    LEA -8(A6),A0  ; Load address of local.1
    MOVE.L A0,D2
    ; Offset 0049: ldloc.0
    MOVE.L -4(A6),D0  ; Load local.0
    ; ERROR: Exception processing ldloc.0 at offset 0049
    ; Evaluation stack overflow
    ; Offset 004A: call
    ; ERROR: Unsupported framework method: System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendFormatted
    ; Not in FrameworkMethodRegistry
    ; Offset 004F: ldloca.s
    LEA -8(A6),A0  ; Load address of local.1
    MOVE.L A0,D2
    ; Offset 0051: call
    ; ERROR: Unsupported framework method: System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::ToStringAndClear
    ; Not in FrameworkMethodRegistry
    ; Offset 0056: call
    ; Framework call: System.Console::WriteLine
    ; System.Console.WriteLine - 1 parameters
    JSR __console_writeline  ; Console.WriteLine(string)
    ; Offset 005B: ret
    MOVE.L D1,D0  ; Move return value to D0

    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS

SpeedConverter_Program_Main:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #4,A7

    ; Offset 0000: newobj
    ; TODO: newobj SpeedConverter.Tests.SpeedConversionServiceTests::.ctor
    ; Offset 0005: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0
    ; Offset 0006: ldloc.0
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0007: ldc.i4.s
    MOVE.L #10,D1  ; Load short constant
    ; Offset 0009: ldc.i4.6
    MOVE.L #6,D2         ; Load 6
    ; Offset 000A: call
    ; Call SpeedConverter.Program::RunTest
    JSR SpeedConverter.Program_RunTest
    ; Offset 000F: ldloc.0
    MOVE.L -4(A6),D3  ; Load local.0
    ; Offset 0010: ldc.i4.s
    MOVE.L #11,D4  ; Load short constant
    ; Offset 0012: ldc.i4.7
    MOVE.L #7,D5         ; Load 7
    ; Offset 0013: call
    ; Call SpeedConverter.Program::RunTest
    JSR SpeedConverter.Program_RunTest
    ; Offset 0018: ldloc.0
    MOVE.L -4(A6),D6  ; Load local.0
    ; Offset 0019: ldc.i4.s
    MOVE.L #20,D7  ; Load short constant
    ; Offset 001B: ldc.i4.s
    MOVE.L #12,D5  ; Load short constant
    ; Offset 001D: call
    ; Call SpeedConverter.Program::RunTest
    JSR SpeedConverter.Program_RunTest
    ; Offset 0022: leave.s
    BRA L_002E  ; leave - exit exception handler
    ; Offset 0024: ldloc.0
    MOVE.L -4(A6),D0  ; Load local.0
    ; Offset 0025: brfalse.s
    TST.L D0           ; Test value
    BEQ L_002D      ; Branch if false (zero)
    ; Offset 0027: ldloc.0
    MOVE.L -4(A6),D1  ; Load local.0
    ; Offset 0028: callvirt
    ; Virtual framework call: System.IDisposable::Dispose
    ; TODO: Virtual dispatch for System.IDisposable::Dispose
L_002D:
    ; Offset 002D: endfinally
    ; Endfinally - exit exception handler
L_002E:
    ; Offset 002E: ret
    CLR.L D0            ; Clear return value (void)

    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS


; Methods of SpeedConverter.Tests.SpeedConversionServiceTests
SpeedConverter_Tests_SpeedConversionServiceTests_ConvertToMilesPerHour_Input_Expected:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #4,A7

    ; Offset 0000: ldarg.0
    MOVE.L 8(A6),D0  ; Load arg.0 (this/first param)
    ; Offset 0001: ldfld
    MOVE.L (D0),D1  ; Load field at offset 4
    ; Offset 0006: ldarg.1
    MOVE.L 12(A6),D2  ; Load arg.1 (second param)
    ; Offset 0007: callvirt
    ; Virtual call SpeedConverter.Code.SpeedConversionService::ConvertToMilesPerHour
    JSR SpeedConverter.Code.SpeedConversionService_ConvertToMilesPerHour  ; Virtual dispatch
    ; Offset 000C: stloc.0
    MOVE.L D3,-4(A6)   ; Store to local 0
    ; Offset 000D: ldarg.2
    MOVE.L 16(A6),D3  ; Load arg.2 (third param)
    ; Offset 000E: ldloc.0
    MOVE.L -4(A6),D4  ; Load local.0
    ; Offset 000F: nop
    ; NOP
    ; Offset 0011: ret
    MOVE.L D4,D0  ; Move return value to D0

    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS


; Methods of System.IDisposable

; Methods of SpeedConverter.Code.SpeedConversionService
SpeedConverter_Code_SpeedConversionService_ConvertToMilesPerHour:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer

    ; Offset 0000: ldarg.1
    MOVE.L 12(A6),D0  ; Load arg.1 (second param)
    ; Offset 0001: conv.r8
    MOVE.L D0,D1  ; Convert to R8 (high word)
    CLR.L D2          ; Convert to R8 (low word)
    ; Offset 0002: ldc.r8
    LEA DOUBLE_CONST_0002(PC),A0
    MOVE.L (A0),D0     ; Double high word
    MOVE.L 4(A0),D3    ; Double low word
    ; Offset 000B: mul
    MOVE.L D1,D0   ; Left high
    MOVE.L D2,D1   ; Left low
    MOVE.L D0,D2  ; Right high
    MOVE.L D3,D3  ; Right low
    JSR __muldf3          ; IEEE 754 double multiply
    ; Offset 000C: call
    ; Framework call: System.Math::Round
    JSR __round
    ; Offset 0011: conv.i4
    MOVE.L D3,D1  ; Convert to I4
    ; Offset 0012: ret
    MOVE.L D1,D0  ; Move return value to D0

    ; Method epilogue
    MOVEM.L (A7)+,A6     ; Restore frame
    RTS



    ; --- Constants Section ---
DOUBLE_CONST_0002:
    DC.L $5696E58A
    DC.L $3FE3E243

    ; --- Data Section ---
    SECTION DATA

SpeedConverter.Program_vtable:
    DC.L SpeedConverter.Program         ; Class pointer

SpeedConverter.Tests.SpeedConversionServiceTests_vtable:
    DC.L SpeedConverter.Tests.SpeedConversionServiceTests         ; Class pointer
    DC.L SpeedConverter_Tests_SpeedConversionServiceTests_ConvertToMilesPerHour_Input_Expected

System.IDisposable_vtable:
    DC.L System.IDisposable         ; Class pointer

SpeedConverter.Code.SpeedConversionService_vtable:
    DC.L SpeedConverter.Code.SpeedConversionService         ; Class pointer
    DC.L SpeedConverter_Code_SpeedConversionService_ConvertToMilesPerHour

    END
