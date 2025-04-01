#include <stdio.h>
#include "print.h"
#include "numeric.h"
#include "debug.h"
#include "types.h"

double A = 3.141529;
char * B = "lorem ipsum";

void test_trace() {
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


int main() {
    // Test the sum functions
    long sum_of_longs = sum_long(2L, 3L, 5L, 7L, 11L, 13L);
    int sub_of_ints = sum_int(3, 5, 7, 11, 13, 17);
    double sum_of_doubles = sum_double(3, 5, 7, 11, 13, 17);

    // Print the results
    printf("Sum of longs: %ld\n", sum_of_longs);
    printf("Sum of ints: %d\n", sub_of_ints);
    printf("Sum of doubles: %f\n", sum_of_doubles);
    return 0;
}