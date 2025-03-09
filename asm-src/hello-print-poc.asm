section .note.GNU-stack noalloc noexec nowrite progbits
extern printf
extern exit
global main

section .data ; PRINTF SYNTAX:    printf(fmt, msg); 
    fmt db "output is: %s", 10, 0 
    msg db "testing lalallaa", 0
    
section .text
main: 
    push rbp
    mov rbp, rsp    
    mov rdi, fmt
    mov rsi, msg

    call printf

    mov rax, 0
    pop rbp
    ret
    nop