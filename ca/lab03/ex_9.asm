.text
main:
 li a7, 5
 ecall
 add t0, a0, zero
 
 li a7, 5
 ecall
 add t1, a0, zero
 
 div t2, t0, t1
 mul t2, t2, t1
 
 rem t3, t0, t1
 
 li a7, 1
 add a0, t2, t3
 ecall 
 
