#ifndef __COMPARISON_H__
#define __COMPARISON_H__

int lt_long(long a, long b);
int lt_int(int a, int b);
int lt_double(double a, double b); 

int gt_long(long a, long b);
int gt_int(int a, int b);
int gt_double(double a, double b); 

int ne_long(long a, long b);
int ne_int(int a, int b);
int ne_double(double a, double b);

int eq_long(long a, long b);
int eq_int(int a, int b);
int eq_double(double a, double b);

double truncate(double a, int decimals);
#endif