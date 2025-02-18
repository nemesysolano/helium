#include "target-intel-linux.h"
#include <cassert>

using namespace std;


void TargetIntelLinux::variable_declarations(TargetContext & target_context, std::ostream & out) {
    Token * token = target_context.next();

    if(token->getType() == TokenType::VAR) {

        token = target_context.next();
        assert(token->getType() == TokenType::IDENTIFIER);

        while(token->getType() == TokenType::IDENTIFIER) {
            const string & name = token->getValue();
            DataType type;
            
            assert((token = target_context.next())->getType() == TokenType::COLON);
            assert((type = to_data_type((token = target_context.next())->getType())) != DataType::UNDEFINED);

            const string & type_name = token->getValue();
            const size_t size = data_type_size(type);

            out << '\t' << '\t' << NASM_SUB << ' ' << NASM_RSP << SEP << size << COMMENT << name << ':' << ' ' << type_name << endl;

            token = target_context.next();
        }
    } 

    target_context.push_back();
   
}

void TargetIntelLinux::return_statement(TargetContext & target_context, std::ostream & out) {
    assert(target_context.current()->getType() == TokenType::RETURN);

    target_context.next();
    assert(target_context.current()->getType() == TokenType::LEFT_PARENT);

    target_context.next();
    Token & value = * target_context.current();
    auto current_scope = target_context.scopes.top().get();    
    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_RAX << SEP << value.getValue() << endl;
    out << '\t' << '\t' << NASM_JMP << ' ' << current_scope->name << EXIT_SUFFIX << endl;
    target_context.push_back();
}

void TargetIntelLinux::statements(TargetContext & target_context, std::ostream & out) {
    assert(target_context.next()->getType() == TokenType::BEGIN);
   
    while(target_context.current()->getType() != TokenType::END) {
        switch(target_context.current()->getType()) {
            case TokenType::RETURN:
                return_statement(target_context, out);
                break;
            default:
                break;
        }
        target_context.next();
    }

    assert(target_context.next()->getType() == TokenType::END);

}

bool TargetIntelLinux::write(std::ostream & out, const std::vector<std::unique_ptr<Token>> & tokens) {
    stack <unique_ptr<Scope>> scopes;
    TargetContext target_context = {tokens, scopes, 0};
    
    scopes.push(move(make_unique<Scope>(DataType::BIGINT, GLOBAL_SCOPE_NAME)));

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
    statements(target_context, out);
    //
    out << '\t' << '\t' << NASM_XOR << ' ' << NASM_RAX << SEP << 0 << endl;
    out << '\t' << GLOBAL_SCOPE_NAME << EXIT_SUFFIX << ':' << endl;
    out << '\t' << '\t' << NASM_MOV << ' ' << NASM_RSP << SEP << NASM_RBP << endl;
    out << '\t' << '\t' << NASM_POP << ' ' << NASM_RBP << endl;
    out << '\t' << '\t' << NASM_RET << endl;
    out << '\t' << '\t' << NASM_NOP << endl;

    out << "segment .data" << endl;
    out << "segment .bss" << endl;
    scopes.pop();
    out.flush();
    return true;
}