; Disassembly of file: bin/main.o
; Mon Apr  7 18:03:16 2025
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: SSE2, x64

default rel

global test_trace: function
global main: function
global A
global B

extern lt_double                                        ; near
extern lt_int                                           ; near
extern lt_long                                          ; near
extern printf                                           ; near
extern mul_double                                       ; near
extern mul_int                                          ; near
extern mul_long                                         ; near
extern trace                                            ; near


SECTION .text   align=16 execute                        ; section number 1, code

test_trace:; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        sub     rsp, 48                                 ; 0004 _ 48: 83. EC, 30
        mov     rax, qword 1234567890H                  ; 0008 _ 48: B8, 0000001234567890
        mov     qword [rbp-8H], rax                     ; 0012 _ 48: 89. 45, F8
        mov     rax, qword [rbp-8H]                     ; 0016 _ 48: 8B. 45, F8
        mov     r10, rax                                ; 001A _ 49: 89. C2
        mov     eax, 2                                  ; 001D _ B8, 00000002
        mov     r11, rax                                ; 0022 _ 49: 89. C3
        mov     al, 0                                   ; 0025 _ B0, 00
        call    trace                                   ; 0027 _ E8, 00000000(PLT r)
        mov     rax, qword 1234567890H                  ; 002C _ 48: B8, 0000001234567890
        mov     qword [rbp-10H], rax                    ; 0036 _ 48: 89. 45, F0
        mov     rax, qword [rbp-10H]                    ; 003A _ 48: 8B. 45, F0
        mov     r10, rax                                ; 003E _ 49: 89. C2
        mov     eax, 1                                  ; 0041 _ B8, 00000001
        mov     r11, rax                                ; 0046 _ 49: 89. C3
        mov     al, 0                                   ; 0049 _ B0, 00
        call    trace                                   ; 004B _ E8, 00000000(PLT r)
        movsd   xmm0, qword [rel .LCPI0_0]              ; 0050 _ F2: 0F 10. 05, 00000000(rel)
        movsd   qword [rbp-18H], xmm0                   ; 0058 _ F2: 0F 11. 45, E8
        mov     rax, qword [rbp-18H]                    ; 005D _ 48: 8B. 45, E8
        mov     r10, rax                                ; 0061 _ 49: 89. C2
        mov     eax, 3                                  ; 0064 _ B8, 00000003
        mov     r11, rax                                ; 0069 _ 49: 89. C3
        mov     al, 0                                   ; 006C _ B0, 00
        call    trace                                   ; 006E _ E8, 00000000(PLT r)
        lea     rax, [rel .L.str]                       ; 0073 _ 48: 8D. 05, 00000000(rel)
        mov     qword [rbp-20H], rax                    ; 007A _ 48: 89. 45, E0
        mov     rax, qword [rbp-20H]                    ; 007E _ 48: 8B. 45, E0
        mov     r10, rax                                ; 0082 _ 49: 89. C2
        mov     eax, 4                                  ; 0085 _ B8, 00000004
        mov     r11, rax                                ; 008A _ 49: 89. C3
        mov     al, 0                                   ; 008D _ B0, 00
        call    trace                                   ; 008F _ E8, 00000000(PLT r)
        mov     qword [rbp-28H], 1                      ; 0094 _ 48: C7. 45, D8, 00000001
        mov     rax, qword [rbp-28H]                    ; 009C _ 48: 8B. 45, D8
        mov     r10, rax                                ; 00A0 _ 49: 89. C2
        mov     eax, 5                                  ; 00A3 _ B8, 00000005
        mov     r11, rax                                ; 00A8 _ 49: 89. C3
        mov     al, 0                                   ; 00AB _ B0, 00
        call    trace                                   ; 00AD _ E8, 00000000(PLT r)
        add     rsp, 48                                 ; 00B2 _ 48: 83. C4, 30
        pop     rbp                                     ; 00B6 _ 5D
        ret                                             ; 00B7 _ C3
; test_trace End of function

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

main:   ; Function begin
        push    rbp                                     ; 00C0 _ 55
        mov     rbp, rsp                                ; 00C1 _ 48: 89. E5
        sub     rsp, 48                                 ; 00C4 _ 48: 83. EC, 30
        mov     dword [rbp-4H], 0                       ; 00C8 _ C7. 45, FC, 00000000
        mov     edi, 2                                  ; 00CF _ BF, 00000002
        mov     esi, 3                                  ; 00D4 _ BE, 00000003
        mov     edx, 5                                  ; 00D9 _ BA, 00000005
        mov     ecx, 7                                  ; 00DE _ B9, 00000007
        mov     r8d, 11                                 ; 00E3 _ 41: B8, 0000000B
        mov     r9d, 13                                 ; 00E9 _ 41: B9, 0000000D
        call    mul_long                                ; 00EF _ E8, 00000000(PLT r)
        mov     qword [rbp-10H], rax                    ; 00F4 _ 48: 89. 45, F0
        mov     edi, 2                                  ; 00F8 _ BF, 00000002
        mov     esi, 3                                  ; 00FD _ BE, 00000003
        mov     edx, 5                                  ; 0102 _ BA, 00000005
        mov     ecx, 7                                  ; 0107 _ B9, 00000007
        mov     r8d, 11                                 ; 010C _ 41: B8, 0000000B
        mov     r9d, 13                                 ; 0112 _ 41: B9, 0000000D
        call    mul_int                                 ; 0118 _ E8, 00000000(PLT r)
        mov     dword [rbp-14H], eax                    ; 011D _ 89. 45, EC
        movsd   xmm0, qword [rel .LCPI1_1]              ; 0120 _ F2: 0F 10. 05, 00000000(rel)
        movsd   xmm1, qword [rel .LCPI1_2]              ; 0128 _ F2: 0F 10. 0D, 00000000(rel)
        movsd   xmm2, qword [rel .LCPI1_3]              ; 0130 _ F2: 0F 10. 15, 00000000(rel)
        movsd   xmm3, qword [rel .LCPI1_4]              ; 0138 _ F2: 0F 10. 1D, 00000000(rel)
        movsd   xmm4, qword [rel .LCPI1_5]              ; 0140 _ F2: 0F 10. 25, 00000000(rel)
        movsd   xmm5, qword [rel .LCPI1_6]              ; 0148 _ F2: 0F 10. 2D, 00000000(rel)
        call    mul_double                              ; 0150 _ E8, 00000000(PLT r)
        movsd   qword [rbp-20H], xmm0                   ; 0155 _ F2: 0F 11. 45, E0
        mov     rsi, qword [rbp-10H]                    ; 015A _ 48: 8B. 75, F0
        lea     rdi, [rel .L.str.1]                     ; 015E _ 48: 8D. 3D, 00000000(rel)
        mov     al, 0                                   ; 0165 _ B0, 00
        call    printf                                  ; 0167 _ E8, 00000000(PLT r)
        mov     esi, dword [rbp-14H]                    ; 016C _ 8B. 75, EC
        lea     rdi, [rel .L.str.2]                     ; 016F _ 48: 8D. 3D, 00000000(rel)
        mov     al, 0                                   ; 0176 _ B0, 00
        call    printf                                  ; 0178 _ E8, 00000000(PLT r)
        movsd   xmm0, qword [rbp-20H]                   ; 017D _ F2: 0F 10. 45, E0
        lea     rdi, [rel .L.str.3]                     ; 0182 _ 48: 8D. 3D, 00000000(rel)
        mov     al, 1                                   ; 0189 _ B0, 01
        call    printf                                  ; 018B _ E8, 00000000(PLT r)
        mov     edi, 1                                  ; 0190 _ BF, 00000001
        mov     esi, 2                                  ; 0195 _ BE, 00000002
        call    lt_long                                 ; 019A _ E8, 00000000(PLT r)
        mov     dword [rbp-24H], eax                    ; 019F _ 89. 45, DC
        mov     edi, 1                                  ; 01A2 _ BF, 00000001
        mov     esi, 2                                  ; 01A7 _ BE, 00000002
        call    lt_int                                  ; 01AC _ E8, 00000000(PLT r)
        mov     dword [rbp-28H], eax                    ; 01B1 _ 89. 45, D8
        movsd   xmm0, qword [rel .LCPI1_0]              ; 01B4 _ F2: 0F 10. 05, 00000000(rel)
        movsd   xmm1, qword [rel .LCPI1_1]              ; 01BC _ F2: 0F 10. 0D, 00000000(rel)
        call    lt_double                               ; 01C4 _ E8, 00000000(PLT r)
        mov     dword [rbp-2CH], eax                    ; 01C9 _ 89. 45, D4
        mov     esi, dword [rbp-24H]                    ; 01CC _ 8B. 75, DC
        lea     rdi, [rel .L.str.4]                     ; 01CF _ 48: 8D. 3D, 00000000(rel)
        mov     al, 0                                   ; 01D6 _ B0, 00
        call    printf                                  ; 01D8 _ E8, 00000000(PLT r)
        mov     esi, dword [rbp-28H]                    ; 01DD _ 8B. 75, D8
        lea     rdi, [rel .L.str.5]                     ; 01E0 _ 48: 8D. 3D, 00000000(rel)
        mov     al, 0                                   ; 01E7 _ B0, 00
        call    printf                                  ; 01E9 _ E8, 00000000(PLT r)
        mov     esi, dword [rbp-2CH]                    ; 01EE _ 8B. 75, D4
        lea     rdi, [rel .L.str.6]                     ; 01F1 _ 48: 8D. 3D, 00000000(rel)
        mov     al, 0                                   ; 01F8 _ B0, 00
        call    printf                                  ; 01FA _ E8, 00000000(PLT r)
        xor     eax, eax                                ; 01FF _ 31. C0
        add     rsp, 48                                 ; 0201 _ 48: 83. C4, 30
        pop     rbp                                     ; 0205 _ 5D
        ret                                             ; 0206 _ C3
; main End of function


SECTION .rodata.cst8 align=8 noexecute                  ; section number 2, const

.LCPI0_0: dq 400921D9F4D37C13H                          ; 0000 _ 3.141529 

.LCPI1_0: dq 3FF0000000000000H                          ; 0008 _ 1.0 

.LCPI1_1: dq 4000000000000000H                          ; 0010 _ 2.0 

.LCPI1_2: dq 4008000000000000H                          ; 0018 _ 3.0 

.LCPI1_3: dq 4014000000000000H                          ; 0020 _ 5.0 

.LCPI1_4: dq 401C000000000000H                          ; 0028 _ 7.0 

.LCPI1_5: dq 4026000000000000H                          ; 0030 _ 11.0 

.LCPI1_6: dq 402A000000000000H                          ; 0038 _ 13.0 


SECTION .data   align=8 noexecute                       ; section number 3, data

A:      dq 400921D9F4D37C13H                            ; 0000 _ 400921D9F4D37C13 

B:      dq .L.str                                       ; 0008 _ 0000000000000000 (d)


SECTION .rodata.str1.1 align=1 noexecute                ; section number 4, const

.L.str:                                                 ; byte
        db 6CH, 6FH, 72H, 65H, 6DH, 20H, 69H, 70H       ; 0000 _ lorem ip
        db 73H, 75H, 6DH, 00H                           ; 0008 _ sum.

.L.str.1:                                               ; byte
        db 50H, 72H, 6FH, 64H, 75H, 63H, 74H, 20H       ; 000C _ Product 
        db 6FH, 66H, 20H, 6CH, 6FH, 6EH, 67H, 73H       ; 0014 _ of longs
        db 3AH, 20H, 25H, 6CH, 64H, 0AH, 00H            ; 001C _ : %ld..

.L.str.2:                                               ; byte
        db 50H, 72H, 6FH, 64H, 75H, 63H, 74H, 20H       ; 0023 _ Product 
        db 6FH, 66H, 20H, 69H, 6EH, 74H, 73H, 3AH       ; 002B _ of ints:
        db 20H, 25H, 64H, 0AH, 00H                      ; 0033 _  %d..

.L.str.3:                                               ; byte
        db 50H, 72H, 6FH, 64H, 75H, 63H, 74H, 20H       ; 0038 _ Product 
        db 6FH, 66H, 20H, 64H, 6FH, 75H, 62H, 6CH       ; 0040 _ of doubl
        db 65H, 73H, 3AH, 20H, 25H, 66H, 0AH, 00H       ; 0048 _ es: %f..

.L.str.4:                                               ; byte
        db 4CH, 6FH, 6EH, 67H, 20H, 63H, 6FH, 6DH       ; 0050 _ Long com
        db 70H, 61H, 72H, 65H, 3AH, 20H, 25H, 64H       ; 0058 _ pare: %d
        db 0AH, 00H                                     ; 0060 _ ..

.L.str.5:                                               ; byte
        db 49H, 6EH, 74H, 20H, 63H, 6FH, 6DH, 70H       ; 0062 _ Int comp
        db 61H, 72H, 65H, 3AH, 20H, 25H, 64H, 0AH       ; 006A _ are: %d.
        db 00H                                          ; 0072 _ .

.L.str.6:                                               ; byte
        db 44H, 6FH, 75H, 62H, 6CH, 65H, 20H, 63H       ; 0073 _ Double c
        db 6FH, 6DH, 70H, 61H, 72H, 65H, 3AH, 20H       ; 007B _ ompare: 
        db 25H, 64H, 0AH, 00H                           ; 0083 _ %d..


