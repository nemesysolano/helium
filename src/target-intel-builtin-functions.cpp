#include "target-intel-builtin-functions.h"
#include "target-intel-instructions.h"
#include "target-intel-registers.h"
#include <ostream>
using namespace std;

void init_intel_builtin_functions(std::map<std::string, size_t> call_builtin_functions) {
}

void call_intel_sum(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & builtin_functions){

}

void clear_intel_trace_registers(std::ostream & out) {
    out << '\t' << '\t' << NASM_SUB << ' ' << NASM_RAX << SEP << NASM_RAX << endl;
    out << '\t' << '\t' << NASM_SUB << ' ' << NASM_RBX << SEP << NASM_RBX << endl;
}