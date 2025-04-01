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
#include "structs.h"

class TargetIntelLinux: public Target {
        std::map<std::string, size_t> call_builtin_functions;
    protected:       
        
        void variable_declarations(TargetContext & target_context, std::ostream & out);
        void statements(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data);
        void return_statement(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> &static_data);         
        void print_statement(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data);     
        void trace_statement(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data);
        void builtin_call(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data);
        void function_call(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data);  
        void assigment_call(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data); 
        void userdefined_call(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data);
        void call_statement(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data);
        void sum_statement(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data);           
    public:
        TargetIntelLinux();
        virtual bool write(std::ostream & out, const std::vector<std::unique_ptr<Token>> & tokens, const std::map<std::string, size_t> & static_data) override;

};
#endif // __TARGET_INTEL_LINUX_H__