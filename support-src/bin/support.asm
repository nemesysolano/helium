; Disassembly of file: bin/support.o
; Mon Mar 10 17:38:28 2025
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: SSE2, x64

default rel

global print_float: function
global print_integer: function
global print_bigint: function
global print_string: function
global print_bool: function
global print_space: function
global print_newline: function
global new_line

extern putchar                                          ; near
extern printf                                           ; near


SECTION .text   align=1 execute                         ; section number 1, code

print_float:; Function begin
        endbr64                                         ; 0000 _ F3: 0F 1E. FA
        push    rbp                                     ; 0004 _ 55
        mov     rbp, rsp                                ; 0005 _ 48: 89. E5
        sub     rsp, 16                                 ; 0008 _ 48: 83. EC, 10
        movsd   qword [rbp-8H], xmm0                    ; 000C _ F2: 0F 11. 45, F8
        mov     dword [rbp-0CH], edi                    ; 0011 _ 89. 7D, F4
        mov     dword [rbp-10H], esi                    ; 0014 _ 89. 75, F0
        mov     rcx, qword [rbp-8H]                     ; 0017 _ 48: 8B. 4D, F8
        mov     edx, dword [rbp-10H]                    ; 001B _ 8B. 55, F0
        mov     eax, dword [rbp-0CH]                    ; 001E _ 8B. 45, F4
        movq    xmm0, rcx                               ; 0021 _ 66 48: 0F 6E. C1
        mov     esi, eax                                ; 0026 _ 89. C6
        lea     rax, [rel ?_005]                        ; 0028 _ 48: 8D. 05, 00000000(rel)
        mov     rdi, rax                                ; 002F _ 48: 89. C7
        mov     eax, 1                                  ; 0032 _ B8, 00000001
        call    printf                                  ; 0037 _ E8, 00000000(PLT r)
        nop                                             ; 003C _ 90
        leave                                           ; 003D _ C9
        ret                                             ; 003E _ C3
; print_float End of function

print_integer:; Function begin
        endbr64                                         ; 003F _ F3: 0F 1E. FA
        push    rbp                                     ; 0043 _ 55
        mov     rbp, rsp                                ; 0044 _ 48: 89. E5
        sub     rsp, 16                                 ; 0047 _ 48: 83. EC, 10
        mov     dword [rbp-4H], edi                     ; 004B _ 89. 7D, FC
        mov     eax, dword [rbp-4H]                     ; 004E _ 8B. 45, FC
        mov     esi, eax                                ; 0051 _ 89. C6
        lea     rax, [rel ?_006]                        ; 0053 _ 48: 8D. 05, 00000000(rel)
        mov     rdi, rax                                ; 005A _ 48: 89. C7
        mov     eax, 0                                  ; 005D _ B8, 00000000
        call    printf                                  ; 0062 _ E8, 00000000(PLT r)
        nop                                             ; 0067 _ 90
        leave                                           ; 0068 _ C9
        ret                                             ; 0069 _ C3
; print_integer End of function

print_bigint:; Function begin
        endbr64                                         ; 006A _ F3: 0F 1E. FA
        push    rbp                                     ; 006E _ 55
        mov     rbp, rsp                                ; 006F _ 48: 89. E5
        sub     rsp, 16                                 ; 0072 _ 48: 83. EC, 10
        mov     qword [rbp-8H], rdi                     ; 0076 _ 48: 89. 7D, F8
        mov     rax, qword [rbp-8H]                     ; 007A _ 48: 8B. 45, F8
        mov     rsi, rax                                ; 007E _ 48: 89. C6
        lea     rax, [rel ?_007]                        ; 0081 _ 48: 8D. 05, 00000000(rel)
        mov     rdi, rax                                ; 0088 _ 48: 89. C7
        mov     eax, 0                                  ; 008B _ B8, 00000000
        call    printf                                  ; 0090 _ E8, 00000000(PLT r)
        nop                                             ; 0095 _ 90
        leave                                           ; 0096 _ C9
        ret                                             ; 0097 _ C3
; print_bigint End of function

print_string:; Function begin
        endbr64                                         ; 0098 _ F3: 0F 1E. FA
        push    rbp                                     ; 009C _ 55
        mov     rbp, rsp                                ; 009D _ 48: 89. E5
        sub     rsp, 16                                 ; 00A0 _ 48: 83. EC, 10
        mov     qword [rbp-8H], rdi                     ; 00A4 _ 48: 89. 7D, F8
        mov     rax, qword [rbp-8H]                     ; 00A8 _ 48: 8B. 45, F8
        mov     rsi, rax                                ; 00AC _ 48: 89. C6
        lea     rax, [rel ?_008]                        ; 00AF _ 48: 8D. 05, 00000000(rel)
        mov     rdi, rax                                ; 00B6 _ 48: 89. C7
        mov     eax, 0                                  ; 00B9 _ B8, 00000000
        call    printf                                  ; 00BE _ E8, 00000000(PLT r)
        nop                                             ; 00C3 _ 90
        leave                                           ; 00C4 _ C9
        ret                                             ; 00C5 _ C3
; print_string End of function

print_bool:; Function begin
        endbr64                                         ; 00C6 _ F3: 0F 1E. FA
        push    rbp                                     ; 00CA _ 55
        mov     rbp, rsp                                ; 00CB _ 48: 89. E5
        sub     rsp, 16                                 ; 00CE _ 48: 83. EC, 10
        mov     dword [rbp-4H], edi                     ; 00D2 _ 89. 7D, FC
        cmp     dword [rbp-4H], 0                       ; 00D5 _ 83. 7D, FC, 00
        jz      ?_001                                   ; 00D9 _ 74, 09
        lea     rax, [rel ?_009]                        ; 00DB _ 48: 8D. 05, 00000000(rel)
        jmp     ?_002                                   ; 00E2 _ EB, 07

?_001:  lea     rax, [rel ?_010]                        ; 00E4 _ 48: 8D. 05, 00000000(rel)
?_002:  mov     rsi, rax                                ; 00EB _ 48: 89. C6
        lea     rax, [rel ?_008]                        ; 00EE _ 48: 8D. 05, 00000000(rel)
        mov     rdi, rax                                ; 00F5 _ 48: 89. C7
        mov     eax, 0                                  ; 00F8 _ B8, 00000000
        call    printf                                  ; 00FD _ E8, 00000000(PLT r)
        nop                                             ; 0102 _ 90
        leave                                           ; 0103 _ C9
        ret                                             ; 0104 _ C3
; print_bool End of function

print_space:; Function begin
        endbr64                                         ; 0105 _ F3: 0F 1E. FA
        push    rbp                                     ; 0109 _ 55
        mov     rbp, rsp                                ; 010A _ 48: 89. E5
        sub     rsp, 32                                 ; 010D _ 48: 83. EC, 20
        mov     dword [rbp-14H], edi                    ; 0111 _ 89. 7D, EC
        mov     dword [rbp-4H], 0                       ; 0114 _ C7. 45, FC, 00000000
        jmp     ?_004                                   ; 011B _ EB, 0E

?_003:  mov     edi, 32                                 ; 011D _ BF, 00000020
        call    putchar                                 ; 0122 _ E8, 00000000(PLT r)
        add     dword [rbp-4H], 1                       ; 0127 _ 83. 45, FC, 01
?_004:  mov     eax, dword [rbp-4H]                     ; 012B _ 8B. 45, FC
        cmp     eax, dword [rbp-14H]                    ; 012E _ 3B. 45, EC
        jl      ?_003                                   ; 0131 _ 7C, EA
        nop                                             ; 0133 _ 90
        nop                                             ; 0134 _ 90
        leave                                           ; 0135 _ C9
        ret                                             ; 0136 _ C3
; print_space End of function

print_newline:; Function begin
        endbr64                                         ; 0137 _ F3: 0F 1E. FA
        push    rbp                                     ; 013B _ 55
        mov     rbp, rsp                                ; 013C _ 48: 89. E5
        mov     rax, qword [rel new_line]               ; 013F _ 48: 8B. 05, 00000000(rel)
        mov     rsi, rax                                ; 0146 _ 48: 89. C6
        lea     rax, [rel ?_008]                        ; 0149 _ 48: 8D. 05, 00000000(rel)
        mov     rdi, rax                                ; 0150 _ 48: 89. C7
        mov     eax, 0                                  ; 0153 _ B8, 00000000
        call    printf                                  ; 0158 _ E8, 00000000(PLT r)
        nop                                             ; 015D _ 90
        pop     rbp                                     ; 015E _ 5D
        ret                                             ; 015F _ C3
; print_newline End of function


SECTION .data   align=1 noexecute                       ; section number 2, data


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=1 noexecute                       ; section number 4, const

        db 0AH, 00H                                     ; 0000 _ ..

?_005:                                                  ; byte
        db 25H, 2AH, 2EH, 2AH, 66H, 00H                 ; 0002 _ %*.*f.

?_006:                                                  ; byte
        db 25H, 64H, 00H                                ; 0008 _ %d.

?_007:                                                  ; byte
        db 25H, 6CH, 64H, 00H                           ; 000B _ %ld.

?_008:                                                  ; byte
        db 25H, 73H, 00H                                ; 000F _ %s.

?_009:                                                  ; byte
        db 74H, 72H, 75H, 65H, 00H                      ; 0012 _ true.

?_010:                                                  ; byte
        db 66H, 61H, 6CH, 73H, 65H, 00H                 ; 0017 _ false.


SECTION .data.rel.local align=8 noexecute               ; section number 5, data

new_line: dq Unnamed_4_0                                ; 0000 _ 0000000000000000 (d)


SECTION .note.gnu.property align=8 noexecute            ; section number 6, const

        db 04H, 00H, 00H, 00H, 10H, 00H, 00H, 00H       ; 0000 _ ........
        db 05H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H       ; 0008 _ ....GNU.
        db 02H, 00H, 00H, 0C0H, 04H, 00H, 00H, 00H      ; 0010 _ ........
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0018 _ ........


