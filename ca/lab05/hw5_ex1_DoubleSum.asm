.text
main:
 li a7, 5
 ecall
 add t1, a0, zero

 li a7, 5
 ecall
 add t2, a0, zero
 
 li a7, 5
 ecall
 add t3, a0, zero
 
 li a7, 5
 ecall
 add t4, a0, zero

 add s1, t1, t3

 add s2, t2, t4

 li a7, 1
 add a0, s1, zero
 ecall

 li a7, 11
 li a0, '\n'
 ecall

 li a7, 1
 add a0, s2, zero
 ecall

 li a7, 11
 li a0, '\n'
 ecall

 li a7, 10
 ecall