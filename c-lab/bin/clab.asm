; Disassembly of file: bin/clab.o
; Wed Feb 26 20:09:59 2025
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: SSE2, x64

default rel

global print_double: function
global main: function
global pi
global message

extern printf                                           ; near


SECTION .text   align=1 execute                         ; section number 1, code

print_double:; Function begin
        endbr64                                         ; 0000 _ F3: 0F 1E. FA
        push    rbp                                     ; 0004 _ 55
        mov     rbp, rsp                                ; 0005 _ 48: 89. E5
        sub     rsp, 16                                 ; 0008 _ 48: 83. EC, 10
        movsd   qword [rbp-8H], xmm0                    ; 000C _ F2: 0F 11. 45, F8
        mov     rax, qword [rbp-8H]                     ; 0011 _ 48: 8B. 45, F8
        movq    xmm0, rax                               ; 0015 _ 66 48: 0F 6E. C0
        lea     rax, [rel ?_001]                        ; 001A _ 48: 8D. 05, 00000000(rel)
        mov     rdi, rax                                ; 0021 _ 48: 89. C7
        mov     eax, 1                                  ; 0024 _ B8, 00000001
        call    printf                                  ; 0029 _ E8, 00000000(PLT r)
        nop                                             ; 002E _ 90
        leave                                           ; 002F _ C9
        ret                                             ; 0030 _ C3
; print_double End of function

main:   ; Function begin
        endbr64                                         ; 0031 _ F3: 0F 1E. FA
        push    rbp                                     ; 0035 _ 55
        mov     rbp, rsp                                ; 0036 _ 48: 89. E5
        mov     dword [rbp-1CH], 1                      ; 0039 _ C7. 45, E4, 00000001
        mov     qword [rbp-18H], 2                      ; 0040 _ 48: C7. 45, E8, 00000002
        mov     rax, qword [rel message]                ; 0048 _ 48: 8B. 05, 00000000(rel)
        mov     qword [rbp-10H], rax                    ; 004F _ 48: 89. 45, F0
        movsd   xmm0, qword [rel pi]                    ; 0053 _ F2: 0F 10. 05, 00000000(rel)
        movsd   qword [rbp-8H], xmm0                    ; 005B _ F2: 0F 11. 45, F8
        mov     rax, qword [rbp-18H]                    ; 0060 _ 48: 8B. 45, E8
        mov     edx, eax                                ; 0064 _ 89. C2
        mov     eax, dword [rbp-1CH]                    ; 0066 _ 8B. 45, E4
        add     eax, edx                                ; 0069 _ 01. D0
        pop     rbp                                     ; 006B _ 5D
        ret                                             ; 006C _ C3
; main End of function


SECTION .data   align=8 noexecute                       ; section number 2, data

pi:     dq 400921D9F4D37C13H                            ; 0000 _ 3.141529 


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=1 noexecute                       ; section number 4, const

        db 4DH, 65H, 73H, 73H, 61H, 67H, 65H, 00H       ; 0000 _ Message.

?_001:                                                  ; byte
        db 25H, 38H, 2EH, 32H, 66H, 0AH, 00H            ; 0008 _ %8.2f..


SECTION .data.rel.local align=8 noexecute               ; section number 5, data

message: dq Unnamed_4_0                                 ; 0000 _ 0000000000000000 (d)


SECTION .note.gnu.property align=8 noexecute            ; section number 6, const

        db 04H, 00H, 00H, 00H, 10H, 00H, 00H, 00H       ; 0000 _ ........
        db 05H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H       ; 0008 _ ....GNU.
        db 02H, 00H, 00H, 0C0H, 04H, 00H, 00H, 00H      ; 0010 _ ........
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0018 _ ........


