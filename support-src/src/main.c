#include <stdio.h>
#include "support.h"
double A = 3.141529;
char * B = "21";
int main() {
    double a = A;
    char * b = B;
    int c = 1234;
    long d = 1234567890;

    print_float(a, 12, 6);
    print_string(b);
    print_integer(c);
    print_bigint(d);    
    
    
    return 0;
}