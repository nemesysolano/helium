#include "target-intel-support-functions.h"
#include "target-intel-instructions.h"
#include "target-intel-registers.h"
#include <iostream>

using namespace std;
const char * print_float = "print_float";
const char * print_integer = "print_integer";
const char * print_bigint = "print_bigint";
const char * print_string = "print_string";
const char * print_bool = "print_bool";
const char * print_space = "print_space";
const char * print_newline = "print_newline";
const char * trace = "trace";
const char * sum_long = "sum_long";
const char * sum_int = "sum_int";
const char * sum_double = "sum_double";
const char * mul_long = "mul_long";
const char * mul_int = "mul_int";
const char * mul_double = "mul_double";
const char * clear_int_param_registers = "clear_int_param_registers";
const static char * DELIMITER = ", ";

void support_functions(std::ostream & out) {
    out << EXTERN << ' ' << print_float << endl;
    out << EXTERN << ' ' << print_integer << endl;
    out << EXTERN << ' ' << print_bigint << endl;
    out << EXTERN << ' ' << print_string << endl;
    out << EXTERN << ' ' << print_bool << endl;
    out << EXTERN << ' ' << print_space << endl;
    out << EXTERN << ' ' << print_newline << endl;
    out << EXTERN << ' ' << trace << endl;
    out << EXTERN << ' ' << sum_long << endl;
    out << EXTERN << ' ' << sum_int << endl;
    out << EXTERN << ' ' << sum_double << endl;
    out << EXTERN << ' ' << mul_long << endl;
    out << EXTERN << ' ' << mul_int << endl;
    out << EXTERN << ' ' << mul_double << endl;    
    out << EXTERN << ' ' << clear_int_param_registers << endl;
}

void call_print_float(std::ostream & out, const char * input_register, size_t size, size_t decimals) { // movq    xmm0, rax
    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_ESI << DELIMITER << decimals << endl;
    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_EDI << DELIMITER << size << endl;
    out << '\t' << '\t' << NASM_MOVQ << ' ' << NASM_XMM0 << DELIMITER << input_register << endl;
    out << '\t' << '\t' << NASM_CALL << ' ' << print_float << endl;        
}

void call_print_integer(std::ostream & out, const char * input_register) {
    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_EDI << DELIMITER << input_register << endl;
    out << '\t' << '\t' << NASM_CALL << ' ' << print_integer << endl;
}

void call_print_bigint(std::ostream & out, const char * input_register) {
    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_RDI << DELIMITER << input_register << endl;
    out << '\t' << '\t' << NASM_CALL << ' ' << print_bigint << endl;
}

void call_print_string(std::ostream & out, const char * input_register) {
    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_RDI << DELIMITER << input_register << endl;
    out << '\t' << '\t' << NASM_CALL << ' ' << print_string << endl;
}

void call_print_bool(std::ostream & out, const char * input_register) {
    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_EDI << DELIMITER << input_register << endl;
    out << '\t' << '\t' << NASM_CALL << ' ' << print_bool << endl;
}

void call_print_space(std::ostream & out, const char * input_register) {

}

void call_trace(std::ostream & out) {
    out << '\t' << '\t' << NASM_CALL << ' ' << trace << endl;
}


void call_print_newline(std::ostream & out) {
    out << '\t' << '\t' << NASM_CALL << ' ' << print_newline << endl;
}

void call_sum_long(std::ostream & out){
    out << '\t' << '\t' << NASM_CALL << ' ' << sum_long << endl;
}

void call_sum_int(std::ostream & out) {
    out << '\t' << '\t' << NASM_CALL << ' ' << sum_int << endl;
}

void call_sum_double(std::ostream & out) {
    out << '\t' << '\t' << NASM_CALL << ' ' << sum_double << endl;
}

void call_mul_long(std::ostream & out){
    out << '\t' << '\t' << NASM_CALL << ' ' << mul_long << endl;
}

void call_mul_int(std::ostream & out) {
    out << '\t' << '\t' << NASM_CALL << ' ' << mul_int << endl;
}

void call_mul_double(std::ostream & out) {
    out << '\t' << '\t' << NASM_CALL << ' ' << mul_double << endl;
}

void call_clear_int_param_registers(std::ostream & out) {
    out << '\t' << '\t' << NASM_CALL << ' ' << clear_int_param_registers << endl;
}