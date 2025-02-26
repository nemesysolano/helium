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
       //  cout << "DEBUG: " << __LINE__ << ' ' << __FUNCTION__ << endl; 
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

void TargetIntelLinux::evaluate_call_expression(TargetContext & target_context, ostream & out, const map<string, size_t> & static_data){ //TODO: Implement recusrive expression evaluation
    auto const & called = *target_context.current();
    auto const & called_name = called.getValue();
    auto const called_type = called.getType();
    auto const called_offset = target_context.scopes.top()->objects.at(called_name)->offset;
    auto const called_data_type = target_context.scopes.top()->objects.at(called_name)->data_type;

    target_context.next();
    assert(target_context.current()->getType() == TokenType::LEFT_PARENT);

    target_context.next();
    auto const & object = * target_context.current();
    assert(object.getType() == TokenType::IDENTIFIER || is_literal_token_type(object.getType()));

    if(is_literal_token_type(object.getType())){
        switch(called_data_type) {
            case DataType::TEXT:
                out << '\t' << '\t' << NASM_LEA << ' ' << NASM_RDX << SEP << STATIC_PREFIX << static_data.at(object.getValue()) << endl;
                out << '\t' << '\t' << NASM_MOV << ' ' << QWORD << '[' << NASM_RBP << '-' << called_offset <<  ']' << SEP << NASM_RDX << endl;            
                break;
            case DataType::BIGINT:
                out << '\t' << '\t' << NASM_MOV << ' ' << QWORD << '[' << NASM_RBP << '-' << called_offset <<  ']' << SEP << object.getValue() << endl;
                break;

            case DataType::FLOAT:
                out << '\t' << '\t' << NASM_MOV << ' ' << QWORD << '[' << NASM_RBP << '-' << called_offset <<  ']' << SEP << STATIC_PREFIX << static_data.at(object.getValue()) << endl;
                break;

            case DataType::INTEGER:
                out << '\t' << '\t' << NASM_MOV << ' ' << DWORD << '[' << NASM_RBP << '-' << called_offset <<  ']' << SEP << object.getValue() << endl;
                break;

            case DataType::BOOLEAN:
                out << '\t' << '\t' << NASM_MOV << ' ' << DWORD << '[' << NASM_RBP << '-' << called_offset <<  ']' << SEP << (parse_boolean(object.getValue()) ? 1 : 0) << endl;
                break;
        }

    } else {
        auto const object_offset = target_context.scopes.top()->objects.at(object.getValue())->offset;
        const char * size_qualifier = DWORD;
        const char * size_register = NASM_EDX;

        if(data_type_size(called_data_type) == __SIZEOF_POINTER__) {
            size_qualifier = QWORD;
            size_register = NASM_RDX;
        }

        out << '\t' << '\t' << NASM_MOV << ' ' << size_register << SEP << '[' << NASM_RBP << '-' << object_offset <<  ']' << endl;
        out << '\t' << '\t' << NASM_MOV << ' ' << size_qualifier << '[' <<  NASM_RBP << '-' << called_offset <<  ']' << SEP << size_register << endl;

    }

    target_context.next();
    assert(target_context.current()->getType() == TokenType::RIGHT_PARENT);
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


    out << "segment .text" << endl;
    out << '\t' << "global _start" << endl;
    out << '\t' << "_start:" << endl;
    out << '\t' << '\t' << "CALL _bootstrap" << endl;
    out << '\t' << '\t' << NASM_XOR << ' ' << NASM_RBX << SEP << NASM_RBX << endl;
    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_RBX << SEP << NASM_RAX << endl; // Exit status
    out << '\t' << '\t' << NASM_XOR << ' ' << NASM_RAX << SEP << NASM_RAX << endl;
    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_AL << ", 0x1" << endl;
    out << '\t' << '\t' << "INT 0x80" << endl;

    out << '\t' << "_bootstrap:" << endl;
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

    out << "segment .data" << endl;
    for(const auto & static_data_entry : static_data) {
       //  cout << "DEBUG: " << __LINE__ << ' ' << __FUNCTION__ << endl; 
        const char * asm_type = static_data_entry.first.at(0) == '"' ? NASM_DB : NASM_DQ;
        out << '\t' << STATIC_PREFIX << static_data_entry.second << ':' << ' ' << asm_type << ' ' << static_data_entry.first << endl; //TODO: DB must be a null terminated string
    }
    out << "segment .bss" << endl;
    scopes.pop();
    out.flush();
    return true;
}

