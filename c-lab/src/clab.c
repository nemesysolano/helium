#include <stdio.h>

double pi = 3.141529;
const char * message = "Message";
void print_double(double d) {
    printf("%8.2f\n", d);
}   
int main() {
    int x;
    long y;
    const char * s;
    double p;
    
    x = 1;
    y = 2;
    s = message;
    p = pi;
    return x + (int)y;
}