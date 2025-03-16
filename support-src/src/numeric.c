
#include <stdarg.h>
#include "numeric.h"

long sum_long(int n, ...) {
    long sum = 0;
    va_list args;
    va_start(args, n);  
    for (int i = 0; i < n; i++) 
        sum += va_arg(args, long);
    va_end(args);

    return sum;
}

int sum_int(int n, ...) {
    int sum = 0;
    va_list args;
    va_start(args, n);  
    for (int i = 0; i < n; i++) 
        sum += va_arg(args, int);
    va_end(args);

    return sum;
}
double sum_double(int n, ...){
    double sum = 0;
    va_list args;
    va_start(args, n);  
    for (int i = 0; i < n; i++) 
        sum += va_arg(args, double);
    va_end(args);

    return sum;
}
