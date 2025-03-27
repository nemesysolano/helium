#include <stdio.h>
#include "print.h"
#include "numeric.h"
#include "debug.h"
#include "types.h"

double A = 3.141529;
char * B = "lorem ipsum";


int main() {
    long long_content = 0x1234567890;
    __asm__ volatile ("movq %0, %%r10" :: "r" (long_content));
    __asm__ volatile ("movq %0, %%r11" :: "r" ((size_t)BIGINT));
    trace();

    long int_content = 0x1234567890;
    __asm__ volatile ("movq %0, %%r10" :: "r" (int_content));
    __asm__ volatile ("movq %0, %%r11" :: "r" ((size_t)INTEGER));
    trace();    

    double float_content = 3.141529;
    __asm__ volatile ("movq %0, %%r10" :: "r" (*(size_t *)&float_content));
    __asm__ volatile ("movq %0, %%r11" :: "r" ((size_t)FLOAT));
    trace();

    char * text_content = "lorem ipsum";
    __asm__ volatile ("movq %0, %%r10" :: "r" ((size_t)text_content));
    __asm__ volatile ("movq %0, %%r11" :: "r" ((size_t)TEXT));
    trace();

    long bool_content = 1;
    __asm__ volatile ("movq %0, %%r10" :: "r" (bool_content));
    __asm__ volatile ("movq %0, %%r11" :: "r" ((size_t)BOOLEAN));
    trace();
}