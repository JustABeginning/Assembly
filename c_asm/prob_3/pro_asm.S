    .section .data
    .globl printme
    .type printme, @function

    .section .text
printme:
    # Save Current Stack Position
    mov %rsp, %rbx
    # push ". . .\n\n\0"
    mov $0x000A0A2E202E202E, %rax
    push %rax
    # push "GoodBye "
    mov $0x20657942646F6F47, %rax
    push %rax
    # push "World!, "
    mov $0x202C21646C726F57, %rax
    push %rax
    # push "\n\tHello "
    mov $0x206F6C6C6548090A, %rax
    push %rax
    # Length of String
    sub %rsp, %rbx
    # Print Operation
    mov $1, %rax      # set rax to 1 (syscall number for write)
    mov $1, %rdi      # set rdi to 1 (file descriptor for stdout)
    lea (%rsp), %rsi    # set rsi to the address of the string
    mov %rbx, %rdx     # set rdx to the length of the string
    syscall             # invoke the write syscall
    # Pop out String(s)
pop_string:
    pop %rcx
    sub $8, %rbx
    jnz pop_string
    ret
