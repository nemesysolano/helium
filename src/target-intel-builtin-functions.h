#ifndef __TARGET_INTEL_BUILTIN_FUNCTIONS_H__
#define __TARGET_INTEL_BUILTIN_FUNCTIONS_H__
#include <map>
#include <string>
#include "target.h"
#include <iostream>

typedef void (*intel_builtin_function)(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & builtin_functions);    
typedef void (*call_intel_reducer)(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & builtin_functions);
typedef void (*call_intel_numeric_comparator)(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & builtin_functions);
typedef void (*register_cleaner)(std::ostream & out);

void init_intel_builtin_functions(std::map<std::string, size_t> & call_builtin_functions);
void call_intel_sum(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_builtin_functions);
void call_intel_mul(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_builtin_functions);
void call_intel_div(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_builtin_functions);
void call_intel_sub(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_builtin_functions);
void call_intel_lt(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_builtin_functions);
void call_intel_gt(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_builtin_functions);
void call_intel_ne(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_builtin_functions);
void call_intel_eq(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_builtin_functions);


void call_intel_sum_long(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_sum_int(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_sum_double(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_mul_long(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_mul_int(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_mul_double(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_sub_long(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_sub_int(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_sub_double(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_div_long(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_div_int(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_div_double(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_lt_long(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_lt_int(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_lt_double(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_gt_long(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_gt_int(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_gt_double(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_ne_long(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_ne_int(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_ne_double(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_eq_long(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_eq_int(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_intel_eq_double(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & call_intel_builtin_functions);
void call_truncate(std::ostream & out, int decimals);
void clear_intel_trace_registers(std::ostream & out);

#endif // __TARGET_INTEL_BUILTIN_FUNCTIONS_H__