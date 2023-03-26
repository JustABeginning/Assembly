    .section .text
    .globl _start
_start:
    # Backup `rsi` register
    push %rsi
    # Backup `rdi` register
    push %rdi
    # Backup `rdx` register
    push %rdx
    # Backup `rbx` register (for `rsp` register)
    push %rbx
    # Backup `rax` register
    push %rax
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
    pop %rbx
    pop %rbx
    pop %rbx
    pop %rbx
    # Restore `rax` register
    pop %rax
    # Restore `rbx` register
    pop %rbx
    # Restore `rdx` register
    pop %rdx
    # Restore `rdi` register
    pop %rdi
    # Restore `rsi` register
    pop %rsi
    # Print Operation
    xor %rax, %rax      # set rax to 0 (exit syscall number)
    mov $60, %rax     # set rax to 60 (exit syscall number)
    syscall             # invoke the exit syscall
