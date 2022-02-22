    // Template main.s file for Lab 3
    // partner names here

    .arch armv8-a

    // --------------------------------
    .global main
main:
    // driver function main lives here, modify this for your other functions
    stp x29, x30, [sp, -32]!
    mov x29, sp
    stp x19, x20, [sp, 16]
mainloop:
    //gonna loopback to here

    //start prompt for 1st num
    ldr w0, =string1
    bl printf
    ldr     x0, =scanint
    mov     x1, sp
    bl      scanf           // Scan user's answer
    ldr    x0, [sp]
    mov x19, x0       // Put the user's value in w19

    //start prompt for 2nd num
    ldr w0, =string2
    bl printf
    ldr     x0, =scanint
    mov     x1, sp          // Save stack pointer to x1, you must create space
    bl      scanf           // Scan user's answer
    ldr    x0, [sp]
    mov x20, x0      //num2 in w20

    //prompt for operation
    ldr w0, =stringop
    bl printf
    ldr     x0, =scanchar
    mov     x1, sp          // Save stack pointer to x1, you must create space
    bl      scanf           // Scan user's answer
    ldrb    w2, [sp]       //user oper in w2

    //do calcultion, gonna have 4 diff beq's i assume
    mov x0, x19
    mov x1, x20
    //FROM THIS poitn on, X0/1 have the user inputted math inputs
    //check if its addition
    ldr x3, =addition
    ldrb w3, [x3] //load value to w3
    cmp w2, w3
    b.eq doAdd
    //check if sub
    ldr x3, =subtract
    ldrb w3, [x3] //load value to w3
    cmp w2, w3
    b.eq doSub
    //check if mul
    ldr x3, =multiply
    ldrb w3, [x3] //load value to w3
    cmp w2, w3
    b.eq doMul
    //print the invalid , and mvoe to prompt
    ldr w0, =wrong
    bl printf
    b prompt

doAdd:
    bl intadd
    b calcsdone
doSub:
    bl intsub
    b calcsdone
doMul:
    bl intmul
    b calcsdone

calcsdone:
//print result
    mov x1, x0
    ldr x0, =stringresult
    bl printf


    b prompt

prompt:
    //prompt again
    ldr x0, =again
    bl printf


    //read yes/no
    ldr     x0, =scanchar
    mov     x1, sp          // Save stack pointer to x1, you must create space
    bl      scanf           // Scan user's answer
    ldr     x1, =yes        // Put address of 'y' in x1
    ldrb    w1, [x1]        // Load the actual character 'y' into x1
    ldrb    w0, [sp]        // Put the user's value in r0
    cmp     x0, x1          // Compare user's answer to char 'y'
    //loopback if yes
    b.eq  mainloop

    b end
    //done

        // You'll need to scan characters for the operation and to determine
    // if the program should repeat.
    // To scan a character, and compare it to another, do the following
    /*
    loop: ldr     w0, =scanchar
        mov     x1, sp          // Save stack pointer to x1, you must create space
        bl      scanf           // Scan user's answer
        ldr     x1, =yes        // Put address of 'y' in x1
        ldrb    w1, [x1]        // Load the actual character 'y' into x1
        ldrb    w0, [sp]        // Put the user's value in r0
        cmp     w0, w1          // Compare user's answer to char 'y'
        b       loop            // branch to appropriate location
    */
end:
    ldp x19, x20, [sp, 16]
    ldp x29, x30, [sp], 32
    ret






string1:
    .asciz "Enter Number 1: "
string2:
    .asciz "Enter Number 2: "
stringop:
    .asciz "Enter Operation: "
stringresult:
    .asciz "Result is: %ld\n"
again:
    .asciz "Again? "
wrong:
    .asciz "Invalid Operation Entered.\n"
yes:
    .byte  'y'
multiply:
    .byte '*'
subtract:
    .byte '-'
addition:
    .byte '+'
scanchar:
    .asciz  " %c"
scanint:
    .asciz " %ld"
