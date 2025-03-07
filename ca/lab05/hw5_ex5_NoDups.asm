.text
.globl main

main:
 li a7, 5
 ecall
 add t0, a0, zero

 slli t1, t0, 2
 sub sp, sp, t1
 add s2, sp, zero

 li s3, 0
 li t2, 0

input_values:
 bge t2, t0, end
 li a7, 5
 ecall

 add t6, a0, zero
 li t3, 0

check_value:
 beq t3, s3, new_value
 slli t4, t3, 2
 add t4, t4, s2
 lw t5, 0(t4)
 beq t5, t6, skip_output
 addi t3, t3, 1
 j check_value

new_value:
 li a7, 1
 addi a0, t6, 0
 ecall

 li a7, 11
 li a0, 10
 ecall

 slli t4, s3, 2
 add t4, t4, s2
 sw t6, 0(t4)
 addi s3, s3, 1

skip_output:
 addi t2, t2, 1
 j input_values

end:
 li a7, 10
 ecall