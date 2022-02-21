    // intadd function in this file

    .arch armv8-a
    .global intsub

intadd:

    str x20, [sp, -8]
    stp x29, x30, [sp, -24]

    mov x20, x1 // hold orig val

    mvn x1, x2 // make it two complement
    mov x2, #1 // adding one to the complement

    bl intadd // add

    mov x1, x0 // set intadd result to A
    mov x2, x20 // retireve orig

    bl intadd // add them

    ldp x20, x21, [sp], 8
    ldp x29, x30, [sp], 24
ret

