.text
main:
 li t1, -1
 slli t1, t1, 2
 
 li a7, 5
 ecall
 add t0, a0, zero
 
 li a7, 1
 add a0, t0, t1
 ecall 
 
