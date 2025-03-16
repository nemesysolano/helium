; Disassembly of file: bin/main.o
; Fri Mar 14 17:17:55 2025
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: 8086, x64

default rel

global main: function
global A
global B

extern print_bigint                                     ; near
extern sum_long                                         ; near


SECTION .text   align=1 execute                         ; section number 1, code

main:   ; Function begin
        endbr64                                         ; 0000 _ F3: 0F 1E. FA
        push    rbp                                     ; 0004 _ 55
        mov     rbp, rsp                                ; 0005 _ 48: 89. E5
        sub     rsp, 16                                 ; 0008 _ 48: 83. EC, 10
        sub     rsp, 8                                  ; 000C _ 48: 83. EC, 08
        push    7                                       ; 0010 _ 6A, 07
        mov     r9d, 6                                  ; 0012 _ 41: B9, 00000006
        mov     r8d, 5                                  ; 0018 _ 41: B8, 00000005
        mov     ecx, 4                                  ; 001E _ B9, 00000004
        mov     edx, 3                                  ; 0023 _ BA, 00000003
        mov     esi, 2                                  ; 0028 _ BE, 00000002
        mov     edi, 6                                  ; 002D _ BF, 00000006
        mov     eax, 0                                  ; 0032 _ B8, 00000000
        call    sum_long                                ; 0037 _ E8, 00000000(PLT r)
        add     rsp, 16                                 ; 003C _ 48: 83. C4, 10
        mov     qword [rbp-8H], rax                     ; 0040 _ 48: 89. 45, F8
        mov     rax, qword [rbp-8H]                     ; 0044 _ 48: 8B. 45, F8
        mov     rdi, rax                                ; 0048 _ 48: 89. C7
        call    print_bigint                            ; 004B _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 0050 _ B8, 00000000
        leave                                           ; 0055 _ C9
        ret                                             ; 0056 _ C3
; main End of function


SECTION .data   align=8 noexecute                       ; section number 2, data

A:      dq 400921D9F4D37C13H                            ; 0000 _ 400921D9F4D37C13 


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


