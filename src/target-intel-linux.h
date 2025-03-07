#ifndef __TARGET_INTEL_LINUX_H__
#define __TARGET_INTEL_LINUX_H__
#include "target.h"
#include <iostream>
#include "target-intel-registers.h"
#include "target-intel-instructions.h"
#include "enums.h"
#include <stack>
#include <map>
#include <memory>

struct ExpressionResult {
    bool is_literal;
    DataType data_type;
    size_t size;
    size_t offset;
};

class TargetIntelLinux: public Target {
    protected:       
        void variable_declarations(TargetContext & target_context, std::ostream & out);
        void statements(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data);
        void evaluate_return_expression(TargetContext & target_context, std::ostream & out);
        void return_statement(TargetContext & target_context, std::ostream & out); 
        ExpressionResult evaluate_call_expression(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const Token & called);
        ExpressionResult evaluate_call_expression(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data);
        void print_statement(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data);     
        void call_statement(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data);           
    public:
        virtual bool write(std::ostream & out, const std::vector<std::unique_ptr<Token>> & tokens, const std::map<std::string, size_t> & static_data) override;

};
#endif // __TARGET_INTEL_LINUX_H__