
#include <stdarg.h>
#include "numeric.h"

long sum_long(long a, long b, long c, long d, long e, long f) {
    long sum = a + b + c + d + e + f;    
    return sum;
}

int sum_int(int a, int b, int c, int d, int e, int f) {
    int sum = a + b + c + d + e + f;    
    return sum;
}

double sum_double(double a, double b, double c, double d, double e, double f) {
    double sum = a + b + c + d + e + f;    
    __asm__ volatile (
        "movq %xmm0, %rax\n"
    );
    return sum;
}

void clear_int_param_registers() {
    __asm__ volatile (
       "xor %rdi, %rdi\n"
       "xor %rsi, %rsi\n"
       "xor %rdx, %rdx\n"
       "xor %rcx, %rcx\n"
       "xor %r8, %r8\n"
       "xor %r9, %r9\n"
    );
}