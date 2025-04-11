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
	_static_14168652082172657675: DQ 2.01
	_static_9763624852600512504: DQ 2.05
	_static_4457321184184238098: DQ 3.05
section .text   align=1
	global main
	main:
		PUSH RBP
		MOV RBP, RSP
		SUB RSP, 32
		; a: 7
		MOV RAX, QWORD[REL _static_9763624852600512504]
		MOV R10, RAX
		MOV R11, 3
		MOV QWORD[RBP-8], RAX
		; b: 8
		MOV RAX, QWORD[REL _static_9763624852600512504]
		MOV R10, RAX
		MOV R11, 3
		MOV QWORD[RBP-16], RAX
		; c: 9
		MOV RAX, QWORD[REL _static_14168652082172657675]
		MOV R10, RAX
		MOV R11, 3
		MOV QWORD[RBP-24], RAX
		; eq: 11
		XOR R10, R10
		XOR R11, R11
		MOV RAX, [RBP-8]
		MOV QWORD[RBP-8], RAX
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM0, RAX
		MOV RAX, [RBP-16]
		MOV QWORD[RBP-16], RAX
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM1, RAX
		CALL eq_double
		MOV R10, RAX
		MOV R11, 5
		; trace: 12
		CALL trace
		XOR R10, R10
		XOR R11, R11
		; eq: 14
		XOR R10, R10
		XOR R11, R11
		MOV RAX, QWORD[REL _static_9763624852600512504]
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM0, RAX
		MOV RAX, [RBP-16]
		MOV QWORD[RBP-16], RAX
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM1, RAX
		CALL eq_double
		MOV R10, RAX
		MOV R11, 5
		; trace: 15
		CALL trace
		XOR R10, R10
		XOR R11, R11
		; eq: 17
		XOR R10, R10
		XOR R11, R11
		MOV RAX, [RBP-8]
		MOV QWORD[RBP-8], RAX
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM0, RAX
		MOV RAX, QWORD[REL _static_9763624852600512504]
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM1, RAX
		CALL eq_double
		MOV R10, RAX
		MOV R11, 5
		; trace: 18
		CALL trace
		XOR R10, R10
		XOR R11, R11
		; eq: 20
		XOR R10, R10
		XOR R11, R11
		MOV RAX, [RBP-8]
		MOV QWORD[RBP-8], RAX
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM0, RAX
		MOV RAX, [RBP-24]
		MOV QWORD[RBP-24], RAX
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM1, RAX
		CALL eq_double
		MOV R10, RAX
		MOV R11, 5
		; trace: 21
		CALL trace
		XOR R10, R10
		XOR R11, R11
		; eq: 23
		XOR R10, R10
		XOR R11, R11
		MOV RAX, QWORD[REL _static_9763624852600512504]
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM0, RAX
		MOV RAX, [RBP-24]
		MOV QWORD[RBP-24], RAX
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM1, RAX
		CALL eq_double
		MOV R10, RAX
		MOV R11, 5
		; trace: 24
		CALL trace
		XOR R10, R10
		XOR R11, R11
		; eq: 26
		XOR R10, R10
		XOR R11, R11
		MOV RAX, QWORD[REL _static_9763624852600512504]
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM0, RAX
		MOV RAX, QWORD[REL _static_4457321184184238098]
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM1, RAX
		CALL eq_double
		MOV R10, RAX
		MOV R11, 5
		; trace: 27
		CALL trace
		XOR R10, R10
		XOR R11, R11
		; return: 29
		MOV RAX, 0x7
		MOV R10, RAX
		MOV R11, 2
		JMP _global_exit
		XOR RAX, 0
	_global_exit:
		MOV RSP, RBP
		POP RBP
		RET
		NOP
