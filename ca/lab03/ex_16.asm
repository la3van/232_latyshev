.text
main:
 li a7, 5
 ecall
 add x1, a0, zero

 li a7, 5
 ecall
 add x2, a0, zero

 li a5 -5
 slt a1, a5, x1

 slti a2, x2, 5

 li a7, 1
 and a0, a1, a2
 ecall