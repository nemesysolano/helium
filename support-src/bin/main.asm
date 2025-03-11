; Disassembly of file: support-src/bin/main.o
; Tue Mar 11 04:32:06 2025
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: 8086, x64

default rel

global main: function

extern print_bool                                       ; near
extern print_integer                                    ; near
extern print_bigint                                     ; near
extern print_float                                      ; near
extern puts                                             ; near


SECTION .text   align=1 execute                         ; section number 1, code

main:   ; Function begin
        endbr64                                         ; 0000 _ F3: 0F 1E. FA
        push    rbp                                     ; 0004 _ 55
        mov     rbp, rsp                                ; 0005 _ 48: 89. E5
        lea     rax, [rel ?_001]                        ; 0008 _ 48: 8D. 05, 00000000(rel)
        mov     rdi, rax                                ; 000F _ 48: 89. C7
        call    puts                                    ; 0012 _ E8, 00000000(PLT r)
        mov     rax, qword [rel ?_002]                  ; 0017 _ 48: 8B. 05, 00000000(rel)
        mov     esi, 6                                  ; 001E _ BE, 00000006
        mov     edi, 12                                 ; 0023 _ BF, 0000000C
        movq    xmm0, rax                               ; 0028 _ 66 48: 0F 6E. C0
        call    print_float                             ; 002D _ E8, 00000000(PLT r)
        mov     edi, 1234567890                         ; 0032 _ BF, 499602D2
        call    print_bigint                            ; 0037 _ E8, 00000000(PLT r)
        mov     edi, 1234                               ; 003C _ BF, 000004D2
        call    print_integer                           ; 0041 _ E8, 00000000(PLT r)
        mov     edi, 1                                  ; 0046 _ BF, 00000001
        call    print_bool                              ; 004B _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 0050 _ B8, 00000000
        pop     rbp                                     ; 0055 _ 5D
        ret                                             ; 0056 _ C3
; main End of function


SECTION .data   align=1 noexecute                       ; section number 2, data


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=8 noexecute                       ; section number 4, const

?_001:                                                  ; byte
        db 53H, 75H, 70H, 70H, 6FH, 72H, 74H, 20H       ; 0000 _ Support 
        db 4CH, 69H, 62H, 72H, 61H, 72H, 79H, 20H       ; 0008 _ Library 
        db 54H, 65H, 73H, 74H, 73H, 00H, 00H, 00H       ; 0010 _ Tests...

?_002:  dq 400921D9F4D37C13H                            ; 0018 _ 400921D9F4D37C13 


SECTION .note.gnu.property align=8 noexecute            ; section number 5, const

        db 04H, 00H, 00H, 00H, 10H, 00H, 00H, 00H       ; 0000 _ ........
        db 05H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H       ; 0008 _ ....GNU.
        db 02H, 00H, 00H, 0C0H, 04H, 00H, 00H, 00H      ; 0010 _ ........
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0018 _ ........


