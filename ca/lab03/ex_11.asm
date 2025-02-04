.text
main:
 li t1, -1
 srli t1, t1, 30
 
 li a7, 5
 ecall
 add t0, a0, zero
 
 li a7, 1
 or a0, t0, t1
 ecall 
 
