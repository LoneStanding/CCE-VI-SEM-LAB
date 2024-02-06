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
	MOV R3, #10;
LOOP
	LDR R4, [R0], #4;
	STR R4, [R1], #4;
	SUB R3, #1;
	TEQ R3, #0;
	BNE LOOP
	MOV R3, #5;
	LDR R0, =DST;
	LDR R1, =DST+9*4;
LOOP2
	LDR R5, [R0];
	LDR R4, [R1];
	STR R4, [R0], #4;
	STR R5, [R1], #-4;
	SUB R3, #1;
	TEQ R3, #0;
	BNE LOOP2
STOP
	B STOP
	
	
N EQU 10;
SRC DCD 1,2,3,4,5,6,7,8,9,10;
	AREA dataseg, DATA, READWRITE 
DST DCD 0
	END