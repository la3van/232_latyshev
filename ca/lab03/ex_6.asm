.text
main:
 li a7, 5
 ecall
 add t0, a0, zero
 
 slli t0, t0, 1
 add x1, t0, t0
 add x1, x1, t0
 #li a7, 1
 #add a0, x1, zero
 #ecall
 

 li a7, 5
 ecall
 add t1, a0, zero
 slli x2, t1, 1
 add x2, x2, t1
 
 #li a7, 1
 #add a0, x2, zero
 #ecall
 
 li a7, 1
 sub a0, x1, x2
 ecall 