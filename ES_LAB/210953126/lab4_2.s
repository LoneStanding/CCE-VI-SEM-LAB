	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN
	AREA MYCODE, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =BCD;
	LDR R1, [R0];
	MOV R2, #0;
	MOV R3, #1;
	MOV R10, #0XA;
UP
	CMP R1, #0;
	BEQ EXIT
	AND R4, R1, #0XF;
	MLA R2, R3 ,R4, R2;
	LSR R1, #0X4;
	MUL R3, R10;
	B UP
EXIT 
	LDR R0, =HEX;
	STR R2, [R0];
STOP
	B STOP
BCD DCD 0X10
	AREA dataseg, DATA, READWRITE
HEX DCD 0
	END