.text
.globl main

main:
    li a7, 7
    ecall
    fmv.d f0, fa0

    li a7, 7
    ecall
    fmv.d f1, fa0

    jal sqrt3

    fmv.d fa0, f0
    li a7, 3
    ecall

    li a7, 11
    li a0, 10
    ecall

    li a7, 10
    ecall

sqrt3:
    fcvt.s.d f2, f0
    fcvt.s.d f3, f1

    fcvt.w.s t0, f2, rtz
    blez t0, extra_step
    li t1, 1
    j module
    
extra_step:
    li t1, -1
    fneg.s f2, f2

module:
    fmv.s f4, f2
    li t2, 0

iteration:
    fmul.s f5, f4, f4
    fmul.s f5, f5, f4
    fsub.s f5, f5, f2

    fmul.s f6, f4, f4
    li t3, 3
    fcvt.s.w f7, t3
    fmul.s f6, f6, f7

    fdiv.s f5, f5, f6
    fsub.s f6, f4, f5

    fsub.s f7, f6, f4

    fmul.s f8, f7, f7
    fmul.s f9, f3, f3
    fsub.s f10, f8, f9
    fcvt.w.s t4, f10, rtz
    bltz t4, finish

    fmv.s f4, f6
    addi t2, t2, 1
    li t5, 10000
    blt t2, t5, iteration

finish:
    blez t1, change_value
    j end
 
change_value:
    fneg.s f6, f6

end:
    fcvt.d.s f0, f6
    jr ra