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
	MOV R5, #1;
	MOV R0, #1;
	MOV R3, #10;
UP
	ADD R1, R0, #1;
	MLA R0, R0, R5, R1;
	SUBS R3, #1;
	BNE UP
STOP
	B STOP
	END