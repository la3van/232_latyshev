.text
main:
 li a7, 5
 ecall
 add t0, a0, zero
 srli t0, t0, 2

 li a7, 5
 ecall
 addi t1, a0, -1
 slli t1, t1, 3
 
 li a7, 1
 add a0, t0, t1
 ecall 
 