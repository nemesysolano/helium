#include <stdio.h>

double pi = 3.141529;

void print_double(double d) {
    printf("%8.2f\n", d);
}   

int main() {
    print_double(pi);
    print_double(2.718281);
    return 0;
}