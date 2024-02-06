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
	SUBS R3, #1;
	BNE LOOP
	LDR R1, =(DST+((N-1)*4));
	LDR R6, =(DST+(N-1+SH)*4);
	MOV R5, #N;
LOOP1
	LDR R4, [R1], #-4;
	STR R4, [R6], #-4;
	SUBS R5, #1;
	BNE LOOP1;
STOP
	B STOP

N EQU 10
SH EQU 2
SRC DCD 1,2,3,4,5,6,7,8,9,10
	AREA dataseg, DATA, READWRITE 
DST DCD 0
	END