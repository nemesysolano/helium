#include "parser.h"
#include <set>
#include <iostream>
#include "keywords.h"
#include "error-messages.h"
#include "text.h"

using namespace std;

set<TokenType> parser_breaking_tokens = {TokenType::END_OF_FILE, TokenType::INVALID};

bool Parser::object_matches_return_type(
    const unique_ptr<ParsedScope> & scope,
    const unique_ptr<Token> & token,
    const Tokenizer & tokenizer
) {    
    auto name = token->getValue();
    
    if(scope->objects.count(name) == 0) {
        print_undefined_object(name, tokenizer);
        return false;
    }

    DataType data_type = scope->data_type; 
   //  cout << "DEBUG: " << __LINE__ << ' ' << __FUNCTION__ << endl;    
    const shared_ptr<ParsedObject> & object = scope->objects.at(name);

    //TODO: Implement full expression evaluation. 
    return object->data_type == data_type;    
}


bool Parser::expression_matches_return_type(
    const unique_ptr<ParsedScope> & scope,
    const unique_ptr<Token> & token,
    const Tokenizer & tokenizer
) {

    if(is_literal_token(token)) {
        return literal_matches_type(token, scope->data_type);
    } else if (token->getType() == TokenType::IDENTIFIER) {
        return object_matches_return_type(scope, token, tokenizer);
    } else {
        return false;
    }
}

bool Parser::expression_matches_call_type(
    const shared_ptr<ParsedObject> &root_target, 
    unique_ptr<ParsedScope> & scope,
    unique_ptr<Token> & token,
    Tokenizer & tokenizer
) {

    if(is_literal_token(token)) {
        bool matches = literal_matches_type(token, root_target->data_type);
        if(matches && root_target->data_type == DataType::TEXT || root_target->data_type == DataType::FLOAT) {
            static_data.insert({token->getValue(), cyclic_hash(token->getValue())});
        }

        return matches;
    } else if (token->getType() == TokenType::IDENTIFIER) {

        auto name = token->getValue();

        if(scope->objects.count(name) == 0) {
            print_undefined_object(name, tokenizer);
            return false;
        }

       //  cout << "DEBUG: " << __LINE__ << ' ' << __FUNCTION__ << endl; 
        const shared_ptr<ParsedObject> & object = scope->objects.at(name);
    
        //TODO: Implement full expression evaluation. 
        return object->data_type == root_target->data_type;  

    } else {
        return false;
    }
}


void Parser::push_scope(const std::string name, DataType data_type) {
    scopes.push(move(make_unique<ParsedScope>(
        data_type,
        name
    )));
}
void Parser::pop_scope() {
    scopes.pop();
}

bool Parser::parse(Tokenizer & tokenizer, std::ostream & out) {

    vector<unique_ptr<Token>> tokens;
    tokens.push_back(move(tokenizer.next()));
    

    if(tokens.back()->getType() == TokenType::PROGRAM) {
        push_scope(GLOBAL_SCOPE_NAME, DataType::BIGINT);
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

        target->write(out, tokens, static_data);
        return true;
    } else {
        print_expected_token(PROGRAM, tokenizer);
        return false;
    }
}


bool Parser::parse_call(const shared_ptr<ParsedObject> &root_target, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens) {   
    auto & current_scope = scopes.top();

    tokens.push_back(move(tokenizer.next()));
    if(tokens.back()->getType() != TokenType::LEFT_PARENT) {
        return print_expected_token(LEFT_PARENT, tokenizer);        
    }    

    tokens.push_back(move(tokenizer.next()));
    if(!expression_matches_call_type(root_target, current_scope, tokens.back(), tokenizer)) {
        return print_parse_error(MSG_ASSIGMENT_DATATYPE_MISTMATCH, tokenizer);
    }   

    tokens.push_back(move(tokenizer.next()));
    if(tokens.back()->getType() != TokenType::RIGHT_PARENT) {
        return print_expected_token(RIGHT_PARENT, tokenizer); 
    }

    return true;
}

bool Parser::parse_call(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens) {   
    auto & current_scope = scopes.top();
    auto const & target_name = tokens.back()->getValue();

    if(current_scope->objects.count(target_name) == 0) {
        print_parse_error(MSG_INVALID_CALL_TARGET, tokenizer);
    }
   //  cout << "DEBUG: " << __LINE__ << ' ' << __FUNCTION__ << endl; 
    auto const & root_target = current_scope->objects.at(target_name);

    return parse_call(root_target, tokenizer, tokens);
    
}

bool Parser::parse_return(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens) {
    tokens.push_back(move(tokenizer.next()));
    if(tokens.back()->getType() != TokenType::LEFT_PARENT) {
        return print_expected_token(LEFT_PARENT, tokenizer);        
    }

    tokens.push_back(move(tokenizer.next()));        
    if(!expression_matches_return_type(scopes.top(), tokens.back(), tokenizer)) {
        print_parse_error(MSG_RETURN_DATATYPE_MISTMATCH, tokenizer);
    }   
    
    tokens.push_back(move(tokenizer.next()));
    if(tokens.back()->getType() != TokenType::RIGHT_PARENT) {
        return print_expected_token(RIGHT_PARENT, tokenizer); 
    }

    return true;
}

bool Parser::parse_statement(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens) {
    if(!is_statement_token(tokens.back())) {
        return print_parse_error(MSG_INVALID_STATEMENT, tokenizer);
    }

    auto type = tokens.back()->getType();

    switch(type) {
        case TokenType::RETURN: 
            return parse_return(tokenizer, tokens);
        case TokenType::IDENTIFIER:
            return parse_call(tokenizer, tokens);
        default:
            return false;
    }
    
}

bool Parser::parse_statements_group(Tokenizer & tokenizer, vector<unique_ptr<Token>> & tokens) {
    tokens.push_back(move(tokenizer.next()));
    
    if(tokens.back()->getType() == TokenType::BEGIN) {
        bool is_valid_statement;
        
        tokens.push_back(move(tokenizer.next()));

        while(tokens.back()->getType() != TokenType::END) {
            //TODO: Process statement 
            is_valid_statement = parse_statement(tokenizer, tokens);
            tokens.push_back(move(tokenizer.next()));                      

            if(!is_valid_statement) {
                return false;
            }
        }

        return true;
        
    } else {
        return print_expected_token(BEGIN, tokenizer);
    }
}

bool Parser::variable_declarations(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens) {
    unique_ptr<Token> token(move(tokenizer.next()));
    size_t offset = 0;

    if(token->getType() == TokenType::VAR) {
        tokens.push_back(move(token));
        token = move(tokenizer.next());
        string name;
        DataType data_type;
        std::map<std::string, std::shared_ptr<ParsedObject>> & scope_objects = scopes.top()->objects; 

        while(token->getType() == TokenType::IDENTIFIER) {
            name = token->getValue();
            if(scope_objects.find(name) != scope_objects.end()) {
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
            scope_objects.insert({name, make_shared<ParsedObject>(ParsedObject{offset, name, ObjectType::VARIABLE, data_type})});
            offset += data_type_size(data_type);
            token = move(tokenizer.next());
        }
    } 

    tokenizer.push_back(move(token));
    return true;
}
