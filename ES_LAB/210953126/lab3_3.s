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
	LDR R5, =DST;
	MOV R1, #N1;
	MOV R2, #N2;
	MOV R0, #0;
	MUL R3, R1, R2;
UP
	CMP R1, R2;
	BEQ GCD
	BCS DIV
	MOV R4, R1;
	MOV R1, R2;
	MOV R2, R4;
	B UP
DIV
	SUBS R1, R2;
	CMP R1, #0;
	BEQ GCD
	B UP
GCD
	MOV R10, R1;
DIV2
	SUBS R3, R10;
	ADD R0, #1;
	CMP R3, #0;
	STR R0, [R5];
	BEQ STOP
	B DIV2
STOP
	B STOP
N1 EQU 2
N2 EQU 3
	AREA dataseg, DATA, READWRITE
DST DCD 0
	END
	