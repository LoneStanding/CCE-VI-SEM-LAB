	AREA reset, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x40001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
	MOV R4, #0
	MOV R1, #10
OUTER_LOOP
	LDR R0, =LIST
	ADD R0, R0, R4, LSL #2
	MOV R5, R0
	MOV R6, R4
	LDR R3, [R0]	
INNER_LOOP
	ADD R2, R0, #4
	LDR R7, [R2]
	CMP R7, R3
	BGE NOT_LESS
	MOV R5, R2
	MOV R3, R7
NOT_LESS
	SUBS R6, R6, #1
	BNE INNER_LOOP
	LDR R0, =RESULT
	ADD R0, R0, R4, LSL #2
	LDR R2, [R0]
	STR R3, [R0]
	STR R2, [R5]
	ADD R4, R4, #1
	SUBS R1, R1, #1
	CMP R1, #0
	BNE OUTER_LOOP
STOP
	B STOP
LIST DCD  0x10,0x05,0x33,0x24,0x56,0x77,0x21,0x04,0x87,0x01
	AREA dATASEG, DATA, READWRITE
RESULT DCD 0x0
	END
	
	