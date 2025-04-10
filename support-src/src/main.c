#include <stdio.h>
#include "print.h"
#include "numeric.h"
#include "debug.h"
#include "types.h"
#include "comparison.h"
double A = 3.141529;
const char * B = "lorem ipsum";

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
    long product_of_longs = mul_long(2L, 3L, 5L, 7L, 11L, 13L);
    int product_of_ints = mul_int(2, 3, 5, 7, 11, 13);
    double product_of_doubles = mul_double(2, 3, 5, 7, 11, 13);

    // Print the results
    printf("Product of longs: %ld\n", product_of_longs);
    printf("Product of ints: %d\n", product_of_ints);
    printf("Product of doubles: %f\n", product_of_doubles);

    int long_compare = lt_long(1, 2);
    int int_compare = lt_int(1, 2);
    int double_compare = lt_double(1.0, 2.0); 

    printf("Long compare: %d\n", long_compare);
    printf("Int compare: %d\n", int_compare);
    printf("Double compare: %d\n", double_compare);
    return 0;


}