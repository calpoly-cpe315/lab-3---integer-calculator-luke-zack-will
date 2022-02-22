    // intadd function in this file

    .arch armv8-a
    .global intsub

intsub:

    str x20, [sp, -8]
    stp x29, x30, [sp, -24]

    mov x20, x0 // move argument 0 to storage

    mvn x0, x1 // invert bits
    mov x1, #1 // adding one to the inverted

    bl intadd // add

    mov x1, x0 // set intadd result to A
    mov x0, x20 // retireve argumetn 0

    bl intadd // add them

    //answer should be correct rn

    ldp x20, x21, [sp], 8
    ldp x29, x30, [sp], 24

    ret

