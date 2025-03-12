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
    
    lea rax, fmt
    mov rdi, rax

    lea rax, msg
    mov rsi, rax

    call printf

    mov rax, 0
    pop rbp
    ret
    nop