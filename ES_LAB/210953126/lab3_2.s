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
	LDR R10, =DST;
	MOV R1, #N1;
	MOV R2, #N2;
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
	STR R1, [R10];
STOP
	B STOP

N1 EQU 16
N2 EQU 32
	AREA dataseg, DATA, READWRITE
DST DCD 0
	END