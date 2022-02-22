    // intadd function in this file

    .arch armv8-a
    .global intadd

intadd:
    stp x20, x21, [sp, -16]!
    stp x29, x30, [sp, -32]! // probably can remove

    mov x20, x1 // restores primary val

loop:

    eor x21, x1, x2 // xor, for digits left

    and x2, x1, x2 // and, for carry digits
    lsl x2, x2, #1 // logical shift left to move the carry 

    mov x1, x21 // stores prev, gives eor and and updated vals for carry

    cmp x2, #0 // if there are carries
    bne loop // branch if not equal

mov x0, x1 // give output reg result
mov x1, x20 // restore for other fncs

ldp x20, x21, [sp, 16]
ldp x29, x30, [sp], 32

ret

