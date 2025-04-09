#include "comparison.h"
#include <math.h>

#define FLOAT_EPSILON 1e-9
#define MIN_FLOAT_DECIMALS 2
#define MAX_FLOAT_DECIMALS 12

int lt_long(long a, long b){
    return a < b;
}

int lt_int(int a, int b) {
    return a < b;
}

int lt_double(double a, double b) {
    return a < b;
}

int gt_long(long a, long b){
    return a > b;
}

int gt_int(int a, int b) {
    return a > b;
}

int gt_double(double a, double b) {
    return a > b;
}

int ne_long(long a, long b){
    return a != b;
}

int ne_int(int a, int b)    {
    return a != b;
}

int ne_double(double a, double b) {
    return !eq_double(a, b);
}

int eq_long(long a, long b) {
    return a == b;
}

int eq_int(int a, int b)    {
    return a == b;
}

int eq_double(double a, double b) {
    double diff = fabs(a - b);
    if(diff < FLOAT_EPSILON) {
        return 1;
    }

    return diff < FLOAT_EPSILON * fmin(fabs(a), fabs(b));
}

int le_long(long a, long b) {
    return a <= b;
}
int le_int(int a, int b) {
    return a <= b;
}

int le_double(double a, double b) {
   return lt_double(a, b) || eq_double(a, b);
}

int ge_long(long a, long b) {
    return a >= b;
}

int ge_int(int a, int b) {
    return a >= b;
}

int ge_double(double a, double b){
    return gt_double(a, b) || eq_double(a, b);
}


double trucate(double a, int decimals) {
    int adjusted_decimals;

    if (decimals < MIN_FLOAT_DECIMALS) {
        adjusted_decimals = MIN_FLOAT_DECIMALS;
    } else if (decimals > MAX_FLOAT_DECIMALS) {
        adjusted_decimals = MAX_FLOAT_DECIMALS;
    } else {
        adjusted_decimals = decimals;
    }

    double factor = pow(10.0, adjusted_decimals * 1.0);
    return trunc(a * factor) / factor;
}