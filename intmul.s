    // intmul function in this file

    .arch armv8-a
    .global intmul

intmul:

    stp x23, x24, [sp, -16] // registers not used by other ints
    stp x25, x26, [sp, -32] // 26 is negative flag for x1
    stp x29, x30, [sp, -48]!

    cmp x0, #0
    beq zero // check if 0

    cmp x1, #0
    beq zero // check if 0

    mov x23, x0 // A, base value
    mov x24, x1 // B, iterations of loop

    cmp x1, #0
    blt neg // yum
    resume1:

    mov x1, x0 // set them equal for the adding
loop:

    bl intadd // addition fnc
    mov x25, x0 // x25 has result
    mov x0, x24 // set 0 to B counter
    mov x1, #1
    bl intsub
    mov x24, x0
    mov x0, x25
    mov x1, x23 //original value

    cmp x24, #1 // one works, zero doesn't idk why
    bne loop // if not loop
    b end

zero: // if zero fnc

    mov x0, #0

neg:  
    mov x26, #1 //set flag for true
    mvn x1, x1
    mov x0, #1
    bl intadd
    mov x0, x1
    mov x0, x23
    cmp x1, #0
    bgt resume1
    b resume2

end:
    cmp x26, #1
    beq neg
    resume2:

    mov x0, x25
    ldp x23, x24, [sp, 16]
    ldp x25, x26, [sp, 32]
    ldp x29, x30, [sp], 48
ret
