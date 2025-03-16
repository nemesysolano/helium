#ifndef __SUPPORT_H__
#define __SUPPORT_H__
#include <stdio.h>
void print_float(double f, int width, int decimals);
void print_integer(int i);
void print_bigint(long l);
void print_string(char* s);
void print_bool(int b);
void print_space(int count);
void print_newline();
#endif