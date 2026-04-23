/* methods.h ? Method declarations */
#ifndef METHODS_H
#define METHODS_H

#include <stdint.h>

#define NUM_METHODS 4
#define NUM_BANKS_USED 1
#define NUM_BANKS_TOTAL 4

/* Method IDs */
#define MID_SpeedConverter_Program_RunTest_LSpeedConverter/Tests/SpeedConversionServiceTests;II_V 0
#define MID_SpeedConverter_Program_Main_LSystem/String[];_V 1
#define MID_SpeedConverter_Tests_SpeedConversionServiceTests_ConvertToMilesPerHour_Input_Expected_II_Z 2
#define MID_SpeedConverter_Code_SpeedConversionService_ConvertToMilesPerHour_I_I 3

/* Method declarations */
extern void SpeedConverter_Program_RunTest(void);
extern void SpeedConverter_Program_Main(void);
extern int32_t SpeedConverter_Tests_SpeedConversionServiceTests_ConvertToMilesPerHour_Input_Expected(void);
extern int32_t SpeedConverter_Code_SpeedConversionService_ConvertToMilesPerHour(void);

/* Dispatch tables (defined in kernel.c) */
extern const uint8_t method_bank_table[];
extern int32_t (* const method_func_table[])(void);

/* Bank switching (defined in kernel.c) */
void __fastcall__ switch_bank(uint8_t bank);
int32_t __fastcall__ call_banked(uint8_t method_id);

#endif /* METHODS_H */
