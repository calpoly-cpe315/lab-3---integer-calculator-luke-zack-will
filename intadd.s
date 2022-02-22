    // intadd function in this file

    .arch armv8-a
    .global intadd

intadd:
    stp x20, x21, [sp, -16]!
    stp x29, x30, [sp, -32]! // probably can remove

loop:

    eor x21, x1, x2 // xor, for digits left

    mov x1, x21 // stores prev and also updates eor with new operation
    and x2, x1, x2 // and, for carry digits
    lsl x2, x2, #1 // logical shift left to move the carry 

    cmp x2, #0 // if there are carries
    bne loop // branch if not equal

mov x0, x1 // give output reg result

ldp x20, x21, [sp, 16]
ldp x29, x30, [sp], 32

ret

