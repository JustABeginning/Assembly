    .section .data
hello_world:
    .ascii "\n\tHello, World!, Goodbye . . .\n\n"
message_len:
    .quad . - hello_world

    .section .text
    .globl _start
_start:
    # Print "Hello, World!"
    mov $1, %rax        # System call number for write
    mov $1, %rdi        # File descriptor (1 for stdout)
    lea hello_world(%rip), %rsi # Message to write
    mov message_len(%rip), %rdx       # Message length
    syscall              # Make system call to write message

    # Exit program
    mov $60, %rax        # System call number for exit
    xor %rdi, %rdi      # Exit code 0
    syscall              # Make system call to exit
