    // intadd function in this file

    .arch armv8-a
    .global intadd

intadd:
    str x19, [sp, -8]!
    stp x20, x21, [sp, -24]!
    stp x29, x30, [sp, -40]! // probably can remove

    mov x19, x1 // restores A
    mov x20, x2 // restores B

loop:

    eor x21, x1, x2 // xor, for digits left

    and x1, x1, x2 // and, for carry digits
    lsl x2, x2, #1 // logical shift left to move the carry 

    cmp x2, #0 // if there are carries
    bne loop // branch if not equal

mov x0, x21 // give output reg result
mov x1, x19 // restore for other fncs
mov x2, x20

ldp x20, x21, [sp, 16]
ldp x29, x30, [sp], 32

ret

