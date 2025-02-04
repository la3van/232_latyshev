.text
main:
 li a7, 5
 ecall # введет x в a0
 addi t0, a0, 5 #t0 = x

 li a7, 5
 ecall
 addi t1, a0, -7 #t1 = y
 
 li a7, 1
 sub a0, t0, t1 #t2 = x + y
 ecall 
 