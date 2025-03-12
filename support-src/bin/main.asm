; Disassembly of file: support-src/bin/main.o
; Tue Mar 11 20:41:15 2025
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: SSE2, x64

default rel

global main: function
global A
global B

extern print_bigint                                     ; near
extern print_integer                                    ; near
extern print_string                                     ; near
extern print_float                                      ; near


SECTION .text   align=1 execute                         ; section number 1, code

main:   ; Function begin
        endbr64                                         ; 0000 _ F3: 0F 1E. FA
        push    rbp                                     ; 0004 _ 55
        mov     rbp, rsp                                ; 0005 _ 48: 89. E5
        sub     rsp, 32                                 ; 0008 _ 48: 83. EC, 20
        movsd   xmm0, qword [rel A]                     ; 000C _ F2: 0F 10. 05, 00000000(rel)
        movsd   qword [rbp-18H], xmm0                   ; 0014 _ F2: 0F 11. 45, E8
        mov     rax, qword [rel B]                      ; 0019 _ 48: 8B. 05, 00000000(rel)
        mov     qword [rbp-10H], rax                    ; 0020 _ 48: 89. 45, F0
        mov     dword [rbp-1CH], 1234                   ; 0024 _ C7. 45, E4, 000004D2
        mov     qword [rbp-8H], 1234567890              ; 002B _ 48: C7. 45, F8, 499602D2
        mov     rax, qword [rbp-18H]                    ; 0033 _ 48: 8B. 45, E8
        mov     esi, 6                                  ; 0037 _ BE, 00000006
        mov     edi, 12                                 ; 003C _ BF, 0000000C
        movq    xmm0, rax                               ; 0041 _ 66 48: 0F 6E. C0
        call    print_float                             ; 0046 _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-10H]                    ; 004B _ 48: 8B. 45, F0
        mov     rdi, rax                                ; 004F _ 48: 89. C7
        call    print_string                            ; 0052 _ E8, 00000000(PLT r)
        mov     eax, dword [rbp-1CH]                    ; 0057 _ 8B. 45, E4
        mov     edi, eax                                ; 005A _ 89. C7
        call    print_integer                           ; 005C _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-8H]                     ; 0061 _ 48: 8B. 45, F8
        mov     rdi, rax                                ; 0065 _ 48: 89. C7
        call    print_bigint                            ; 0068 _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 006D _ B8, 00000000
        leave                                           ; 0072 _ C9
        ret                                             ; 0073 _ C3
; main End of function


SECTION .data   align=8 noexecute                       ; section number 2, data

A:      dq 400921D9F4D37C13H                            ; 0000 _ 3.141529 


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=1 noexecute                       ; section number 4, const

        db 32H, 31H, 00H                                ; 0000 _ 21.


SECTION .data.rel.local align=8 noexecute               ; section number 5, data

B:      dq Unnamed_4_0                                  ; 0000 _ 0000000000000000 (d)


SECTION .note.gnu.property align=8 noexecute            ; section number 6, const

        db 04H, 00H, 00H, 00H, 10H, 00H, 00H, 00H       ; 0000 _ ........
        db 05H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H       ; 0008 _ ....GNU.
        db 02H, 00H, 00H, 0C0H, 04H, 00H, 00H, 00H      ; 0010 _ ........
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0018 _ ........


