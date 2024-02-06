	AREA reset, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA myCode, CODE, READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
	LDR R0, =SRC;
	LDR R1, =DST;
	LDR R5, =0;
	MOV R3, #N;
LOOP
	LDR R10, [R0], #4;
	ADD R5, R10;
	SUB R3, #1;
	TEQ R3, #0;
	BNE LOOP
	STR R5, [R1], #4;
STOP
	B STOP
	
N EQU 10;
SRC DCD 1,2,3,4,5,6,7,8,9,10;
	AREA dataseg, DATA, READWRITE
DST DCD 0
	END