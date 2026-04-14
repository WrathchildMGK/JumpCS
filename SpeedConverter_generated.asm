; Generated 68000 Assembly Code
; Converted from C# MSIL
; Generated: 2026-04-14 10:53:05

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
SpeedConverter.Program_RunTest:
    ; Method prologue
    MOVEM.L A6,-(A7)     ; Save frame
    MOVE.L A7,A6         ; Set up frame pointer
    SUBI.L #8,A7

    ; Offset 0000: nop
    ; NOP
    ; Offset 0001: ldarg.0
    MOVE.L 8(A6),D0  ; Load arg.0 (this/first param)
    ; Offset 0002: ldarg.1
    ; TODO: Unimplemented opcode ldarg.1
    CLR.L D1  ; TODO: Placeholder value
    ; Offset 0003: ldarg.2
    ; TODO: Unimplemented opcode ldarg.2
    CLR.L D2  ; TODO: Placeholder value
    ; Offset 0004: callvirt
    ; Call SpeedConverter.Tests.SpeedConversionServiceTests.ConvertToMilesPerHour_Input_Expected(II)Z
    JSR SpeedConverter.Tests.SpeedConversionServiceTests_ConvertToMilesPerHour_Input_Expected
    ; Return value pushed (non-void method)
    ; Offset 0009: stloc.0
    MOVE.L D0,-4(A6)   ; Store to local 0
    ; Offset 000A: ldloca.s
    LEA -8(A6),A0  ; Load address of local.1
    MOVE.L A0,D3
    ; Offset 000C: ldc.i4.s
    MOVE.L #17,D4  ; Load short constant
    ; Offset 000E: ldc.i4.3
    MOVE.L #3,D5         ; Load 3
    ; Offset 000F: call
    ; Framework method: System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::.ctor
    ; TODO: Implement framework call
    ; Offset 0014: ldloca.s
    LEA -8(A6),A0  ; Load address of local.1
    MOVE.L A0,D6
    ; Offset 0016: ldstr
    ; TODO: Unimplemented opcode ldstr
    ; Offset 001B: call
    ; Framework method: System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendLiteral
    ; TODO: Implement framework call
    ; Offset 0020: nop
    ; NOP
    ; Offset 0021: ldloca.s
    LEA -8(A6),A0  ; Load address of local.1
    MOVE.L A0,D6
    ; Offset 0023: ldarg.1
    ; TODO: Unimplemented opcode ldarg.1
    CLR.L D7  ; TODO: Placeholder value
    ; Offset 0024: call
    ; Framework method: System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendFormatted
    ; TODO: Implement framework call
    ; Offset 0029: nop
    ; NOP
    ; Offset 002A: ldloca.s
    LEA -8(A6),A0  ; Load address of local.1
    MOVE.L A0,D7
    ; Offset 002C: ldstr
    ; TODO: Unimplemented opcode ldstr
    ; Offset 0031: call
    ; Framework method: System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendLiteral
    ; TODO: Implement framework call
    ; Offset 0036: nop
    ; NOP
    ; Offset 0037: ldloca.s
    LEA -8(A6),A0  ; Load address of local.1
    MOVE.L A0,D6
    ; Offset 0039: ldarg.2
    ; TODO: Unimplemented opcode ldarg.2
    CLR.L D7  ; TODO: Placeholder value
    ; Offset 003A: call
    ; Framework method: System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendFormatted
    ; TODO: Implement framework call
    ; Offset 003F: nop
    ; NOP
    ; Offset 0040: ldloca.s
    LEA -8(A6),A0  ; Load address of local.1
    MOVE.L A0,D7
    ; Offset 0042: ldstr
    ; TODO: Unimplemented opcode ldstr
    ; Offset 0047: call
    ; Framework method: System.Runtime.CompilerServices.DefaultInterpolatedStringHandler::AppendLiteral
    ; TODO: Implement framework call
    ; Offset 004C: nop
    ; NOP
    ; Offset 004D: ldloca.s
    LEA -8(A6),A0  ; Load address of local.1
    MOVE.L A0,D6
    ; Offset 004F: ldloc.0
    MOVE.L -4(A6),D7  ; Load local.0
