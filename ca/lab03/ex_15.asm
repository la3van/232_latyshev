.text
main:
 li a7, 5
 ecall
 mv x1, a0

 li a7, 5
 ecall
 addi x2, a0, 3

 xor t0, x1, x2
 seqz t1, t0
 xori t2, t1, 1

 li a7, 1
 add a0, t2, zero
 ecall
