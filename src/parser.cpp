#include "parser.h"
#include <set>
#include <iostream>
#include "keywords.h"
#include "error-messages.h"

using namespace std;

set<TokenType> parser_breaking_tokens = {TokenType::END_OF_FILE, TokenType::INVALID};

bool print_expected_token(const char * expected, Tokenizer & tokenizer) {
    cout << "Syntax Error: Expected " << expected << " at line " << tokenizer.get_line() << " column " << tokenizer.get_column() << endl;        
    return false;
}

bool print_parse_error(const char * message, Tokenizer & tokenizer) {
    cout << " Parse Error: " << message << " at line " << tokenizer.get_line() << " column " << tokenizer.get_column() << endl;
    return false;
}

bool print_duplicated_object(const string & name, Tokenizer & tokenizer) {
    cout << " Semantic Error: " << name << " at line " << tokenizer.get_line() << " column " << tokenizer.get_column() << " is duplicated" << endl;
    return false;
}

bool is_type_token(const unique_ptr<Token> & token) {
    return is_built_type_token(token->getValue());
}



void Parser::push_scope() {
    scopes.push(make_unique<map<string, unique_ptr<SyntaticObject>>>());
}
void Parser::pop_scope() {
    scopes.pop();
}

bool Parser::parse(Tokenizer & tokenizer, std::ostream & out) {

    vector<unique_ptr<Token>> tokens;
    tokens.push_back(move(tokenizer.next()));
    

    if(tokens.back()->getType() == TokenType::PROGRAM) {
        push_scope();
        bool has_valid_variable_declarations = variable_declarations(tokenizer, tokens);
        
        // true when there are no variable declarations or the variable declarations are valid
        if(!has_valid_variable_declarations) { 
            return print_parse_error(MSG_NOT_END_OF_FILE, tokenizer);
        }

        bool is_valid_program = parse_statements_group(tokenizer, tokens);
        
        
        if(!is_valid_program) {
            return print_parse_error(MSG_NOT_END_OF_FILE, tokenizer);
        } 

        tokens.push_back(move(tokenizer.next()));
        bool is_eof = tokens.back()->getType() == TokenType::END_OF_FILE;
        if(!is_eof) {
            return print_expected_token(END_OF_FILE, tokenizer);
        }

        target->write(out, tokens);
        return true;
    } else {
        print_expected_token(PROGRAM, tokenizer);
        return false;
    }
}

bool Parser::parse_statements_group(
    Tokenizer & tokenizer, 
    vector<unique_ptr<Token>> & tokens
) {
    tokens.push_back(move(tokenizer.next()));

    if(tokens.back()->getType() == TokenType::BEGIN) {

        tokens.push_back(move(tokenizer.next()));
        if(tokens.back()->getType() == TokenType::END) {
            
            tokens.push_back(move(tokenizer.next()));
            //TODO: Process statements            
            
            return true;
        }
        
    }
    return false;
}

bool Parser::variable_declarations(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens) {
    unique_ptr<Token> token(move(tokenizer.next()));
 
    if(token->getType() == TokenType::VAR) {
        tokens.push_back(move(token));
        token = move(tokenizer.next());
        string name;
        DataType data_type;

        while(token->getType() == TokenType::IDENTIFIER) {
            name = token->getValue();
            if(scopes.top()->find(name) != scopes.top()->end()) {
                print_duplicated_object(name, tokenizer);
                return false;
            }

            tokens.push_back(move(token));
            token = move(tokenizer.next());
            if(token->getType() != TokenType::COLON){
                print_expected_token(COLON, tokenizer);
                return false;
            }

            tokens.push_back(move(token));
            token = move(tokenizer.next());  
            if(!is_type_token(token)) {

                print_parse_error(MSG_INVALID_TYPE, tokenizer);
                return false;
            }

            data_type = to_data_type(token->getType());
            if(data_type == DataType::UNDEFINED) {
                print_parse_error(MSG_INVALID_TYPE, tokenizer);
                return false;
            }  
            tokens.push_back(move(token));
            scopes.top()->insert({name, make_unique<SyntaticObject>(SyntaticObject{name, ObjectType::VARIABLE, data_type})});
            token = move(tokenizer.next());
        }
    } 

    tokenizer.push_back(move(token));
    return true;
}
