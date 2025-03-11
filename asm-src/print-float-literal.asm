default rel
section .note.GNU-stack noalloc noexec nowrite progbits
EXTERN printf
EXTERN print_float
section .data   align=8
	_static_15301032400955230228: DQ 3.141529
	fmt: DB "%12.6f",0

section .text   align=1
	global main
print_float_local:
        push    rbp                                     ; 0004 _ 55
        mov     rbp, rsp                                ; 0005 _ 48: 89. E5
        sub     rsp, 16                                 ; 0008 _ 48: 83. EC, 10
        movsd   qword [rbp-8H], xmm0                    ; 000C _ F2: 0F 11. 45, F8
        mov     rax, qword [rbp-8H]                     ; 0011 _ 48: 8B. 45, F8
        movq    xmm0, rax                               ; 0015 _ 66 48: 0F 6E. C0
        lea     rax, [rel fmt]                          ; 001A _ 48: 8D. 05, 00000000(rel)
        mov     rdi, rax                                ; 0021 _ 48: 89. C7
        mov     eax, 1                                  ; 0024 _ B8, 00000001
        call    printf                                  ; 0029 _ E8, 00000000(PLT r)
        nop                                             ; 002E _ 90
        leave                                           ; 002F _ C9
        ret                                             ; 0030 _ C3
	
main:   ; Function begin
        push    rbp                                     ; 0035 _ 55
        mov     rbp, rsp                                ; 0036 _ 48: 89. E5
        mov     rax, qword [rel _static_15301032400955230228]                     ; 0039 _ 48: 8B. 05, 00000000(rel)
        movq    xmm0, rax                               ; 0040 _ 66 48: 0F 6E. C0
        call    print_float_local                       ; 0045 _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 005B _ B8, 00000000
        pop     rbp                                     ; 0060 _ 5D
        ret     


