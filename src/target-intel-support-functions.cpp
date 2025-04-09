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
const char * sub_long = "sub_long";
const char * sub_int = "sub_int";
const char * sub_double = "sub_double";
const char * div_long = "div_long";
const char * div_int = "div_int";
const char * div_double = "div_double";
const char * lt_long = "lt_long";
const char * lt_int = "lt_int";
const char * lt_double = "lt_double"; 
const char * gt_long = "gt_long";
const char * gt_int = "gt_int";
const char * gt_double = "gt_double"; 
const char * ne_long = "ne_long";
const char * ne_int = "ne_int";
const char * ne_double = "ne_double";
const char * eq_long = "eq_long";
const char * eq_int = "eq_int";
const char * eq_double = "eq_double";

const char * le_long = "le_long";
const char * le_int = "le_int";
const char * le_double = "le_double";
const char * ge_long = "ge_long";
const char * ge_int = "ge_int";
const char * ge_double = "ge_double";


const char * truncate = "truncate";
const char * clear_int_sum_param_registers = "clear_int_sum_param_registers";
const char * clear_double_sum_param_registers = "clear_double_sum_param_registers";
const char * clear_int_mul_param_registers = "clear_int_mul_param_registers";
const char * clear_double_mul_param_registers = "clear_double_mul_param_registers";
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
    out << EXTERN << ' ' << sub_long << endl;
    out << EXTERN << ' ' << sub_int << endl;
    out << EXTERN << ' ' << sub_double << endl;        
    out << EXTERN << ' ' << div_long << endl;
    out << EXTERN << ' ' << div_int << endl;
    out << EXTERN << ' ' << div_double << endl;       
    out << EXTERN << ' ' << lt_long << endl;       
    out << EXTERN << ' ' << lt_int << endl;       
    out << EXTERN << ' ' << lt_double << endl;       
    out << EXTERN << ' ' << gt_long << endl;       
    out << EXTERN << ' ' << gt_int << endl;       
    out << EXTERN << ' ' << gt_double << endl;          
    out << EXTERN << ' ' << ne_long << endl;       
    out << EXTERN << ' ' << ne_int << endl;     
    out << EXTERN << ' ' << ne_double << endl;  
    out << EXTERN << ' ' << eq_long << endl;       
    out << EXTERN << ' ' << eq_int << endl;      
    out << EXTERN << ' ' << eq_double << endl; 
    out << EXTERN << ' ' << le_long << endl;
    out << EXTERN << ' ' << le_int << endl;
    out << EXTERN << ' ' << le_double << endl;
    out << EXTERN << ' ' << ge_long << endl;
    out << EXTERN << ' ' << ge_int << endl;
    out << EXTERN << ' ' << ge_double << endl;    
    out << EXTERN << ' ' << truncate << endl;
    out << EXTERN << ' ' << clear_int_sum_param_registers << endl;
    out << EXTERN << ' ' << clear_double_sum_param_registers << endl;
    out << EXTERN << ' ' << clear_int_mul_param_registers << endl;
    out << EXTERN << ' ' << clear_double_mul_param_registers << endl;
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

void call_truncate(std::ostream & out) {
    out << '\t' << '\t' << NASM_CALL << ' ' << truncate << endl;
}

/* */
void call_clear_int_sum_param_registers(std::ostream & out) {
    out << '\t' << '\t' << NASM_CALL << ' ' << clear_int_sum_param_registers << endl;
}

void call_clear_double_sum_param_registers(std::ostream & out) {
    out << '\t' << '\t' << NASM_CALL << ' ' << clear_double_sum_param_registers << endl;
}


void call_clear_int_mul_param_registers(std::ostream & out) {
    out << '\t' << '\t' << NASM_CALL << ' ' << clear_int_mul_param_registers << endl;
}

void call_clear_double_mul_param_registers(std::ostream & out) {
    out << '\t' << '\t' << NASM_CALL << ' ' << clear_double_mul_param_registers << endl;
}
