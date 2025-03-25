#ifndef __TARGET_INTEL_EXPRESSION_H__
#define __TARGET_INTEL_EXPRESSION_H__
#include "target.h"
#include <iostream>
#include <map>
#include <string>
#include "structs.h"
ExpressionResult evaluate_expression_intel(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data);
#endif