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
LOOP
	LDR R4, [R0], #4;
	STR R4, [R1], #4;
	SUB R3, #1;
	TEQ R3, #0;
	BNE LOOP
	LDR R0, =ARR;
	LDR R1, =ARR;
	LDR R7, =ARR;
	LDR R8 ,=ARR;
	MOV R5, #N;
	MOV R12, #4;
OUT_LOOP
	LDR R2, [R0], #4;
	SUB R5, #1;
	TEQ R5, #0;
	BEQ STOP
	MOV R6, #N;
	MOV R4, #0;
IN_LOOP
	LDR R3, [R1], #4;
	SUB R6, #1;
	TEQ R6, #0;
	BEQ BEF_OUT
	CMP R3, R2;
	BCS LESS
	ADD R4, #1;
	B IN_LOOP
LESS
	MOV R11, R4;
	B IN_LOOP
BEF_OUT
	MUL R11, R12;
	LDR R9, [R7];
	LDR R10, [R8, R11];
	STR R9, [R8, R11];
	STR R10, [R7], #4;
	B OUT_LOOP
STOP
	B STOP
N EQU 6
SRC DCD 1,2,3,45,6,78
	AREA DATASEG, DATA, READWRITE
ARR DCD 0
	END