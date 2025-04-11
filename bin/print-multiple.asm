default rel
section .note.GNU-stack noalloc noexec nowrite progbits
EXTERN print_float
EXTERN print_integer
EXTERN print_bigint
EXTERN print_string
EXTERN print_bool
EXTERN print_space
EXTERN print_newline
EXTERN trace
EXTERN sum_long
EXTERN sum_int
EXTERN sum_double
EXTERN mul_long
EXTERN mul_int
EXTERN mul_double
EXTERN sub_long
EXTERN sub_int
EXTERN sub_double
EXTERN div_long
EXTERN div_int
EXTERN div_double
EXTERN lt_long
EXTERN lt_int
EXTERN lt_double
EXTERN gt_long
EXTERN gt_int
EXTERN gt_double
EXTERN ne_long
EXTERN ne_int
EXTERN ne_double
EXTERN eq_long
EXTERN eq_int
EXTERN eq_double
EXTERN le_long
EXTERN le_int
EXTERN le_double
EXTERN ge_long
EXTERN ge_int
EXTERN ge_double
EXTERN truncate
EXTERN clear_int_sum_param_registers
EXTERN clear_double_sum_param_registers
EXTERN clear_int_mul_param_registers
EXTERN clear_double_mul_param_registers
section .data   align=8
	_static_18367766016047448119: DB " ",0
	_static_3339989693088926631: DB "hello, ",0
	_static_7881532571287543726: DB "texto",0
	_static_1166197008018822951: DQ 3.141529
section .text   align=1
	global main
	main:
		PUSH RBP
		MOV RBP, RSP
		SUB RSP, 32
		; x: 8
		MOV EAX, 7
		MOV R10, RAX
		MOV R11, 1
		MOV DWORD[RBP-4], EAX
		; y: 9
		MOV RAX, 0x8
		MOV R10, RAX
		MOV R11, 2
		MOV QWORD[RBP-12], RAX
		; t: 10
		LEA RAX, _static_7881532571287543726
		MOV R10, RAX
		MOV R11, 4
		MOV QWORD[RBP-20], RAX
		; pi: 11
		MOV RAX, QWORD[REL _static_1166197008018822951]
		MOV R10, RAX
		MOV R11, 3
		MOV QWORD[RBP-28], RAX
		; print: 12
		XOR R10, R10
		XOR R11, R11
		LEA RAX, _static_3339989693088926631
		MOV R10, RAX
		MOV R11, 4
		MOV RDI, RAX
		CALL print_string
		MOV RAX, QWORD[REL _static_1166197008018822951]
		MOV R10, RAX
		MOV R11, 3
		MOV ESI, 6
		MOV EDI, 12
		MOVQ XMM0, RAX
		CALL print_float
		LEA RAX, _static_18367766016047448119
		MOV R10, RAX
		MOV R11, 4
		MOV RDI, RAX
		CALL print_string
		MOV EAX, 1
		MOV R10, RAX
		MOV R11, 5
		MOV EDI, EAX
		CALL print_bool
		LEA RAX, _static_18367766016047448119
		MOV R10, RAX
		MOV R11, 4
		MOV RDI, RAX
		CALL print_string
		MOV EAX, 0
		MOV R10, RAX
		MOV R11, 5
		MOV EDI, EAX
		CALL print_bool
		LEA RAX, _static_18367766016047448119
		MOV R10, RAX
		MOV R11, 4
		MOV RDI, RAX
		CALL print_string
		MOV RAX, 0x10
		MOV R10, RAX
		MOV R11, 2
		MOV RDI, RAX
		CALL print_bigint
		LEA RAX, _static_18367766016047448119
		MOV R10, RAX
		MOV R11, 4
		MOV RDI, RAX
		CALL print_string
		MOV EAX, 2
		MOV R10, RAX
		MOV R11, 1
		MOV EDI, EAX
		CALL print_integer
		LEA RAX, _static_18367766016047448119
		MOV R10, RAX
		MOV R11, 4
		MOV RDI, RAX
		CALL print_string
		MOV EAX, [RBP-4]
		MOV DWORD[RBP-4], EAX
		MOV R10, RAX
		MOV R11, 1
		MOV EDI, EAX
		CALL print_integer
		LEA RAX, _static_18367766016047448119
		MOV R10, RAX
		MOV R11, 4
		MOV RDI, RAX
		CALL print_string
		MOV RAX, [RBP-12]
		MOV QWORD[RBP-12], RAX
		MOV R10, RAX
		MOV R11, 2
		MOV RDI, RAX
		CALL print_bigint
		LEA RAX, _static_18367766016047448119
		MOV R10, RAX
		MOV R11, 4
		MOV RDI, RAX
		CALL print_string
		MOV RAX, [RBP-20]
		MOV QWORD[RBP-20], RAX
		MOV R10, RAX
		MOV R11, 4
		MOV RDI, RAX
		CALL print_string
		LEA RAX, _static_18367766016047448119
		MOV R10, RAX
		MOV R11, 4
		MOV RDI, RAX
		CALL print_string
		MOV RAX, [RBP-28]
		MOV QWORD[RBP-28], RAX
		MOV R10, RAX
		MOV R11, 3
		MOV ESI, 6
		MOV EDI, 12
		MOVQ XMM0, RAX
		CALL print_float
		CALL print_newline
		XOR R10, R10
		XOR R11, R11
		; return: 14
		MOV RAX, 0x21
		MOV R10, RAX
		MOV R11, 2
		JMP _global_exit
		XOR RAX, 0
	_global_exit:
		MOV RSP, RBP
		POP RBP
		RET
		NOP
