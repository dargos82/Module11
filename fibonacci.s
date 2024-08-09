#Program Name: fibonacci.s
#Author: David Blossom
#Date: 11 August 2024
#Purpose: Calculate Fibonacci numbers
#Input: number - integer
#Output: result - calculated result
#Program dictionary:
#	r4: number
#	r5: output

.text
.global main
main:

    #push the stack
    SUB sp, sp, #12
    STR lr, [sp, #0]
    STR r4, [sp, #4]
    STR r5, [sp, #8]

    #prompt user 
    LDR r0, =prompt1
    BL printf

    #read user input
    LDR r0, =numberFormat
    LDR r1, =number
    BL scanf

    LDR r4, =number
    LDR r4, [r4]				//r4 = number

    MOV r0, r4					//r0 = number for getFib
    BL getFib					//r0 = Fibonacci number

    #print result
    MOV r1, r4					//move number to r1 for printing
    MOV r2, r0					//move Fibonacci number to r2 for printing
    LDR r0, =output
    BL printf
	   
    #pop the stack
    LDR lr, [sp, #0]
    LDR r4, [sp, #4]
    LDR r5, [sp, #8]
    ADD sp, sp, #12
    MOV pc, lr

.data
    #prompt for input
    prompt1:	.asciz  "\nEnter a number: "
    
    #number format
    numberFormat:	.asciz	"%d"

    #number
    number:	.word 0

    #output number
    output:	.asciz	"The Fibonacci number of %d is: %d\n"

#END main

.text
getFib:

    #push the stack
    SUB sp, sp, #16
    STR lr, [sp, #0]
    STR r5, [sp, #4]
    STR r6, [sp, #8]
    STR r7, [sp, #12]

    MOV r5, r0					//initialize r5 to number

    #if (n == 0) return 0
    CMP r5, #0
    BNE ifElse
	MOV r0, #0
	B Return

    #else if (n == 1) return 1
    ifElse:
	CMP r5, #1
	BNE Else
	    MOV r0, #1
	    B Return

    #else return getFib(n-1) + getFib(n-2)
    Else:
	SUB r0, r5, #1
	BL getFib
	MOV r6, r0

	SUB r0, r5, #2
	BL getFib
	MOV r7, r0
 
	ADD r0, r6, r7
	B Return

    EndIf:
   
    #pop the stack
    Return:
    LDR lr, [sp, #0]
    LDR r5, [sp, #4]
    LDR r6, [sp, #8]
    LDR r7, [sp, #12]
    ADD sp, sp, #16
    MOV pc, lr

.data

#END getFib

