.text

main:
 li a7, 5
 ecall
 addi t6, a0, 0

 slli t5, t6, 2
 sub sp, sp, t5
 addi s1, sp, 0

 li t4, 0
input_loop:
 bge t4, t6, input_done

 li a7, 5
 ecall
 sw a0, 0(s1)
 addi s1, s1, 4
 addi t4, t4, 1
 j input_loop

input_done:
 addi s2, s1, -4
 li s3, 0

output_loop:
 blt s2, sp, output_done

 lw t3, 0(s2)
 andi t2, t3, 1
 bne t2, zero, skip_output

 li a7, 1
 mv a0, t3
 ecall

 li a7, 11
 li a0, 10
 ecall

 li s3, 1

skip_output:
 addi s2, s2, -4
 j output_loop

output_done:
 beq s3, zero, print_newline
 j exit

print_newline:
 li a7, 11
 li a0, 10
 ecall

exit:
 li a7, 10
 ecall
