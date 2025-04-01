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

void call_intel_sum(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_builtin_functions){
    DataType data_type = DataType::UNDEFINED;
    const char * * registers;
    size_t iterations = 0;
    size_t type_size = 0;
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
                    call_clear_int_param_registers(out);
                    break;

                case DataType::INTEGER:
                    return_register = NASM_EAX;
                    registers = DWORD_REGISTERS;
                    call_clear_int_param_registers(out);
                    break;

                case DataType::FLOAT:
                    return_register = NASM_RAX;
                    registers = QWORD_XMM_REGISTERS;
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

    out << '\t' << '\t' << ';' << "tracing sum result" << endl;
    switch(data_type) {
        case DataType::BIGINT:
            call_sum_long(out);
            out << '\t' << '\t' << NASM_MOV << ' ' << NASM_R10 << SEP << NASM_RAX << endl;
            break;

        case DataType::INTEGER:
            call_sum_int(out);
            out << '\t' << '\t' << NASM_MOV << ' ' << NASM_R10 << SEP << NASM_RAX << endl;            
            break;

        case DataType::FLOAT:
            call_sum_double(out);
            out << '\t' << '\t' << NASM_MOV << ' ' << NASM_R10 << SEP << NASM_RAX << endl;            
            break;
            
        default:
            log();
    }
}

void init_intel_builtin_functions(std::map<std::string, size_t> & call_builtin_functions) {
    call_builtin_functions.emplace(BUILTIN_SUM, (size_t)call_intel_sum);

}

void clear_intel_trace_registers(std::ostream & out) {
    out << '\t' << '\t' << NASM_XOR << ' ' << NASM_R10 << SEP << NASM_R10 << endl;
    out << '\t' << '\t' << NASM_XOR << ' ' << NASM_R11 << SEP << NASM_R11 << endl;
}