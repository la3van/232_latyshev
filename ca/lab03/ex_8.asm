.text
main:
 li a7, 5
 ecall
 add t0, a0, zero
 
 addi t0, t0, 5
 

 li a7, 5
 ecall
 add t1, a0, zero
 
 div t0, t0, t1
 addi t1, t1, -1
 
 addi x1, zero, 10
 div t1, x1, t1
 
 li a7, 1
 add a0, t0, t1
 ecall 
 
