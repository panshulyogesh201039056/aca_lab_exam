   AREA ADD_ARRAY,CODE,READONLY
    ENTRY
MAIN
        LDR R0,VALUE		;LOAD THE MEMORY ADDRESS TO R0
        LDR R2,[R0]			;LOAD THE CONTENT OF THE MEMORY ADRESS
        MOV R3,#0X00		;CLEAR THE REQISTER TO STORE THE RESULT
JUMP    CMP R2,#0			;COMPARE THE COUNTER VALUE WITH 0
        BEQ EXIT			;IF IT IS EQUAL TO ZERO JUMP TO THE LABEL EXIT
        LDR R1,[R0,#4]!		;LOAD THE CONTENT OF R0 TO R0 AND ALSO INCREMENT THE ADRESS BY 32BITS
        CMP R1,#0			;CHECK THE VALUE OF R1 WHETHER IT IS POSITIVE OR NEGITIVE VALUE?
        BMI NEXT			;IF THE VALUE IS NEGITIVE INGORE THE VALUE AND JUMP TO NEXT VALUE, THIS CAN BE DONE BY CHECK THE N FLAG IN CPSR.
        ADD R3,R3,R1		;IF VALUE IS POSITIVE ADD THE VALUE WITH PREVIOUS 
        ADD R2,R2,#-1		;DECREMENT THE COUNTER BY ONE NUMBER
        B JUMP				;REPEAT THE LOOP IF COUNTER VALUE IS NOT EQUAL TO ZERO;

;IF VALUE IS NEGATIVE THIS LOOP WILL EXCECUTE

NEXT
        SUB R2,R2,#1		;DECREMENT THE COUNTER BY ONE NUMBER
        CMP R2,#0			;COMPARE THE COUNTER VALUE WITH ZERO
        BEQ EXIT			;IF IT IS EQUAL TO ZERO EXIT THE LOOP
        BNE JUMP			;IF COUNTER VALUE IS NOT EQUAL TO ZERO JUMP BACK AND REPEAT THE PROCESS
EXIT LDR R4,RESULT			;LOAD 40000000 TO R4
     STR R3,[R4]			;SOTRE THE RESULT IN MEMORY ADDRESS 40000000
STOP B STOP					;TERMINATION OF THE PROCESS
           
VALUE DCD &40000000			;ASSIGNING 40000000 TO VARIABLE VALUE AND ACT AS A POINTER
RESULT DCD &4000003C		;ASSIGNING 40000003 TO VARIABLE VALUE
    END						;END OF THE CODE
		
		;PANSHUL YOGESH 201039056