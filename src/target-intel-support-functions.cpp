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
const static char * DELIMITER = ", ";

void support_functions(std::ostream & out) {
    out << EXTERN << ' ' << print_float << endl;
    out << EXTERN << ' ' << print_integer << endl;
    out << EXTERN << ' ' << print_bigint << endl;
    out << EXTERN << ' ' << print_string << endl;
    out << EXTERN << ' ' << print_bool << endl;
    out << EXTERN << ' ' << print_space << endl;
    out << EXTERN << ' ' << print_newline << endl;
}

void call_print_float(std::ostream & out, const char * input_register, size_t size, size_t decimals) { // movq    xmm0, rax
    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_ESI << DELIMITER << decimals << endl;
    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_EDI << DELIMITER << size << endl;
    out << '\t' << '\t' << NASM_MOVQ << ' ' << NASM_XMM0 << DELIMITER << input_register << endl;
    out << '\t' << '\t' << NASM_CALL << ' ' << print_float << endl;        
}

void call_print_integer(std::ostream & out, const char * input_register) {
    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_EDI << DELIMITER << input_register << endl;
    out << '\t' << '\t' << NASM_CALL << ' ' << print_bigint << endl;
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

void call_print_newline(std::ostream & out, const char * input_register) {

}