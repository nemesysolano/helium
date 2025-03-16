#include <stdio.h>
#include "print.h"
#include "numeric.h"

double A = 3.141529;
char * B = "21";
int main() {

    // long sum1 = sum_long(20, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
    long sum1 = sum_long(6, 2, 3, 4, 5, 6, 7);
    // int sum2 = sum_int(5, 1, 2, 3, 4, 5);
    // double sum3 = sum_double(5, 1, 2, 3, 4, 5);
    
    print_bigint(sum1);
    // print_integer(sum2);
    // print_float(sum3, 12, 6);
    return 0;
}