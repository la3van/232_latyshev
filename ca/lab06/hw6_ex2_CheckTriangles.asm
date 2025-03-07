    .text
    .globl main

main:
    li a7, 5
    ecall
    add s0, zero, a0
    
    li a7, 5
    ecall
    add s1, zero, a0
    
    li a7, 5
    ecall
    add s2, zero, a0
    
    add t5, s0, s1
    add t5, t5, s2
    
    beqz t5, done
    
    mv t1, s0
    bgt s1, t1, try_b
    j skip_b
    
   
try_b:
    mv t0, s1
    
skip_b:
    bgt s2, t0, try_c
    j skip_c
 
try_c:
    mv t0, s2
    
skip_c:
    sub t4, t5, t0
    ble t0, t4, br
    li t6, 2
    j end

br:
    li t6, 1

end:
    li s3, 1
    beq t6, s3, print_yes
    
    li a0, 'N'
    li a7, 11
    ecall
    li a0, 10
    li a7, 11
    ecall
    j main
 
 print_yes:
    li a0, 'Y'
    li a7, 11
    ecall
    li a0, 10
    li a7, 11
    ecall
    j main

done:
    li a7, 10
    ecall