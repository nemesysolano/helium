#ifndef __NUMERIC_H__
#define __NUMERIC_H__

long sum_long(long a, long b, long c, long d, long e, long f);
int sum_int(int a, int b, int c, int d, int e, int f);
double sum_double(double a, double b, double c, double d, double e, double f);

long mul_long(long a, long b, long c, long d, long e, long f);
int mul_int(int a, int b, int c, int d, int e, int f);
double mul_double(double a, double b, double c, double d, double e, double f);

long sub_long(long a, long b);
int sub_int(int a, int b);
double sub_double(double a, double b);

long div_long(long a, long b);
int div_int(int a, int b);
double div_double(double a, double b);

void clear_int_sum_param_registers();
void clear_double_sum_param_registers();

void clear_int_mul_param_registers();
void clear_double_mul_param_registers();

#endif