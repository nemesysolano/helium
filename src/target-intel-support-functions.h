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

void support_functions(std::ostream & out);

void call_print_float(std::ostream & out, const char * input_register);
void call_print_integer(std::ostream & out, const char * input_register);
void call_print_bigint(std::ostream & out, const char * input_register);
void call_print_string(std::ostream & out, const char * input_register);
void call_print_bool(std::ostream & out, const char * input_register);
void call_print_space(std::ostream & out, const char * input_register);
void call_print_newline(std::ostream & out, const char * input_register);

#endif