	AREA RESET, DATA, READONLY
    EXPORT __Vectors
__Vectors
    DCD 0x10001000      
    DCD Reset_Handler    
    ALIGN
	AREA mycode, code, Readonly
    ENTRY
	EXPORT Reset_Handler
Reset_Handler  
    MOV R4, #0           
    MOV R1, #10           
    LDR R0, =LIST        
    LDR R2, =RESULT       
UP	
	LDR R3, [R0,R4]
	STR R3, [R2,R4]
	ADD R4, #04
	SUB R1,#01
	CMP R1,#00
	BHI UP
    LDR R0, =RESULT       
    MOV R3, #10           
    MOV R9, R3            

OUTER_LOOP
    MOV R5, R0            
    MOV R8, R5            
    MOV R4, R3   
	
INNER_LOOP
    LDR R6, [R5]          
    LDR R7, [R8]          
    CMP R6, R7            
    MOVLT R8, R5
    ADD R5, #4            
    SUBS R4, R4, #1
    BNE INNER_LOOP    
    LDR R6, [R0]          
    LDR R7, [R8]          
    STR R7, [R0]          
    STR R6, [R8]
    ADD R0, #4            
    SUB R3, #1
    SUBS R9, R9, #1
    BNE OUTER_LOOP

LIST  DCD 0x05, 0x12, 0x33, 0x28, 0x32, 0xab, 0x06, 0x08, 0x95, 0x03
	AREA data1, DATA, READWRITE
RESULT DCW 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	END
