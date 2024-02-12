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
	LDR R0, =SRC1;
	LDR R1, =SRC2;
	LDR R2, =DST;
	MOV R3, #4;
	MOV R6, #0;
UP
	LDR R4, [R0], #4;
	LDR R5, [R1], #4;
	ADCS R4, R5;
	STR R4, [R2], #4;
	SUB R3, #1;
	TEQ R3, #0;
	BNE UP
	ADC R6, #0;
	STR R6, [R2]
STOP
	B STOP
SRC1 DCD 0X11223344, 0X22, 0X33, 0X44
SRC2 DCD 0X11223344, 0X22, 0X33, 0X44
	AREA dataseg, DATA, READWRITE
DST DCD 0,0,0,0,0
	END