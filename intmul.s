    // intmul function in this file
    // TODO: Add negatives to mul

    .arch armv8-a
    .global intmul

intmul:

    stp x20, x21, [sp, -16]!
    stp x22, x23, [sp, -32]!
    stp x29, x30, [sp, -48]!

    cmp x0, #0
    beq zero // check if 0

    cmp x1, #0
    beq zero // check if 0

    mov x20, x0 // A, base value
    mov x21, x1 // B, iterations of loop

    mov x1, x0 // set them equal for the adding
loop:
    bl intadd // addition fnc
    mov x22, x0 // x22 has result
    mov x0, x21 // set 0 to B counter
    mov x1, #1 // decrement
    bl intsub
    mov x21, x0
    mov x0, x22
    mov x1, x20 //original value

    cmp x21, #0 // is it done?
    bne loop // if not loop

zero: // if zero fnc

    mov x0, #0

ldp x20, x21, [sp, 16]
ldp x22, x23, [sp, 32]
ldp x29, x30, [sp], 48
ret
