    .section .text
    .globl _start
_start:
    # Print the number
    mov $1, %rax        # System call number for write
    mov $1, %rdi        # File descriptor (1 for stdout)
    mov $42, %rsi       # Number to be printed
    mov $1, %rdx        # Message length (1 for a single integer)
    syscall             # Make system call to write number

    # Exit program
    mov $60, %rax       # System call number for exit
    xor %rdi, %rdi      # Exit code 0
    syscall             # Make system call to exit
