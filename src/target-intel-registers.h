#ifndef __TARGET_INTEL_REGISTERS__
// NASM 64 bits Registers
extern const char * NASM_RAX;
extern const char * NASM_RBX;
extern const char * NASM_RCX;
extern const char * NASM_RDX;

// NASM 32 bits Registers
extern const char * NASM_EAX;
extern const char * NASM_EBX;
extern const char * NASM_ECX;
extern const char * NASM_EDX;

// NASM 8 bits Register
extern const char * NASM_AL;
extern const char * NASM_AH;
extern const char * NASM_BL;
extern const char * NASM_BH;
extern const char * NASM_CL;
extern const char * NASM_CH;
extern const char * NASM_DL;
extern const char * NASM_DH;

// 64 bits Base Register, Stack Register, Frame Pointer Register
extern const char * NASM_RBP;
extern const char * NASM_RSP;

// 32 bits Base Register, Stack Register, Frame Pointer Register
extern const char * NASM_EBP;
extern const char * NASM_ESP;

// 64 bits Index Registers
extern const char * NASM_RSI;
extern const char * NASM_RDI;

// 32 bits Index Registers
extern const char * NASM_ESI;
extern const char * NASM_EDI;

extern const char * NASM_XMM0;
#endif