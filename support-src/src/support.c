#include "support.h"
#include <stdio.h>

#ifdef _WIN32
const char new_line = "\r\n";
#else
const char * new_line = "\n";
#endif


void print_float(double f, int width, int decimals){
    printf("%*.*f", width, decimals, f);
}

void print_int(int i) {
    printf("%d", i);
}

void print_long(long l) {
    printf("%ld", l);
}

void print_string(char* s) {
    printf("%s", s);
}

void print_bool(int b) {
    printf("%s", (b != 0) ? "true" : "false");
}

void print_space(int count) {
    for (int i = 0; i < count; i++) {
        printf(" ");
    }
}

void print_newline() {
    printf("%s", new_line);
}