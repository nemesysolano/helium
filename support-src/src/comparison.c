#include "comparison.h"

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

int eq_long(long a, long b) {
    return a == b;
}

int eq_int(int a, int b)    {
    return a == b;
}