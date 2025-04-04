
#include <stdarg.h>
#include "numeric.h"
#include <stdio.h>
#include <stdint.h>

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

long mul_long(long a, long b, long c, long d, long e, long f){
    long mul = a * b * c * d * e * f;    
    return mul;
}


int mul_int(int a, int b, int c, int d, int e, int f){
    int mul = a * b * c * d * e * f;    
    return mul;
}


double mul_double(double a, double b, double c, double d, double e, double f) {
    double mul = a * b * c * d * e * f;    
    __asm__ volatile (
        "movq %xmm0, %rax\n"
    );
    return mul;
}

long sub_long(long a, long b){
    long sub = a - b;
    return sub;
}

int sub_int(int a, int b) {
    int sub = a - b;
    return sub;
}

double sub_double(double a, double b) {
    double sub = a - b;
    __asm__ volatile (
        "movq %xmm0, %rax\n"
    );
    return sub;
}

long div_long(long a, long b) {
    if(b == 0) {
        if(a > 0) {
            return INTMAX_MAX;
        } else if(a < 0) {
            return INTMAX_MIN;
        } else {
            return 0;
        }
    }

    long div = a / b;
    return div;
}

int div_int(int a, int b) {
    if(b == 0) {
        if(a > 0) {
            return INT32_MAX;
        } else if(a < 0) {
            return INT32_MIN;
        } else {
            return 0;
        }
    }
    int div = a / b;
    return div;
}

double div_double(double a, double b) {
    double div = a / b;
    __asm__ volatile (
        "movq %xmm0, %rax\n"
    );
    return div;
}

void clear_int_sum_param_registers() {
    __asm__ volatile (
       "xor %rdi, %rdi\n"
       "xor %rsi, %rsi\n"
       "xor %rdx, %rdx\n"
       "xor %rcx, %rcx\n"
       "xor %r8, %r8\n"
       "xor %r9, %r9\n"
    );
}

void clear_double_sum_param_registers() {
    __asm__ volatile (
        "pxor %xmm0, %xmm0\n"
        "pxor %xmm1, %xmm1\n"
        "pxor %xmm2, %xmm2\n"
        "pxor %xmm3, %xmm3\n"
        "pxor %xmm4, %xmm4\n"
        "pxor %xmm5, %xmm5\n"
    );
}

void clear_int_mul_param_registers() {
    __asm__ volatile (
       "mov $1, %rdi\n"
       "mov $1, %rsi\n"
       "mov $1, %rdx\n"
       "mov $1, %rcx\n"
       "mov $1, %r8\n"
       "mov $1, %r9\n"
    );
}

void clear_double_mul_param_registers(){
    __asm__ volatile (
        "mov $1,  %rdx\n"
        "movd %rdx, %xmm0\n"
        "movd %rdx, %xmm1\n"
        "movd %rdx, %xmm2\n"
        "movd %rdx, %xmm3\n"
        "movd %rdx, %xmm4\n"
        "movd %rdx, %xmm5\n"
    );
}