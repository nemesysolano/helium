#ifndef __TARGET_INTEL_BUILTIN_FUNCTIONS_H__
#define __TARGET_INTEL_BUILTIN_FUNCTIONS_H__
#include <map>
#include <string>
#include "target.h"
#include <iostream>

typedef void (*intel_builtin_function)(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & builtin_functions);    
typedef void (*call_intel_reducer)(std::ostream & out);
typedef void (*register_cleaner)(std::ostream & out);

void init_intel_builtin_functions(std::map<std::string, size_t> & call_builtin_functions);
void call_intel_sum(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_builtin_functions);
void call_intel_mul(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_builtin_functions);
void call_intel_div(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_builtin_functions);
void call_intel_sub(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_builtin_functions);
void clear_intel_trace_registers(std::ostream & out);

#endif // __TARGET_INTEL_BUILTIN_FUNCTIONS_H__