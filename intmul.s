    // intmul function in this file
    // TODO: Add negatives to mul

    .arch armv8-a
    .global intmul

intmul:

    stp x20, x21, [sp, -16]
    stp x22, x23, [sp, -32]
    stp x29, x30, [sp, -48]

    cmp x1, #0
    beq zero // check if 0

    cmp x2, #0
    beq zero // check if 0

    mov x23, x2 // how many times to add

loop:
    mov x1, x2 // set them equal for iteration of add
    bl intadd // addition fnc
    mov x22, x1 // orig in 22
    mov x1, x23 // make x1 have iterations
    mov x2, #1 // decrement by one
    bl sub

    cmp x23, #0 // is it done?
    bne loop // if not loop

zero: // if zero fnc

    mov x0, #0

ldp x20, x21, [sp], 16
ldp x22, x23, [sp], 32
ldp x29, x30, [sp], 48
ret
