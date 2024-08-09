#Program Name: recMult.s
#Author: David Blossom
#Date: 11 August 2024
#Purpose: Perform multiplication recursively
#Input: multiplier - integer; iterations - integer
#Output: result - calculated result
#Program dictionary:
#	r4: multiplier
#	r5: iterations
#	r6: output

.text
.global main
main:

    #push the stack
    SUB sp, sp, #16
    STR lr, [sp, #0]
    STR r4, [sp, #4]
    STR r5, [sp, #8]
    STR r6, [sp, #12]

    #prompt user 
    LDR r0, =prompt1
    BL printf

    #read user input
    LDR r0, =multiplierFormat
    LDR r1, =multiplier
    BL scanf

    LDR r4, =multiplier
    LDR r4, [r4]				//r4 = multiplier

    #prompt user 
    LDR r0, =prompt2
    BL printf

    #read user input
    LDR r0, =iterationsFormat
    LDR r1, =iterations
    BL scanf

    LDR r5, =iterations
    LDR r5, [r5]				//r5 = iterations


    MOV r0, r4
    MOV r1, r5
    BL multiply

    #print result
    MOV r1, r0
    LDR r0, =output
    BL printf
	   
    #pop the stack
    LDR lr, [sp, #0]
    LDR r4, [sp, #4]
    LDR r5, [sp, #8]
    LDR r6, [sp, #12]
    ADD sp, sp, #16
    MOV pc, lr

.data
    #prompt for input
    prompt1:	.asciz  "\nEnter the multiplier: "
 
    #prompt for input
    prompt2:	.asciz  "\nEnter the number of iterations: "
    
    #format for multiplier
    multiplierFormat:	.asciz  "%d"
   
    #multiplier
    multiplier:	.word	0

    #format for multiplier
    iterationsFormat:	.asciz  "%d"
   
    #multiplier
    iterations:	.word	0

    #output prime numbers
    output:	.asciz	"The product is: %d\n"

#END main

.text
multiply:

    #push the stack
    SUB sp, sp, #16
    STR lr, [sp, #0]
    STR r4, [sp, #4]
    STR r5, [sp, #8]
    STR r6, [sp, #12]

    MOV r4, r0
    MOV r5, r1

    #if (iterations == 1) return multiplier
    CMP r5, #0
    BNE Else
	MOV r0, #0
	B Return

    Else:
	SUB r1, r5, #1
	//MOV r0, r4
	BL multiply
	ADD r0, r4, r0
	B Return

    EndIf:
   
    #pop the stack
    Return:
    LDR lr, [sp, #0]
    LDR r4, [sp, #4]
    LDR r5, [sp, #8]
    LDR r6, [sp, #12]
    ADD sp, sp, #16
    MOV pc, lr

.data

#END multiply

