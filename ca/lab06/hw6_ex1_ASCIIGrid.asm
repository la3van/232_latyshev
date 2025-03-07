    .text
    .globl main

main:
    li a7, 5
    ecall
    add s0, zero, a0
    li a7, 5
    ecall
    add s1, zero, a0
    li t2, 0

process:
    bge t2, s1, end

    li a7, 11
    li a0, '+'
    ecall

    li t0, 0
    
rw1:
    bge t0, s0, rw_end
    li a7, 11
    li a0, '-'
    ecall
    li a7, 11
    li a0, '+'
    ecall
    addi t0, t0, 1
    j rw1

rw_end:
    li a7, 11
    li a0, 10
    ecall

    li a7, 11
    li a0, '|'
    ecall

    li t0, 0
rw2:
    bge t0, s0, rw2_end
    li a7, 11
    li a0, ' '
    ecall
    li a7, 11
    li a0, '|'
    ecall
    addi t0, t0, 1
    j rw2

rw2_end:
    li a7, 11
    li a0, 10
    ecall
    addi t2, t2, 1
    j process

end:
    li a7, 11
    li a0, '+'
    ecall

    li t0, 0
 
last_rw:
    bge t0, s0, last_rw_end
    li a7, 11
    li a0, '-'
    ecall
    li a7, 11
    li a0, '+'
    ecall
    addi t0, t0, 1
    j last_rw

last_rw_end:
    li a7, 10
    ecall
