; Disassembly of file: bin/numeric.o
; Tue Apr  1 17:17:28 2025
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: SSE2, x64

default rel

global sum_long: function
global sum_int: function
global sum_double: function
global mul_long: function
global mul_int: function
global mul_double: function
global clear_int_param_registers: function


SECTION .text   align=16 execute                        ; section number 1, code

sum_long:; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        mov     qword [rbp-8H], rdi                     ; 0004 _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 0008 _ 48: 89. 75, F0
        mov     qword [rbp-18H], rdx                    ; 000C _ 48: 89. 55, E8
        mov     qword [rbp-20H], rcx                    ; 0010 _ 48: 89. 4D, E0
        mov     qword [rbp-28H], r8                     ; 0014 _ 4C: 89. 45, D8
        mov     qword [rbp-30H], r9                     ; 0018 _ 4C: 89. 4D, D0
        mov     rax, qword [rbp-8H]                     ; 001C _ 48: 8B. 45, F8
        add     rax, qword [rbp-10H]                    ; 0020 _ 48: 03. 45, F0
        add     rax, qword [rbp-18H]                    ; 0024 _ 48: 03. 45, E8
        add     rax, qword [rbp-20H]                    ; 0028 _ 48: 03. 45, E0
        add     rax, qword [rbp-28H]                    ; 002C _ 48: 03. 45, D8
        add     rax, qword [rbp-30H]                    ; 0030 _ 48: 03. 45, D0
        mov     qword [rbp-38H], rax                    ; 0034 _ 48: 89. 45, C8
        mov     rax, qword [rbp-38H]                    ; 0038 _ 48: 8B. 45, C8
        pop     rbp                                     ; 003C _ 5D
        ret                                             ; 003D _ C3
; sum_long End of function

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

sum_int:; Function begin
        push    rbp                                     ; 0040 _ 55
        mov     rbp, rsp                                ; 0041 _ 48: 89. E5
        mov     dword [rbp-4H], edi                     ; 0044 _ 89. 7D, FC
        mov     dword [rbp-8H], esi                     ; 0047 _ 89. 75, F8
        mov     dword [rbp-0CH], edx                    ; 004A _ 89. 55, F4
        mov     dword [rbp-10H], ecx                    ; 004D _ 89. 4D, F0
        mov     dword [rbp-14H], r8d                    ; 0050 _ 44: 89. 45, EC
        mov     dword [rbp-18H], r9d                    ; 0054 _ 44: 89. 4D, E8
        mov     eax, dword [rbp-4H]                     ; 0058 _ 8B. 45, FC
        add     eax, dword [rbp-8H]                     ; 005B _ 03. 45, F8
        add     eax, dword [rbp-0CH]                    ; 005E _ 03. 45, F4
        add     eax, dword [rbp-10H]                    ; 0061 _ 03. 45, F0
        add     eax, dword [rbp-14H]                    ; 0064 _ 03. 45, EC
        add     eax, dword [rbp-18H]                    ; 0067 _ 03. 45, E8
        mov     dword [rbp-1CH], eax                    ; 006A _ 89. 45, E4
        mov     eax, dword [rbp-1CH]                    ; 006D _ 8B. 45, E4
        pop     rbp                                     ; 0070 _ 5D
        ret                                             ; 0071 _ C3
; sum_int End of function

; Filling space: 0EH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 66H, 2EH, 0FH, 1FH
;       db 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

sum_double:; Function begin
        push    rbp                                     ; 0080 _ 55
        mov     rbp, rsp                                ; 0081 _ 48: 89. E5
        movsd   qword [rbp-8H], xmm0                    ; 0084 _ F2: 0F 11. 45, F8
        movsd   qword [rbp-10H], xmm1                   ; 0089 _ F2: 0F 11. 4D, F0
        movsd   qword [rbp-18H], xmm2                   ; 008E _ F2: 0F 11. 55, E8
        movsd   qword [rbp-20H], xmm3                   ; 0093 _ F2: 0F 11. 5D, E0
        movsd   qword [rbp-28H], xmm4                   ; 0098 _ F2: 0F 11. 65, D8
        movsd   qword [rbp-30H], xmm5                   ; 009D _ F2: 0F 11. 6D, D0
        movsd   xmm0, qword [rbp-8H]                    ; 00A2 _ F2: 0F 10. 45, F8
        addsd   xmm0, qword [rbp-10H]                   ; 00A7 _ F2: 0F 58. 45, F0
        addsd   xmm0, qword [rbp-18H]                   ; 00AC _ F2: 0F 58. 45, E8
        addsd   xmm0, qword [rbp-20H]                   ; 00B1 _ F2: 0F 58. 45, E0
        addsd   xmm0, qword [rbp-28H]                   ; 00B6 _ F2: 0F 58. 45, D8
        addsd   xmm0, qword [rbp-30H]                   ; 00BB _ F2: 0F 58. 45, D0
        movsd   qword [rbp-38H], xmm0                   ; 00C0 _ F2: 0F 11. 45, C8
        movq    rax, xmm0                               ; 00C5 _ 66 48: 0F 7E. C0
        movsd   xmm0, qword [rbp-38H]                   ; 00CA _ F2: 0F 10. 45, C8
        pop     rbp                                     ; 00CF _ 5D
        ret                                             ; 00D0 _ C3
; sum_double End of function

; Filling space: 0FH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 66H, 66H, 2EH, 0FH
;       db 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

mul_long:; Function begin
        push    rbp                                     ; 00E0 _ 55
        mov     rbp, rsp                                ; 00E1 _ 48: 89. E5
        mov     qword [rbp-8H], rdi                     ; 00E4 _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 00E8 _ 48: 89. 75, F0
        mov     qword [rbp-18H], rdx                    ; 00EC _ 48: 89. 55, E8
        mov     qword [rbp-20H], rcx                    ; 00F0 _ 48: 89. 4D, E0
        mov     qword [rbp-28H], r8                     ; 00F4 _ 4C: 89. 45, D8
        mov     qword [rbp-30H], r9                     ; 00F8 _ 4C: 89. 4D, D0
        mov     rax, qword [rbp-8H]                     ; 00FC _ 48: 8B. 45, F8
        imul    rax, qword [rbp-10H]                    ; 0100 _ 48: 0F AF. 45, F0
        imul    rax, qword [rbp-18H]                    ; 0105 _ 48: 0F AF. 45, E8
        imul    rax, qword [rbp-20H]                    ; 010A _ 48: 0F AF. 45, E0
        imul    rax, qword [rbp-28H]                    ; 010F _ 48: 0F AF. 45, D8
        imul    rax, qword [rbp-30H]                    ; 0114 _ 48: 0F AF. 45, D0
        mov     qword [rbp-38H], rax                    ; 0119 _ 48: 89. 45, C8
        mov     rax, qword [rbp-38H]                    ; 011D _ 48: 8B. 45, C8
        pop     rbp                                     ; 0121 _ 5D
        ret                                             ; 0122 _ C3
; mul_long End of function

; Filling space: 0DH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 2EH, 0FH, 1FH, 84H
;       db 00H, 00H, 00H, 00H, 00H

ALIGN   16

mul_int:; Function begin
        push    rbp                                     ; 0130 _ 55
        mov     rbp, rsp                                ; 0131 _ 48: 89. E5
        mov     dword [rbp-4H], edi                     ; 0134 _ 89. 7D, FC
        mov     dword [rbp-8H], esi                     ; 0137 _ 89. 75, F8
        mov     dword [rbp-0CH], edx                    ; 013A _ 89. 55, F4
        mov     dword [rbp-10H], ecx                    ; 013D _ 89. 4D, F0
        mov     dword [rbp-14H], r8d                    ; 0140 _ 44: 89. 45, EC
        mov     dword [rbp-18H], r9d                    ; 0144 _ 44: 89. 4D, E8
        mov     eax, dword [rbp-4H]                     ; 0148 _ 8B. 45, FC
        imul    eax, dword [rbp-8H]                     ; 014B _ 0F AF. 45, F8
        imul    eax, dword [rbp-0CH]                    ; 014F _ 0F AF. 45, F4
        imul    eax, dword [rbp-10H]                    ; 0153 _ 0F AF. 45, F0
        imul    eax, dword [rbp-14H]                    ; 0157 _ 0F AF. 45, EC
        imul    eax, dword [rbp-18H]                    ; 015B _ 0F AF. 45, E8
        mov     dword [rbp-1CH], eax                    ; 015F _ 89. 45, E4
        mov     eax, dword [rbp-1CH]                    ; 0162 _ 8B. 45, E4
        pop     rbp                                     ; 0165 _ 5D
        ret                                             ; 0166 _ C3
; mul_int End of function

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16

mul_double:; Function begin
        push    rbp                                     ; 0170 _ 55
        mov     rbp, rsp                                ; 0171 _ 48: 89. E5
        movsd   qword [rbp-8H], xmm0                    ; 0174 _ F2: 0F 11. 45, F8
        movsd   qword [rbp-10H], xmm1                   ; 0179 _ F2: 0F 11. 4D, F0
        movsd   qword [rbp-18H], xmm2                   ; 017E _ F2: 0F 11. 55, E8
        movsd   qword [rbp-20H], xmm3                   ; 0183 _ F2: 0F 11. 5D, E0
        movsd   qword [rbp-28H], xmm4                   ; 0188 _ F2: 0F 11. 65, D8
        movsd   qword [rbp-30H], xmm5                   ; 018D _ F2: 0F 11. 6D, D0
        movsd   xmm0, qword [rbp-8H]                    ; 0192 _ F2: 0F 10. 45, F8
        mulsd   xmm0, qword [rbp-10H]                   ; 0197 _ F2: 0F 59. 45, F0
        mulsd   xmm0, qword [rbp-18H]                   ; 019C _ F2: 0F 59. 45, E8
        mulsd   xmm0, qword [rbp-20H]                   ; 01A1 _ F2: 0F 59. 45, E0
        mulsd   xmm0, qword [rbp-28H]                   ; 01A6 _ F2: 0F 59. 45, D8
        mulsd   xmm0, qword [rbp-30H]                   ; 01AB _ F2: 0F 59. 45, D0
        movsd   qword [rbp-38H], xmm0                   ; 01B0 _ F2: 0F 11. 45, C8
        movq    rax, xmm0                               ; 01B5 _ 66 48: 0F 7E. C0
        movsd   xmm0, qword [rbp-38H]                   ; 01BA _ F2: 0F 10. 45, C8
        pop     rbp                                     ; 01BF _ 5D
        ret                                             ; 01C0 _ C3
; mul_double End of function

; Filling space: 0FH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 66H, 66H, 2EH, 0FH
;       db 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

clear_int_param_registers:; Function begin
        push    rbp                                     ; 01D0 _ 55
        mov     rbp, rsp                                ; 01D1 _ 48: 89. E5
        xor     rdi, rdi                                ; 01D4 _ 48: 31. FF
        xor     rsi, rsi                                ; 01D7 _ 48: 31. F6
        xor     rdx, rdx                                ; 01DA _ 48: 31. D2
        xor     rcx, rcx                                ; 01DD _ 48: 31. C9
        xor     r8, r8                                  ; 01E0 _ 4D: 31. C0
        xor     r9, r9                                  ; 01E3 _ 4D: 31. C9
        pop     rbp                                     ; 01E6 _ 5D
        ret                                             ; 01E7 _ C3
; clear_int_param_registers End of function


