	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	AREA SortArray, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =SRC;
	LDR R1, =ARR;
	MOV R3, #N;
	MOV R10, #0XFF;
LOOP
	LDR R4, [R0], #4;
	STR R4, [R1], #4;
	SUB R3, #1;
	TEQ R3, #0;
	BNE LOOP
	STR R10, [R1];
	LDR R0, =ARR;
	MOV R5, #78;
	MOV R3, #0;
	MOV R4, #N;
SEARCH
	LDR R2, [R0], #4;
	CMP R2, R5;
	BEQ STOP
	ADD R3, #1;
	SUB R4, #1;
	TEQ R4, #0;
	BEQ STOP
	B SEARCH
STOP
	STR R3, [R1];
	B STOP

N EQU 6
SRC DCD 1,2,3,45,6,78
	AREA DATASEG, DATA, READWRITE
ARR DCD 0
	END