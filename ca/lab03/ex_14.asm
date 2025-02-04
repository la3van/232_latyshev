.text
main:
 li a7, 5
 ecall
 add x1, a0, zero

 li a7, 5
 ecall
 add x2, a0, zero
 
 li a7, 1
 slt a0, x1, x2
 xori a0, a0, 1
 ecall 
 
