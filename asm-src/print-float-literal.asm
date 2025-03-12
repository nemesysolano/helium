default rel
section .note.GNU-stack noalloc noexec nowrite progbits
EXTERN print_float
EXTERN print_integer
EXTERN print_bigint
EXTERN print_string
EXTERN print_bool
EXTERN print_space
EXTERN print_newline
section .data   align=8
	_static_15301032400955230228: DQ 3.141529
        _static_hello: DB 'hello', 0
section .text   align=1
	global main
	
main:   ; Function begin
        push    rbp                                     ; 0035 _ 55
        mov     rbp, rsp                                ; 0036 _ 48: 89. E5
        mov     rax, qword [rel _static_15301032400955230228]                     ; 0039 _ 48: 8B. 05, 00000000(rel)
        movq    xmm0, rax                               ; 0040 _ 66 48: 0F 6E. C0
        call    print_float                             ; 0045 _ E8, 00000000(PLT r)
        
        LEA RAX, _static_hello
        MOV RDI, RAX
        CALL print_string
        mov     eax, 0                                  ; 005B _ B8, 00000000
        pop     rbp                                     ; 0060 _ 5D
        ret     


