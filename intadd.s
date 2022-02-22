    // intadd function in this file

    .arch armv8-a
    .global intadd

intadd:
    str x19, [sp, -16]!
    stp x20, x21, [sp, -32]!
    stp x29, x30, [sp, -48]! // probably can remove

    mov x19, x0 // stores A
    mov x20, x1 // stores B

loop:

    eor x19, x19, x20 // xor, for digits left

    and x21, x19, x20 // and, for carry digits
    lsl x20, x20, #1 // logical shift left to move the carry

    cmp x2, #0 // if there are carries
    bne loop // branch if not equal

mov x0, x19 // results of final eor, should be answer

ldp x20, x21, [sp, 16]
ldp x29, x30, [sp], 32

ret

