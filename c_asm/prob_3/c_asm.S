    .section .data
    .globl _start
    .globl c_entry
    .type c_entry, @function

    .section .text
_start:
    /** Start Program */
    /* Backup GPR(s) */
    # `rbx` (stack length)
    push %rbx
    # `rcx` (4th arg)
    push %rcx
    # `rdx` (3rd arg)
    push %rdx
    # `rsi` (2nd arg)
    push %rsi
    # `rdi` (1st arg)
    push %rdi
    # `rax` (call code)
    push %rax
    /** Start Main */
    /* Print PID */
    mov $110, %rax
    syscall
    # Use "> " for PID
    mov $0x203E, %rdi
    call dispRAX
    /* End PID */
    /* Print UID */
    mov $102, %rax
    syscall
    # Use "# " for UID
    mov $0x2023, %rdi
    call dispRAX
    /* End UID */
    /* Print GID */
    mov $104, %rax
    syscall
    # Use "$ " for GID
    mov $0x2024, %rdi
    call dispRAX
    /* End GID */
    /* Set UID */
    mov $105, %rax
    # UID Value
    mov $10, %rdi
    syscall
    # Use "@ " for RETURN VALUE
    mov $0x2040, %rdi
    call dispRAX
    /* End Set UID */
    /* Set GID */
    mov $106, %rax
    # GID Value
    mov $11, %rdi
    syscall
    # Use "@ " for RETURN VALUE
    mov $0x2040, %rdi
    call dispRAX
    /* End Set GID */
    /* Call C Function */
    call c_entry
    /** End Main */
    /* Restore GPR(s) */
    # `rax`
    pop %rax
    # `rdi`
    pop %rdi
    # `rsi`
    pop %rsi
    # `rdx`
    pop %rdx
    # `rcx`
    pop %rcx
    # `rbx`
    pop %rbx
    /* Exit Operation */
    # Exit Code
    xor %rdi, %rdi
    # Call Code
    mov $60, %rax
    # Exit
    syscall
    /** End Program */
    /** Function(s) */
dispRAX:
    # test `rax` for -ve
    test %rax, %rax
    mov $1, %rsi
    jns cont_flowA
    not %rax
    add %rsi, %rax
    sub %rsi, %rsi
cont_flowA:
    xor $1, %rsi
    /* Push String(s) */
    # Save Current Stack Position
    mov %rsp, %rbx
    # push "\n\n\0"
    push $0x000A0A
    # push digit(s)
loop_digit:
    xor %rdx, %rdx
    mov $10, %rcx
    div %rcx
    mov %rdx, %rcx
    add $48, %rcx
    push %rcx
    test %rax, %rax
    jnz loop_digit
    # test `rsi` for -ve
    test %rsi, %rsi
    jz cont_flowB
    # push "-"
    push $0x2D
cont_flowB:
    # push `rdi` (1st arg)
    push %rdi
    # push "\n\t"
    push $0x090A
    # String Length
    sub %rsp, %rbx
    /* Print Operation */
    # Call Code
    mov $1, %rax
    # File Descriptor
    mov $1, %rdi
    # String Start
    lea (%rsp), %rsi
    # String Length
    mov %rbx, %rdx
    # Print
    syscall
    /* Pop String(s) */
pop_string:
    pop %rsi
    sub $8, %rbx
    jnz pop_string
    ret
