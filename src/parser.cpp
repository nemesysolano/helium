#include "parser.h"
#include <set>
#include <iostream>
#include "keywords.h"
#include "error-messages.h"
#include "text.h"
#include "log.h"
#include "builtin-functions.h"
#include "expression.h"
using namespace std;

set<TokenType> parser_breaking_tokens = {TokenType::END_OF_FILE, TokenType::INVALID};

bool Parser::is_builtin_function(const string & name) {
    size_t count = builtin_functions.count(name);
    return count > 0;
}

void Parser::push_scope(const std::string name, DataType data_type) {
    scopes.push(std::move(make_unique<ParsedScope>(
        data_type,
        name
    )));
}
void Parser::pop_scope() {
    scopes.pop();
}

bool Parser::parse(Tokenizer & tokenizer, std::ostream & out) {

    vector<unique_ptr<Token>> tokens;
    tokens.push_back(std::move(tokenizer.next()));
    

    if(tokens.back()->getType() == TokenType::PROGRAM) {
        push_scope(GLOBAL_SCOPE_NAME, DataType::BIGINT);
        bool has_valid_variable_declarations = variable_declarations(tokenizer, tokens);
        
        // true when there are no variable declarations or the variable declarations are valid
        if(!has_valid_variable_declarations) { 
            return print_parse_error(MSG_NOT_END_OF_FILE, tokenizer);
        }

        bool is_valid_program = parse_statements_group(tokenizer, tokens)->is_valid;
        
        if(!is_valid_program) {
            return print_parse_error(MSG_NOT_END_OF_FILE, tokenizer);
        } 

        tokens.push_back(std::move(tokenizer.next()));
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

std::unique_ptr<ParseCallResult> Parser::parse_builtin_call(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens) {
    auto & current_scope = scopes.top();
    auto const & target_name = tokens.back()->getValue();
    
    size_t pointer =  builtin_functions.at(target_name);
    builtin_parser builtin_function_parser = (builtin_parser)pointer;
        
    bool result = builtin_function_parser(current_scope, tokenizer, tokens, cyclic_hash, static_data);
    return std::move(make_unique<ParseCallResult>(result, current_scope->data_type));
}

std::unique_ptr<ParseCallResult> Parser::parse_call(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens) {   
    auto & current_scope = scopes.top();
    auto const & target_name = tokens.back()->getValue();
    auto identifier_is_building_function = is_builtin_function(target_name);
    DataType data_type = DataType::UNDEFINED;

    if(current_scope->objects.count(target_name) == 0 && !identifier_is_building_function) {
        return std::move(make_unique<ParseCallResult>(print_parse_error(MSG_INVALID_CALL_TARGET, tokenizer), DataType::UNDEFINED));
    }
    
    if(identifier_is_building_function) {      
        return std::move(parse_builtin_call(tokenizer, tokens));
    } else {
        auto const & root_target = current_scope->objects.at(target_name);

        tokens.push_back(std::move(tokenizer.next()));
        if(tokens.back()->getType() != TokenType::LEFT_PARENT) {
            return std::move(make_unique<ParseCallResult>(print_expected_token(LEFT_PARENT, tokenizer), DataType::UNDEFINED));          
        }    

        data_type = evaluate_expression(current_scope, tokenizer, tokens, cyclic_hash, static_data);

        if(data_type != root_target->data_type) {
            return std::move(make_unique<ParseCallResult>(print_parse_error(MSG_ASSIGMENT_DATATYPE_MISTMATCH, tokenizer), DataType::UNDEFINED));
        }

        tokens.push_back(std::move(tokenizer.next()));
        if(tokens.back()->getType() != TokenType::RIGHT_PARENT) {
            return std::move(make_unique<ParseCallResult>(print_expected_token(RIGHT_PARENT, tokenizer), DataType::UNDEFINED));
        }
        
        return std::move(make_unique<ParseCallResult>(true, data_type));
    }
}

bool Parser::parse_trace(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens) {
    tokens.push_back(std::move(tokenizer.next()));
    if(tokens.back()->getType() != TokenType::LEFT_PARENT) {
        return print_expected_token(LEFT_PARENT, tokenizer);        
    }       

    //TODO: More keywords might be added on the future.

    tokens.push_back(std::move(tokenizer.next()));
    if(tokens.back()->getType() != TokenType::RIGHT_PARENT) {
        return print_expected_token(RIGHT_PARENT, tokenizer); 
    }
    
    return true;
}

bool Parser::parse_print(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens) {
    auto & current_scope = scopes.top();
    bool has_more = true;

    tokens.push_back(std::move(tokenizer.next()));
    if(tokens.back()->getType() != TokenType::LEFT_PARENT) {
        return print_expected_token(LEFT_PARENT, tokenizer);        
    }    

    do {
        auto data_type =  evaluate_expression(current_scope, tokenizer, tokens, cyclic_hash, static_data);
        if(data_type == DataType::UNDEFINED || data_type == DataType::USER_DEFINED) {
            return print_parse_error(MSG_INVALID_PRINT_ARGUMENT, tokenizer);
        }    

        auto token(tokenizer.next());
        has_more = token->getType() == TokenType::COMMA;

        if(!has_more) {
            tokens.push_back(std::move(token));
        }        
    } while(has_more);

    if(tokens.back()->getType() != TokenType::RIGHT_PARENT) {
        return print_expected_token(RIGHT_PARENT, tokenizer); 
    }
    
    return true;
}

bool Parser::parse_return(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens) {
    auto & current_scope = scopes.top();

    tokens.push_back(std::move(tokenizer.next()));
    if(tokens.back()->getType() != TokenType::LEFT_PARENT) {
        return print_expected_token(LEFT_PARENT, tokenizer);
    }    

    auto data_type = evaluate_expression(current_scope, tokenizer, tokens, cyclic_hash, static_data);    
    if(data_type != current_scope->data_type) {
        return print_parse_error(MSG_RETURN_DATATYPE_MISTMATCH, tokenizer);
    }   

    tokens.push_back(std::move(tokenizer.next()));
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
            return parse_call(tokenizer, tokens)->is_valid;
        case TokenType::PRINT:
            return parse_print(tokenizer, tokens);
        case TokenType::TRACE:
            return parse_trace(tokenizer, tokens);
        default:
            return false;
    }
    
}
unique_ptr<ParseStatementsGroupResult> Parser::parse_statements_group(Tokenizer & tokenizer, vector<unique_ptr<Token>> & tokens) {
    int statements_count = 0;

    tokens.push_back(std::move(tokenizer.next()));
    
    if(tokens.back()->getType() == TokenType::BEGIN) {
        bool is_valid_statement;
        
        tokens.push_back(std::move(tokenizer.next()));

        while(tokens.back()->getType() != TokenType::END) {
            is_valid_statement = parse_statement(tokenizer, tokens);
            tokens.push_back(std::move(tokenizer.next()));                      

            statements_count++;
            if(!is_valid_statement) {
                return std::move(make_unique<ParseStatementsGroupResult>(false, statements_count));
            }                        
        }

        return std::move(make_unique<ParseStatementsGroupResult>(true, statements_count));
        
    } else {
        return std::move(make_unique<ParseStatementsGroupResult>(print_expected_token(BEGIN, tokenizer), statements_count));    
    }
}

bool Parser::variable_declarations(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens) {
    unique_ptr<Token> token(std::move(tokenizer.next()));
    size_t offset = 0;

    if(token->getType() == TokenType::VAR) {
        tokens.push_back(std::move(token));
        token = std::move(tokenizer.next());
        string name;
        DataType data_type;
        std::map<std::string, std::shared_ptr<ParsedObject>> & scope_objects = scopes.top()->objects; 

        while(token->getType() == TokenType::IDENTIFIER) {
            name = token->getValue();
            if(is_builtin_function(name)) {
                return print_builtin_object(name, tokenizer);
            }

            if(scope_objects.find(name) != scope_objects.end()) {
                return print_duplicated_object(name, tokenizer);
            }

            tokens.push_back(std::move(token));
            token = std::move(tokenizer.next());
            if(token->getType() != TokenType::COLON){
                return print_expected_token(COLON, tokenizer);
            }

            tokens.push_back(std::move(token));
            token = std::move(tokenizer.next());  
            if(!is_type_token(token)) {
                return print_parse_error(MSG_INVALID_TYPE, tokenizer);
            }

            data_type = to_data_type(token->getType());
            if(data_type == DataType::UNDEFINED) {
                return print_parse_error(MSG_INVALID_TYPE, tokenizer);
            }  

            tokens.push_back(std::move(token));
            scope_objects.insert({name, make_shared<ParsedObject>(ParsedObject{offset, name, ObjectType::VARIABLE, data_type})});
            offset += data_type_size(data_type);
            token = std::move(tokenizer.next());
        }
    } 

    tokenizer.push_back(std::move(token));
    return true;
}
