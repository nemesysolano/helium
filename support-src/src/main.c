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
    long product_of_longs = mul_long(2L, 3L, 5L, 7L, 11L, 13L);
    int product_of_ints = mul_int(2, 3, 5, 7, 11, 13);
    double product_of_doubles = mul_double(2, 3, 5, 7, 11, 13);

    // Print the results
    printf("Product of longs: %ld\n", product_of_longs);
    printf("Product of ints: %d\n", product_of_ints);
    printf("Product of doubles: %f\n", product_of_doubles);

    printf("size of long: %zu\n", sizeof(long));
    printf("size of int: %zu\n", sizeof(int));
    printf("size of long int: %zu\n", sizeof(long int));
    printf("size of double: %zu\n", sizeof(double));
    printf("size of size_t: %zu\n", sizeof(size_t));
    printf("size of char*: %zu\n", sizeof(char*));
    return 0;


}