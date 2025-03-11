#include "target-intel-linux.h"
#include <cassert>
#include "text.h"
#include "log.h"
#include "target-intel-support-functions.h"

using namespace std;

const char * STATIC_PREFIX = "_static_";

void TargetIntelLinux::variable_declarations(TargetContext & target_context, std::ostream & out) {
    Token * token = target_context.next();
    const auto & current_scope = target_context.scopes.top();
    size_t offset = 0;

    if(token->getType() == TokenType::VAR) {

        token = target_context.next();
        assert(token->getType() == TokenType::IDENTIFIER);

        while(token->getType() == TokenType::IDENTIFIER) {
            const string & name = token->getValue();
            DataType data_type;
            
            assert((token = target_context.next())->getType() == TokenType::COLON);
            assert((data_type = to_data_type((token = target_context.next())->getType())) != DataType::UNDEFINED);

            const string & type_name = token->getValue();
            const size_t size = data_type_size(data_type);

            offset += size;
            current_scope->objects.insert({name, make_shared<TargetObject>(name, data_type, ObjectType::VARIABLE, size, offset)});
            
            out << '\t' << '\t' << NASM_SUB << ' ' << NASM_RSP << SEP << size << COMMENT << name << ':' << ' ' << type_name << endl;

            token = target_context.next();
        }
    } 

    target_context.push_back();
   
}

void TargetIntelLinux::return_statement(TargetContext & target_context, std::ostream & out, const map<string, size_t> &static_data) {
    const auto & scope_name = target_context.scopes.top().get()->name;    
    assert(target_context.current()->getType() == TokenType::RETURN);
    
    target_context.next();
    assert(target_context.current()->getType() == TokenType::LEFT_PARENT);

    target_context.next();
    evaluate_expression(target_context, out, static_data);

    target_context.next();
    assert(target_context.current()->getType() == TokenType::RIGHT_PARENT);

    out << '\t' << '\t' << NASM_JMP << ' ' << scope_name << EXIT_SUFFIX << endl;
}

ExpressionResult TargetIntelLinux::evaluate_expression(TargetContext & target_context, ostream & out, const map<string, size_t> & static_data){     
    auto const & object = * target_context.current();
    auto const & object_name = object.getValue();
    auto object_type = object.getType();
    auto object_data_type = to_data_type(object_type);
    auto object_data_type_size = data_type_size(object_data_type);
    const char * size_qualifier = DWORD;
    const char * size_register = NASM_EAX;
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

    return {is_literal, object_data_type, object_data_type_size};
}

void TargetIntelLinux::print_statement(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data) {    
    const auto & scope_name = target_context.scopes.top().get()->name;    
    assert(target_context.current()->getType() == TokenType::PRINT);
    
    target_context.next();
    assert(target_context.current()->getType() == TokenType::LEFT_PARENT);

    target_context.next();
    auto result = evaluate_expression(target_context, out, static_data);

    switch(result.data_type) {
        case DataType::TEXT:
            call_print_string(out, NASM_RAX);   
            break;
        case DataType::FLOAT:
            call_print_float(out, NASM_RAX, 12, 6);
            break;
        case DataType::BIGINT:
            call_print_bigint(out, NASM_RAX);
            break;
        case DataType::INTEGER:
            call_print_integer(out, NASM_EAX);
            break;
    }
    
    target_context.next();
    assert(target_context.current()->getType() == TokenType::RIGHT_PARENT);
}

void TargetIntelLinux::call_statement(TargetContext & target_context, ostream & out, const map<string, size_t> & static_data){ //TODO: Only handles
    const auto & object  = * target_context.current();
    const auto & object_name = object.getValue();
    const auto object_data_type = to_data_type(object.getType());
    const auto object_data_type_size = data_type_size(object_data_type);
    const auto object_offset = target_context.scopes.top()->objects.at(object_name)->offset; 
    const char * size_qualifier = DWORD;
    const char * size_register = NASM_EAX;

    assert(target_context.current()->getType() == TokenType::IDENTIFIER);
    
    target_context.next();
    assert(target_context.current()->getType() == TokenType::LEFT_PARENT);

    target_context.next();
    auto result = evaluate_expression(target_context, out, static_data);
    if(object_data_type_size == __SIZEOF_POINTER__) {
        size_qualifier = QWORD;
        size_register = NASM_RAX;
    }    
    out << '\t' << '\t' << NASM_MOV << ' ' << size_qualifier << '[' <<  NASM_RBP << '-' << object_offset <<  ']' << SEP << size_register << endl;    

    target_context.next();
    assert(target_context.current()->getType() == TokenType::RIGHT_PARENT);

}

void TargetIntelLinux::statements(TargetContext & target_context, ostream & out, const map<string, size_t> & static_data) {
    assert(target_context.next()->getType() == TokenType::BEGIN);
   
    while(target_context.current()->getType() != TokenType::END) {

        switch(target_context.current()->getType()) {
            case TokenType::RETURN:
                return_statement(target_context, out, static_data);
                break;

            case TokenType::IDENTIFIER: 
                call_statement(target_context, out, static_data);
                break;

            case TokenType::PRINT:        
                print_statement(target_context, out, static_data);
                break;

            default:
                break;
        }
        target_context.next();
    }

    assert(target_context.next()->getType() == TokenType::END);

}

bool TargetIntelLinux::write(std::ostream & out, const std::vector<std::unique_ptr<Token>> & tokens, const std::map<std::string, size_t> & static_data) {
    stack <unique_ptr<TargetScope>> scopes;
    TargetContext target_context = {tokens, scopes, 0};
    scopes.push(move(make_unique<TargetScope>(DataType::BIGINT, GLOBAL_SCOPE_NAME)));

    // Write the tokens to a file
    assert(target_context.next()->getType() == TokenType::PROGRAM);
    out << "default rel" << endl;
    out << "section .note.GNU-stack noalloc noexec nowrite progbits" << endl;
    support_functions(out);    
    out << "section .data   align=8" << endl;
    for(const auto & static_data_entry : static_data) {
        const char * asm_type = static_data_entry.first.at(0) == '"' ? NASM_DB : NASM_DQ;
        out << '\t' << STATIC_PREFIX << static_data_entry.second << ':' << ' ' << asm_type << ' ' << static_data_entry.first << endl; //TODO: DB must be a null terminated string
    }

    out << "section .text   align=1" << endl;
    out << '\t' << "global main" << endl;
    out << '\t' << "main:" << endl;
    out << '\t' << '\t' << NASM_PUSH << ' ' << NASM_RBP << endl;
    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_RBP << SEP << NASM_RSP << endl;    
    //
    variable_declarations(target_context, out);
    statements(target_context, out, static_data);
    //
    out << '\t' << '\t' << NASM_XOR << ' ' << NASM_RAX << SEP << 0 << endl;
    out << '\t' << GLOBAL_SCOPE_NAME << EXIT_SUFFIX << ':' << endl;
    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_RSP << SEP << NASM_RBP << endl;
    out << '\t' << '\t' << NASM_POP << ' ' << NASM_RBP << endl;
    out << '\t' << '\t' << NASM_RET << endl;
    out << '\t' << '\t' << NASM_NOP << endl;

    scopes.pop();
    out.flush();
    return true;
}

