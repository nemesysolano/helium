#include "target-intel-expression.h"
#include "target-intel-registers.h"
#include "target-intel-instructions.h"
#include "enums.h"
#include "text.h"
#include "structs.h"

using namespace std;
ExpressionResult evaluate_expression_intel(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & builtin_function) {
    auto const & object = * target_context.current();
    auto const & object_name = object.getValue();
    auto object_type = object.getType();
    auto object_data_type = to_data_type(object_type);
    auto object_data_type_size = data_type_size(object_data_type);
    auto const * size_qualifier = DWORD;
    auto const * size_register = NASM_EAX;
    bool is_literal = false;    

    if(is_literal_token_type(object.getType())){
        is_literal = true;
        if(object_data_type == DataType::TEXT || object_data_type == DataType::FLOAT || object_data_type == DataType::BIGINT) {            
            
            switch(object_data_type) {
                case DataType::TEXT:
                    out << '\t' << '\t' << NASM_LEA << ' ' << NASM_RAX << SEP << STATIC_PREFIX << static_data.at(object.getValue()) << endl;                                        
                    break;
                    
                case DataType::BIGINT:                    
                    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_RAX << SEP << object.getValue() << endl;
                    break;

                case DataType::FLOAT: // // mov     rax, qword [rel pi]  
                    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_RAX << SEP << QWORD << '[' << REL << ' ' << STATIC_PREFIX << static_data.at(object.getValue()) << ']' << endl;
                    break;
            }
            
        } else {
            switch(object_data_type) {
                case DataType::INTEGER:
                    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_EAX << SEP << object.getValue() << endl;                    
                    break;

                case DataType::BOOLEAN:
                    out << '\t' << '\t' << NASM_MOV << ' ' <<  NASM_EAX << SEP << (parse_boolean(object.getValue()) ? 1 : 0) << endl;
                    break;                
            }
        }
    } else {        
        auto object_offset = target_context.scopes.top()->objects.at(object_name)->offset;        
        object_data_type = target_context.scopes.top()->objects.at(object_name)->data_type;
        object_data_type_size = target_context.scopes.top()->objects.at(object_name)->size;

        if(object_data_type_size == __SIZEOF_POINTER__) {
            size_qualifier = QWORD;
            size_register = NASM_RAX;
        }

        out << '\t' << '\t' << NASM_MOV << ' ' << size_register << SEP << '[' << NASM_RBP << '-' << object_offset <<  ']' << endl;
        out << '\t' << '\t' << NASM_MOV << ' ' << size_qualifier << '[' <<  NASM_RBP << '-' << object_offset <<  ']' << SEP << size_register << endl;

    }

    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_R10 << SEP << NASM_RAX << endl;
    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_R11 << SEP << (int)object_data_type << endl;
    return {is_literal, object_data_type, object_data_type_size};   
}