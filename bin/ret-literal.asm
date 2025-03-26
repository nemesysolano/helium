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
section .text   align=1
	global main
	main:
		PUSH RBP
		MOV RBP, RSP
		; trace
		SUB RAX, RAX
		MOV RAX, 0x21
		JMP _global_exit
		XOR RAX, 0
	_global_exit:
		MOV RSP, RBP
		POP RBP
		RET
		NOP
