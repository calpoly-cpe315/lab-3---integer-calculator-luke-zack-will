    // intadd function in this file

    .arch armv8-a
    .global intadd

intadd:
    stp x20, x21, [sp, -16]!
    stp x29, x30, [sp, -32]! // probably can remove

loop:

    eor x21, x1, x2 // xor, for digits left

    mov x20, x1 // stores prev and, which is the result in the final iteration (magic)
    and x2, x1, x2 // and, for carry digits
    lsl x2, x2, #1 // logical shift left to move the carry

    cmp x2, #0 // if there are carries
    bne loop // branch if not equal

ldp x20, x21, [sp, 16]
ldp x29, x30, [sp], 32

ret

