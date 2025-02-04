.text
main:
 li a7, 5
 ecall
 add x1, a0, zero

 li a7, 5
 ecall
 add t0, a0, zero

 li t1, 1
 sll t1, t1, t0
 
 li a7, 1
 or a0, x1, t1
 ecall 
 
