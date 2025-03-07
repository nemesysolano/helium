#include "target-intel-linux.h"
#include <cassert>
#include "text.h"

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

void TargetIntelLinux::evaluate_return_expression(TargetContext & target_context, std::ostream & out) {
    target_context.next();
    assert(target_context.current()->getType() == TokenType::LEFT_PARENT);

    target_context.next();
    Token & object = * target_context.current(); //TODO: Implement recursive expression evaluation
    if(object.getType() == TokenType::IDENTIFIER) {

        size_t offset = target_context.scopes.top()->objects.at(object.getValue())->offset;
        out << '\t' << '\t' << NASM_MOV << ' ' << NASM_RAX << SEP << '[' << NASM_RBP << '-' << offset <<  ']' << endl;
    } else { //Literal
        out << '\t' << '\t' << NASM_MOV << ' ' << NASM_RAX << SEP << object.getValue() << endl;
    }

    target_context.next();
    assert(target_context.current()->getType() == TokenType::RIGHT_PARENT);

}

void TargetIntelLinux::return_statement(TargetContext & target_context, std::ostream & out) {
    const auto & scope_name = target_context.scopes.top().get()->name;    
    assert(target_context.current()->getType() == TokenType::RETURN);
    
    evaluate_return_expression(target_context, out);   

    out << '\t' << '\t' << NASM_JMP << ' ' << scope_name << EXIT_SUFFIX << endl;
    target_context.push_back();
}

ExpressionResult TargetIntelLinux::evaluate_call_expression(
    TargetContext & target_context, 
    ostream & out, 
    const map<string, size_t> & static_data,
    const Token & called
){ 
    auto const & called_name = called.getValue();
    auto const called_type = called.getType();
    auto const called_offset = target_context.scopes.top()->objects.at(called_name)->offset;
    auto const called_data_type = target_context.scopes.top()->objects.at(called_name)->data_type;
    auto const called_data_type_size = data_type_size(called_data_type);
    const char * size_qualifier = DWORD;
    const char * size_register = NASM_EAX;
    bool is_literal = false;

    target_context.next();
    assert(target_context.current()->getType() == TokenType::LEFT_PARENT);

    target_context.next();
    auto const & object = * target_context.current();
    assert(object.getType() == TokenType::IDENTIFIER || is_literal_token_type(object.getType()));

    if(is_literal_token_type(object.getType())){
        is_literal = true;

        if(called_data_type == DataType::TEXT || called_data_type == DataType::FLOAT || called_data_type == DataType::BIGINT) {            
            switch(called_data_type) {
                case DataType::TEXT:
                    out << '\t' << '\t' << NASM_LEA << ' ' << NASM_RAX << SEP << STATIC_PREFIX << static_data.at(object.getValue()) << endl;
                    break;
                    
                case DataType::BIGINT:                    
                    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_RAX << SEP << object.getValue() << endl;
                    break;

                case DataType::FLOAT:
                    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_RAX << SEP << STATIC_PREFIX << static_data.at(object.getValue()) << endl;

                    break;
            }
            out << '\t' << '\t' << NASM_MOV << ' ' << QWORD << '[' << NASM_RBP << '-' << called_offset <<  ']' << SEP << NASM_RAX << endl;
        } else
            switch(called_data_type) {
                case DataType::INTEGER:
                    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_EAX << SEP << object.getValue() << endl;                    
                    break;

                case DataType::BOOLEAN:
                    out << '\t' << '\t' << NASM_MOV << ' ' <<  NASM_EAX << SEP << (parse_boolean(object.getValue()) ? 1 : 0) << endl;
                    break;                
            }

            out << '\t' << '\t' << NASM_MOV << ' ' << DWORD << '[' << NASM_RBP << '-' << called_offset <<  ']' << SEP << NASM_EAX << endl;
    } else {
        auto const object_offset = target_context.scopes.top()->objects.at(object.getValue())->offset;        
        if(called_data_type_size == __SIZEOF_POINTER__) {
            size_qualifier = QWORD;
            size_register = NASM_RAX;
        }

        out << '\t' << '\t' << NASM_MOV << ' ' << size_register << SEP << '[' << NASM_RBP << '-' << object_offset <<  ']' << endl;
        out << '\t' << '\t' << NASM_MOV << ' ' << size_qualifier << '[' <<  NASM_RBP << '-' << called_offset <<  ']' << SEP << size_register << endl;

    }

    target_context.next();
    assert(target_context.current()->getType() == TokenType::RIGHT_PARENT);

    return {is_literal, called_data_type, called_data_type_size, called_offset};
}

ExpressionResult TargetIntelLinux::evaluate_call_expression(TargetContext & target_context, ostream & out, const map<string, size_t> & static_data){ //TODO: Implement recusrive expression evaluation
    auto const & called = *target_context.current();
    return evaluate_call_expression(target_context, out, static_data, called);
}

void TargetIntelLinux::print_statement(TargetContext & target_context, std::ostream & out, const std::map<std::string, size_t> & static_data) {
    assert(target_context.current()->getType() == TokenType::PRINT);
    target_context.next();
    
    assert(target_context.current()->getType() == TokenType::LEFT_PARENT);

    target_context.next();
    const Token & called = * target_context.current();
    
    target_context.push_back(2);
    ExpressionResult result = evaluate_call_expression(target_context, out, static_data, called);
}

void TargetIntelLinux::call_statement(TargetContext & target_context, ostream & out, const map<string, size_t> & static_data){
    assert(target_context.current()->getType() == TokenType::IDENTIFIER);
    
    evaluate_call_expression(target_context, out, static_data);
}

void TargetIntelLinux::statements(TargetContext & target_context, ostream & out, const map<string, size_t> & static_data) {
    assert(target_context.next()->getType() == TokenType::BEGIN);
   
    while(target_context.current()->getType() != TokenType::END) {

        switch(target_context.current()->getType()) {
            case TokenType::RETURN:
                return_statement(target_context, out);
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
    out << "section .note.GNU-stack noalloc noexec nowrite progbits" << endl;
    out << "segment .data" << endl;
    for(const auto & static_data_entry : static_data) {
        const char * asm_type = static_data_entry.first.at(0) == '"' ? NASM_DB : NASM_DQ;
        out << '\t' << STATIC_PREFIX << static_data_entry.second << ':' << ' ' << asm_type << ' ' << static_data_entry.first << endl; //TODO: DB must be a null terminated string
    }

    out << "segment .text" << endl;
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

