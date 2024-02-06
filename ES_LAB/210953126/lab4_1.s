	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN
	AREA MYCODE, CODE, READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
	MOV R0, #N1;
	MOV R1, #0X0F;
	AND R1, R0;
	CMP R1, #9;
	BEQ UP
	
UP
	ADD R1, #30;
	LSL R2, R1, #8;
	
STOP
	B STOP
N1 EQU 0X26
	END