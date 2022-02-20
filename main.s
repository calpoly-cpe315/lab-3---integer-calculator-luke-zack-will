    // Template main.s file for Lab 3
    // partner names here

    .arch armv8-a

    // --------------------------------
    .global main
main:
    // driver function main lives here, modify this for your other functions
    stp x29, x30, [sp, -32]!
    mov x29, sp
mainloop:
    //gonna loopback to here
    //start prompt for 1st num
    ldr w0, printdata
    bl printf

    //read 1st num
    ldr     w0, =scanint
    mov     x1, sp
    bl      scanf           // Scan user's answer
    ldrb    w19, [sp]        // Put the user's value in r0

    //start prompt for 2nd num
    ldr w0, printdata + 4
    bl printf


    //read 2nd num
    ldr     w0, =scanint
    mov     x1, sp          // Save stack pointer to x1, you must create space
    bl      scanf           // Scan user's answer
    ldrb    w20, [sp]
    //prompt for operation

    ldr w0, printdata + 8
    bl printf
    //read operation


    //do calculation

    //prompt again
    ldr w0, printdata + 16
    bl printf


    //read yes/no
    ldr     w0, =scanchar
    mov     x1, sp          // Save stack pointer to x1, you must create space
    bl      scanf           // Scan user's answer
    ldr     x1, =yes        // Put address of 'y' in x1
    ldrb    w1, [x1]        // Load the actual character 'y' into x1
    ldrb    w0, [sp]        // Put the user's value in r0
    cmp     w0, w1          // Compare user's answer to char 'y'
    //loopback if yes
    b.eq  mainloop




    // You'll need to scan characters for the operation and to determine
    // if the program should repeat.
    // To scan a character, and compare it to another, do the following
loop: ldr     w0, =scanchar
      mov     x1, sp          // Save stack pointer to x1, you must create space
      bl      scanf           // Scan user's answer
      ldr     x1, =yes        // Put address of 'y' in x1
      ldrb    w1, [x1]        // Load the actual character 'y' into x1
      ldrb    w0, [sp]        // Put the user's value in r0
      cmp     w0, w1          // Compare user's answer to char 'y'
      b       loop            // branch to appropriate location

printdata:
    .word string1//+0
    .word string2//+4
    .word stringop//+8
    .word stringresult//+12
    .word again//+16
    .word wrong//+20
string1:
    .asciz "Enter Number 1: "
string2:
    .asciz "Enter Number 2: "
stringop:
    .asciz "Enter Operation: "
stringresult:
    .asciz "Result is: %d\n"
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
add:
    .byte '+'
scanchar:
    .asciz  " %c"
scanint:
    .asciz " %d"
