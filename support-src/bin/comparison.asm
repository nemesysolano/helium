; Disassembly of file: bin/comparison.o
; Mon Apr  7 18:03:21 2025
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: SSE2, x64

default rel

global lt_long: function
global lt_int: function
global lt_double: function
global gt_long: function
global gt_int: function
global gt_double: function
global ne_long: function
global ne_int: function
global ne_double: function
global eq_double: function
global eq_long: function
global eq_int: function
global trucate: function

extern trunc                                            ; near
extern pow                                              ; near


SECTION .text   align=16 execute                        ; section number 1, code

lt_long:; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        mov     qword [rbp-8H], rdi                     ; 0004 _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 0008 _ 48: 89. 75, F0
        mov     rax, qword [rbp-8H]                     ; 000C _ 48: 8B. 45, F8
        cmp     rax, qword [rbp-10H]                    ; 0010 _ 48: 3B. 45, F0
        setl    al                                      ; 0014 _ 0F 9C. C0
        and     al, 01H                                 ; 0017 _ 24, 01
        movzx   eax, al                                 ; 0019 _ 0F B6. C0
        pop     rbp                                     ; 001C _ 5D
        ret                                             ; 001D _ C3
; lt_long End of function

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

lt_int: ; Function begin
        push    rbp                                     ; 0020 _ 55
        mov     rbp, rsp                                ; 0021 _ 48: 89. E5
        mov     dword [rbp-4H], edi                     ; 0024 _ 89. 7D, FC
        mov     dword [rbp-8H], esi                     ; 0027 _ 89. 75, F8
        mov     eax, dword [rbp-4H]                     ; 002A _ 8B. 45, FC
        cmp     eax, dword [rbp-8H]                     ; 002D _ 3B. 45, F8
        setl    al                                      ; 0030 _ 0F 9C. C0
        and     al, 01H                                 ; 0033 _ 24, 01
        movzx   eax, al                                 ; 0035 _ 0F B6. C0
        pop     rbp                                     ; 0038 _ 5D
        ret                                             ; 0039 _ C3
; lt_int End of function

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

lt_double:; Function begin
        push    rbp                                     ; 0040 _ 55
        mov     rbp, rsp                                ; 0041 _ 48: 89. E5
        movsd   qword [rbp-8H], xmm0                    ; 0044 _ F2: 0F 11. 45, F8
        movsd   qword [rbp-10H], xmm1                   ; 0049 _ F2: 0F 11. 4D, F0
        movsd   xmm1, qword [rbp-8H]                    ; 004E _ F2: 0F 10. 4D, F8
        movsd   xmm0, qword [rbp-10H]                   ; 0053 _ F2: 0F 10. 45, F0
        ucomisd xmm0, xmm1                              ; 0058 _ 66: 0F 2E. C1
        seta    al                                      ; 005C _ 0F 97. C0
        and     al, 01H                                 ; 005F _ 24, 01
        movzx   eax, al                                 ; 0061 _ 0F B6. C0
        pop     rbp                                     ; 0064 _ 5D
        ret                                             ; 0065 _ C3
; lt_double End of function

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16

gt_long:; Function begin
        push    rbp                                     ; 0070 _ 55
        mov     rbp, rsp                                ; 0071 _ 48: 89. E5
        mov     qword [rbp-8H], rdi                     ; 0074 _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 0078 _ 48: 89. 75, F0
        mov     rax, qword [rbp-8H]                     ; 007C _ 48: 8B. 45, F8
        cmp     rax, qword [rbp-10H]                    ; 0080 _ 48: 3B. 45, F0
        setg    al                                      ; 0084 _ 0F 9F. C0
        and     al, 01H                                 ; 0087 _ 24, 01
        movzx   eax, al                                 ; 0089 _ 0F B6. C0
        pop     rbp                                     ; 008C _ 5D
        ret                                             ; 008D _ C3
; gt_long End of function

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

gt_int: ; Function begin
        push    rbp                                     ; 0090 _ 55
        mov     rbp, rsp                                ; 0091 _ 48: 89. E5
        mov     dword [rbp-4H], edi                     ; 0094 _ 89. 7D, FC
        mov     dword [rbp-8H], esi                     ; 0097 _ 89. 75, F8
        mov     eax, dword [rbp-4H]                     ; 009A _ 8B. 45, FC
        cmp     eax, dword [rbp-8H]                     ; 009D _ 3B. 45, F8
        setg    al                                      ; 00A0 _ 0F 9F. C0
        and     al, 01H                                 ; 00A3 _ 24, 01
        movzx   eax, al                                 ; 00A5 _ 0F B6. C0
        pop     rbp                                     ; 00A8 _ 5D
        ret                                             ; 00A9 _ C3
; gt_int End of function

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

gt_double:; Function begin
        push    rbp                                     ; 00B0 _ 55
        mov     rbp, rsp                                ; 00B1 _ 48: 89. E5
        movsd   qword [rbp-8H], xmm0                    ; 00B4 _ F2: 0F 11. 45, F8
        movsd   qword [rbp-10H], xmm1                   ; 00B9 _ F2: 0F 11. 4D, F0
        movsd   xmm0, qword [rbp-8H]                    ; 00BE _ F2: 0F 10. 45, F8
        ucomisd xmm0, qword [rbp-10H]                   ; 00C3 _ 66: 0F 2E. 45, F0
        seta    al                                      ; 00C8 _ 0F 97. C0
        and     al, 01H                                 ; 00CB _ 24, 01
        movzx   eax, al                                 ; 00CD _ 0F B6. C0
        pop     rbp                                     ; 00D0 _ 5D
        ret                                             ; 00D1 _ C3
; gt_double End of function

; Filling space: 0EH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 66H, 2EH, 0FH, 1FH
;       db 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

ne_long:; Function begin
        push    rbp                                     ; 00E0 _ 55
        mov     rbp, rsp                                ; 00E1 _ 48: 89. E5
        mov     qword [rbp-8H], rdi                     ; 00E4 _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 00E8 _ 48: 89. 75, F0
        mov     rax, qword [rbp-8H]                     ; 00EC _ 48: 8B. 45, F8
        cmp     rax, qword [rbp-10H]                    ; 00F0 _ 48: 3B. 45, F0
        setne   al                                      ; 00F4 _ 0F 95. C0
        and     al, 01H                                 ; 00F7 _ 24, 01
        movzx   eax, al                                 ; 00F9 _ 0F B6. C0
        pop     rbp                                     ; 00FC _ 5D
        ret                                             ; 00FD _ C3
; ne_long End of function

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

ne_int: ; Function begin
        push    rbp                                     ; 0100 _ 55
        mov     rbp, rsp                                ; 0101 _ 48: 89. E5
        mov     dword [rbp-4H], edi                     ; 0104 _ 89. 7D, FC
        mov     dword [rbp-8H], esi                     ; 0107 _ 89. 75, F8
        mov     eax, dword [rbp-4H]                     ; 010A _ 8B. 45, FC
        cmp     eax, dword [rbp-8H]                     ; 010D _ 3B. 45, F8
        setne   al                                      ; 0110 _ 0F 95. C0
        and     al, 01H                                 ; 0113 _ 24, 01
        movzx   eax, al                                 ; 0115 _ 0F B6. C0
        pop     rbp                                     ; 0118 _ 5D
        ret                                             ; 0119 _ C3
; ne_int End of function

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

ne_double:; Function begin
        push    rbp                                     ; 0120 _ 55
        mov     rbp, rsp                                ; 0121 _ 48: 89. E5
        sub     rsp, 16                                 ; 0124 _ 48: 83. EC, 10
        movsd   qword [rbp-8H], xmm0                    ; 0128 _ F2: 0F 11. 45, F8
        movsd   qword [rbp-10H], xmm1                   ; 012D _ F2: 0F 11. 4D, F0
        movsd   xmm0, qword [rbp-8H]                    ; 0132 _ F2: 0F 10. 45, F8
        movsd   xmm1, qword [rbp-10H]                   ; 0137 _ F2: 0F 10. 4D, F0
        call    eq_double                               ; 013C _ E8, 00000000(PLT r)
        cmp     eax, 0                                  ; 0141 _ 83. F8, 00
        setne   al                                      ; 0144 _ 0F 95. C0
        xor     al, 0FFFFFFFFH                          ; 0147 _ 34, FF
        and     al, 01H                                 ; 0149 _ 24, 01
        movzx   eax, al                                 ; 014B _ 0F B6. C0
        add     rsp, 16                                 ; 014E _ 48: 83. C4, 10
        pop     rbp                                     ; 0152 _ 5D
        ret                                             ; 0153 _ C3
; ne_double End of function

; Filling space: 0CH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H
;       db 00H, 00H, 00H, 00H

ALIGN   16

eq_double:; Function begin
        push    rbp                                     ; 0160 _ 55
        mov     rbp, rsp                                ; 0161 _ 48: 89. E5
        movsd   qword [rbp-10H], xmm0                   ; 0164 _ F2: 0F 11. 45, F0
        movsd   qword [rbp-18H], xmm1                   ; 0169 _ F2: 0F 11. 4D, E8
        movsd   xmm0, qword [rbp-10H]                   ; 016E _ F2: 0F 10. 45, F0
        subsd   xmm0, qword [rbp-18H]                   ; 0173 _ F2: 0F 5C. 45, E8
        movaps  xmm1, oword [rel .LCPI9_1]              ; 0178 _ 0F 28. 0D, 00000000(rel)
        pand    xmm0, xmm1                              ; 017F _ 66: 0F DB. C1
        movsd   qword [rbp-20H], xmm0                   ; 0183 _ F2: 0F 11. 45, E0
        movsd   xmm0, qword [rel .LCPI9_0]              ; 0188 _ F2: 0F 10. 05, 00000000(rel)
        ucomisd xmm0, qword [rbp-20H]                   ; 0190 _ 66: 0F 2E. 45, E0
; Note: Immediate operand could be made smaller by sign extension
        jbe     ?_001                                   ; 0195 _ 0F 86, 0000000C
        mov     dword [rbp-4H], 1                       ; 019B _ C7. 45, FC, 00000001
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_002                                   ; 01A2 _ E9, 0000005E

?_001:  movsd   xmm1, qword [rbp-20H]                   ; 01A7 _ F2: 0F 10. 4D, E0
        movsd   xmm4, qword [rbp-10H]                   ; 01AC _ F2: 0F 10. 65, F0
        movaps  xmm0, oword [rel .LCPI9_1]              ; 01B1 _ 0F 28. 05, 00000000(rel)
        pand    xmm4, xmm0                              ; 01B8 _ 66: 0F DB. E0
        movsd   xmm3, qword [rbp-18H]                   ; 01BC _ F2: 0F 10. 5D, E8
        movaps  xmm0, oword [rel .LCPI9_1]              ; 01C1 _ 0F 28. 05, 00000000(rel)
        pand    xmm3, xmm0                              ; 01C8 _ 66: 0F DB. D8
        movaps  xmm5, xmm3                              ; 01CC _ 0F 28. EB
        movaps  xmm2, xmm4                              ; 01CF _ 0F 28. D4
        cmpunordsd xmm2, xmm2                           ; 01D2 _ F2: 0F C2. D2, 03
        movaps  xmm0, xmm2                              ; 01D7 _ 0F 28. C2
        pand    xmm0, xmm5                              ; 01DA _ 66: 0F DB. C5
        minsd   xmm3, xmm4                              ; 01DE _ F2: 0F 5D. DC
        pandn   xmm2, xmm3                              ; 01E2 _ 66: 0F DF. D3
        por     xmm2, xmm0                              ; 01E6 _ 66: 0F EB. D0
        movsd   xmm0, qword [rel .LCPI9_0]              ; 01EA _ F2: 0F 10. 05, 00000000(rel)
        mulsd   xmm0, xmm2                              ; 01F2 _ F2: 0F 59. C2
        ucomisd xmm0, xmm1                              ; 01F6 _ 66: 0F 2E. C1
        seta    al                                      ; 01FA _ 0F 97. C0
        and     al, 01H                                 ; 01FD _ 24, 01
        movzx   eax, al                                 ; 01FF _ 0F B6. C0
        mov     dword [rbp-4H], eax                     ; 0202 _ 89. 45, FC
?_002:  mov     eax, dword [rbp-4H]                     ; 0205 _ 8B. 45, FC
        pop     rbp                                     ; 0208 _ 5D
        ret                                             ; 0209 _ C3
; eq_double End of function

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

eq_long:; Function begin
        push    rbp                                     ; 0210 _ 55
        mov     rbp, rsp                                ; 0211 _ 48: 89. E5
        mov     qword [rbp-8H], rdi                     ; 0214 _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 0218 _ 48: 89. 75, F0
        mov     rax, qword [rbp-8H]                     ; 021C _ 48: 8B. 45, F8
        cmp     rax, qword [rbp-10H]                    ; 0220 _ 48: 3B. 45, F0
        sete    al                                      ; 0224 _ 0F 94. C0
        and     al, 01H                                 ; 0227 _ 24, 01
        movzx   eax, al                                 ; 0229 _ 0F B6. C0
        pop     rbp                                     ; 022C _ 5D
        ret                                             ; 022D _ C3
; eq_long End of function

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

eq_int: ; Function begin
        push    rbp                                     ; 0230 _ 55
        mov     rbp, rsp                                ; 0231 _ 48: 89. E5
        mov     dword [rbp-4H], edi                     ; 0234 _ 89. 7D, FC
        mov     dword [rbp-8H], esi                     ; 0237 _ 89. 75, F8
        mov     eax, dword [rbp-4H]                     ; 023A _ 8B. 45, FC
        cmp     eax, dword [rbp-8H]                     ; 023D _ 3B. 45, F8
        sete    al                                      ; 0240 _ 0F 94. C0
        and     al, 01H                                 ; 0243 _ 24, 01
        movzx   eax, al                                 ; 0245 _ 0F B6. C0
        pop     rbp                                     ; 0248 _ 5D
        ret                                             ; 0249 _ C3
; eq_int End of function

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

trucate:; Function begin
        push    rbp                                     ; 0250 _ 55
        mov     rbp, rsp                                ; 0251 _ 48: 89. E5
        sub     rsp, 32                                 ; 0254 _ 48: 83. EC, 20
        movsd   qword [rbp-8H], xmm0                    ; 0258 _ F2: 0F 11. 45, F8
        mov     dword [rbp-0CH], edi                    ; 025D _ 89. 7D, F4
        cmp     dword [rbp-0CH], 2                      ; 0260 _ 83. 7D, F4, 02
; Note: Immediate operand could be made smaller by sign extension
        jge     ?_003                                   ; 0264 _ 0F 8D, 0000000C
        mov     dword [rbp-10H], 2                      ; 026A _ C7. 45, F0, 00000002
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_006                                   ; 0271 _ E9, 00000021

?_003:  cmp     dword [rbp-0CH], 12                     ; 0276 _ 83. 7D, F4, 0C
; Note: Immediate operand could be made smaller by sign extension
        jle     ?_004                                   ; 027A _ 0F 8E, 0000000C
        mov     dword [rbp-10H], 12                     ; 0280 _ C7. 45, F0, 0000000C
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_005                                   ; 0287 _ E9, 00000006

?_004:  mov     eax, dword [rbp-0CH]                    ; 028C _ 8B. 45, F4
        mov     dword [rbp-10H], eax                    ; 028F _ 89. 45, F0
?_005:
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_006                                   ; 0292 _ E9, 00000000
; trucate End of function

?_006:  ; Local function
        cvtsi2sd xmm1, dword [rbp-10H]                  ; 0297 _ F2: 0F 2A. 4D, F0
        movsd   xmm0, qword [rel .LCPI12_1]             ; 029C _ F2: 0F 10. 05, 00000000(rel)
        mulsd   xmm1, xmm0                              ; 02A4 _ F2: 0F 59. C8
        movsd   xmm0, qword [rel .LCPI12_0]             ; 02A8 _ F2: 0F 10. 05, 00000000(rel)
        call    pow                                     ; 02B0 _ E8, 00000000(PLT r)
        movsd   qword [rbp-18H], xmm0                   ; 02B5 _ F2: 0F 11. 45, E8
        movsd   xmm0, qword [rbp-8H]                    ; 02BA _ F2: 0F 10. 45, F8
        mulsd   xmm0, qword [rbp-18H]                   ; 02BF _ F2: 0F 59. 45, E8
        call    trunc                                   ; 02C4 _ E8, 00000000(PLT r)
        divsd   xmm0, qword [rbp-18H]                   ; 02C9 _ F2: 0F 5E. 45, E8
        add     rsp, 32                                 ; 02CE _ 48: 83. C4, 20
        pop     rbp                                     ; 02D2 _ 5D
        ret                                             ; 02D3 _ C3


SECTION .rodata.cst8 align=8 noexecute                  ; section number 2, const

.LCPI9_0: dq 3E112E0BE826D695H                          ; 0000 _ 1E-09 

.LCPI12_0:                                              ; qword
        dq 4024000000000000H                            ; 0008 _ 10.0 

.LCPI12_1:                                              ; qword
        dq 3FF0000000000000H                            ; 0010 _ 1.0 


SECTION .rodata.cst16 align=16 noexecute                ; section number 3, const

ALIGN   16
.LCPI9_1:                                               ; oword
        dd 0FFFFFFFFH, 7FFFFFFFH                        ; 0000 _ -NAN.0 NAN.0 
        dd 0FFFFFFFFH, 7FFFFFFFH                        ; 0008 _ -NAN.0 NAN.0 


