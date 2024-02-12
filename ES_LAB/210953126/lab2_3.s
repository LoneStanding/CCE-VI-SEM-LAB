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
	MOV R2, #4;
	LDR R3, =DST;
	MOV R8, #0;
	ADDS R8, #0;
UP
	LDR R4, [R0], #4;
	LDR R5, [R1], #4;
	SBCS R4, R5;
	STR R4, [R3], #4;
	SUB R2, #1;
	TEQ R2, #0;
	BNE UP
	MOV R4, #0;
	SBC R4, #0;
	STR R4, [R3];
	LDR R0, =DST;
STOP
	B STOP
SRC1 DCD 0X21436587, 0X78563412, 0X0, 0X11111111
SRC2 DCD 0X98103254, 0X21436587, 0X11111111, 0X0
	AREA dataseg, DATA, READWRITE
DST DCD 0,0,0,0,0
	END
	