#ifndef __TARGET_INTEL_SUPPORT_FUNCTIONS_H__
#define __TARGET_INTEL_SUPPORT_FUNCTIONS_H__
#include <iostream>
extern const char * print_float;
extern const char * print_integer;
extern const char * print_bigint;
extern const char * print_string;
extern const char * print_bool;
extern const char * print_space;
extern const char * print_newline;
extern const char * trace;
extern const char * sum_long;
extern const char * sum_int;
extern const char * sum_double;
extern const char * mul_long;
extern const char * mul_int;
extern const char * mul_double;
extern const char * sub_long;
extern const char * sub_int;
extern const char * sub_double;
extern const char * div_long;
extern const char * div_int;
extern const char * div_double ;
extern const char * lt_long;
extern const char * lt_int;
extern const char * lt_double; 
extern const char * gt_long;
extern const char * gt_int;
extern const char * gt_double; 
extern const char * ne_long;
extern const char * ne_int;
extern const char * eq_long;
extern const char * eq_int;
extern const char * clear_int_sum_param_registers;
extern const char * clear_double_sum_param_registers;
extern const char * clear_int_mul_param_registers;
extern const char * clear_double_mul_param_registers;

void support_functions(std::ostream & out);
void call_print_float(std::ostream & out, const char * input_register, size_t size, size_t decimals);
void call_print_integer(std::ostream & out, const char * input_register);
void call_print_bigint(std::ostream & out, const char * input_register);
void call_print_string(std::ostream & out, const char * input_register);
void call_print_bool(std::ostream & out, const char * input_register);
void call_print_space(std::ostream & out, const char * input_register);
void call_print_newline(std::ostream & out);
void call_trace(std::ostream & out);
void call_sum_long(std::ostream & out);
void call_sum_int(std::ostream & out);
void call_sum_double(std::ostream & out);
void call_mul_long(std::ostream & out);
void call_mul_int(std::ostream & out);
void call_mul_double(std::ostream & out);
void call_sub_long(std::ostream & out);
void call_sub_int(std::ostream & out);
void call_sub_double(std::ostream & out);
void call_div_long(std::ostream & out);
void call_div_int(std::ostream & out);
void call_div_double(std::ostream & out);
void call_clear_int_sum_param_registers(std::ostream & out);
void call_clear_double_sum_param_registers(std::ostream & out);
void call_clear_int_mul_param_registers(std::ostream & out);
void call_clear_double_mul_param_registers(std::ostream & out);

#endif