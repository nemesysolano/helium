#include "target-intel-builtin-functions.h"
#include "target-intel-instructions.h"
#include "target-intel-registers.h"
#include <cassert>
#include <map>
#include <string>
#include <memory>
#include <ostream>
#include "target-intel-expression.h"
#include "target-intel-registers.h"
#include "constraints.h"
#include "log.h"
#include "target-intel-support-functions.h"
#include "names.h"

using namespace std;

const char * QWORD_REGISTERS[MAX_REGISTER_ARGUMENTS] = { NASM_RDI, NASM_RSI, NASM_RDX, NASM_RCX, NASM_R8,  NASM_R9 };
const char * DWORD_REGISTERS[MAX_REGISTER_ARGUMENTS] = { NASM_EDI, NASM_ESI, NASM_EDX, NASM_ECX, NASM_R8D, NASM_R9D };
const char * QWORD_XMM_REGISTERS[MAX_REGISTER_ARGUMENTS] = {NASM_XMM0, NASM_XMM1, NASM_XMM2, NASM_XMM3, NASM_XMM4, NASM_XMM5 };

void call_intel_numeric_reducer(
    TargetContext & target_context, 
    std::ostream & out, 
    const std::map<std::string, size_t> & static_data, 
    const std::map<std::string, size_t> & call_builtin_functions,
    call_intel_reducer call_long_reducer,
    call_intel_reducer call_int_reducer,
    call_intel_reducer call_double_reducer,
    register_cleaner clear_int_registers,
    register_cleaner clear_double_registers
) {
    DataType data_type = DataType::UNDEFINED;
    const char * * registers;
    size_t iterations = 0;
    const char * return_register;
    const char * mov = NASM_MOV;
    clear_intel_trace_registers(out);
    target_context.next();

    assert(target_context.current()->getType() == TokenType::LEFT_PARENT);
    target_context.next();

    do {       
        auto result = evaluate_expression_intel(target_context, out, static_data, call_builtin_functions);
        
        if(data_type== DataType::UNDEFINED) {
            data_type = result.data_type;

            switch(result.data_type) {
                case DataType::BIGINT:
                    return_register = NASM_RAX;
                    registers = QWORD_REGISTERS;
                    clear_int_registers(out);
                    break;

                case DataType::INTEGER:
                    return_register = NASM_EAX;
                    registers = DWORD_REGISTERS;
                    clear_int_registers(out);
                    break;

                case DataType::FLOAT:
                    return_register = NASM_RAX;
                    registers = QWORD_XMM_REGISTERS;
                    clear_double_registers(out);
                    mov = NASM_MOVQ;
                    break;
                default:
                    log();
            }

        }
        
        out << '\t' << '\t' << mov << ' ' << registers[iterations] << SEP << return_register << endl;
        
        target_context.next();
        iterations++;

        assert(target_context.current()->getType() == TokenType::RIGHT_PARENT || iterations < MAX_REGISTER_ARGUMENTS);
    } while(target_context.current()->getType() != TokenType::RIGHT_PARENT);

    switch(data_type) {
        case DataType::BIGINT:
            call_long_reducer(out);
            out << '\t' << '\t' << NASM_MOV << ' ' << NASM_R10 << SEP << NASM_RAX << endl;
            break;

        case DataType::INTEGER:
            call_int_reducer(out);
            out << '\t' << '\t' << NASM_MOV << ' ' << NASM_R10 << SEP << NASM_RAX << endl;            
            break;

        case DataType::FLOAT:
            call_double_reducer(out);
            out << '\t' << '\t' << NASM_MOV << ' ' << NASM_R10 << SEP << NASM_RAX << endl;            
            break;
            
        default:
            log();
    }
}

void call_intel_sum(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_builtin_functions){
    call_intel_numeric_reducer(
        target_context, out, static_data, call_builtin_functions,
        call_sum_long, call_sum_int, call_sum_double,
        call_clear_int_sum_param_registers,
        call_clear_double_sum_param_registers
    );    
}

void call_intel_mul(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_builtin_functions){
    call_intel_numeric_reducer(
        target_context, out, static_data, call_builtin_functions,
        call_mul_long, call_mul_int, call_mul_double,
        call_clear_int_mul_param_registers,
        call_clear_double_mul_param_registers
    );    
}

void call_intel_div(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_builtin_functions){
    call_intel_numeric_reducer(
        target_context, out, static_data, call_builtin_functions,
        call_div_long, call_div_int, call_div_double,
        call_clear_int_mul_param_registers,
        call_clear_double_mul_param_registers
    );
}

void call_intel_sub(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_builtin_functions){
    call_intel_numeric_reducer(
        target_context, out, static_data, call_builtin_functions,
        call_sub_long, call_sub_int, call_sub_double,
        call_clear_int_mul_param_registers,
        call_clear_double_mul_param_registers
    );    
}

void init_intel_builtin_functions(std::map<std::string, size_t> & call_builtin_functions) {
    call_builtin_functions.emplace(BUILTIN_SUM, (size_t)call_intel_sum);
    call_builtin_functions.emplace(BUILTIN_MUL, (size_t)call_intel_mul);
    call_builtin_functions.emplace(BUILTIN_DIV, (size_t)call_intel_div);
    call_builtin_functions.emplace(BUILTIN_SUB, (size_t)call_intel_sub);
}

void clear_intel_trace_registers(std::ostream & out) {
    out << '\t' << '\t' << NASM_XOR << ' ' << NASM_R10 << SEP << NASM_R10 << endl;
    out << '\t' << '\t' << NASM_XOR << ' ' << NASM_R11 << SEP << NASM_R11 << endl;
}