.text
main:
 li a7, 5
 ecall
 add t0, a0, zero

 li a7, 5
 ecall
 add t1, a0, zero
 
 sll t2, t0, t1
 
 li a7, 1
 addi a0, t2, -10
 ecall 
 