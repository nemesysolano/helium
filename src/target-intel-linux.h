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
#include "target-intel-builtin-functions.h"
struct ExpressionResult {
    bool is_literal;
    DataType data_type;
    size_t size;
};

class TargetIntelLinux: public Target {
        std::map<std::string, size_t> call_builtin_functions;
    protected:       
        
        ExpressionResult evaluate_expression(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data);
        void variable_declarations(TargetContext & target_context, std::ostream & out);
        void statements(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & builtin_functions);
        void return_statement(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> &static_data);         
        void print_statement(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data);     
        void builtin_call(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & builtin_function);
        void userdefined_call(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & builtin_function);
        void call_statement(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & builtin_function);
        void sum_statement(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data);           
    public:
        inline TargetIntelLinux() { init_intel_builtin_functions(call_builtin_functions); }
        virtual bool write(std::ostream & out, const std::vector<std::unique_ptr<Token>> & tokens, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & builtin_functions) override;

};
#endif // __TARGET_INTEL_LINUX_H__