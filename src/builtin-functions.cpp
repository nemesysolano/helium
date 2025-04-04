#include "builtin-functions.h"
#include <set>
#include <vector>
#include <memory>
#include "tokenizer.h"
#include "parser.h"
#include "error-messages.h"
#include "keywords.h"
#include "constraints.h"
#include "names.h"
#include "log.h"

using namespace std;

bool parse_numeric_binary (
    const std::unique_ptr<ParsedScope> & scope, 
    Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, 
    CyclicHash & cyclic_hash, 
    std::map<std::string, size_t> & static_data,
    const char * invalid_type_message,
    const char * mixed_types_message,
    const char * too_many_arguments_message
) {
    tokens.push_back(std::move(tokenizer.next()));

    if(tokens.back()->getType() != TokenType::LEFT_PARENT) {
        return print_expected_token(LEFT_PARENT, tokenizer);        
    }    

    auto data_type = evaluate_expression(scope, tokenizer, tokens, cyclic_hash, static_data);
    if(!(data_type == DataType::INTEGER || data_type == DataType::BIGINT || data_type == DataType::FLOAT)) {
        return print_parse_error(invalid_type_message, tokenizer);
    } 

    DataType first_data_type = data_type;
    auto token(tokenizer.next());
    if(token->getType() != TokenType::COMMA) {
        return print_expected_token(COMMA, tokenizer);        
    }

    data_type = evaluate_expression(scope, tokenizer, tokens, cyclic_hash, static_data);
    if(!(data_type == first_data_type)) {
        return print_parse_error(mixed_types_message, tokenizer);
    }

    tokens.push_back(std::move(tokenizer.next()));
    if(tokens.back()->getType() != TokenType::RIGHT_PARENT) {
        return print_expected_token(RIGHT_PARENT, tokenizer);        
    }
    return true;
}

bool parse_numeric_reducer(
    const std::unique_ptr<ParsedScope> & scope, 
    Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, 
    CyclicHash & cyclic_hash, 
    std::map<std::string, size_t> & static_data,
    const char * invalid_type_message,
    const char * mixed_types_message,
    const char * too_many_arguments_message
) {
    bool has_more = true;
    DataType first_data_type = DataType::UNDEFINED;
    size_t iterations = 0;

    tokens.push_back(std::move(tokenizer.next()));
    if(tokens.back()->getType() != TokenType::LEFT_PARENT) {
        return print_expected_token(LEFT_PARENT, tokenizer);        
    }    

    do {
        auto data_type = evaluate_expression(scope, tokenizer, tokens, cyclic_hash, static_data);
        if(!(data_type == DataType::INTEGER || data_type == DataType::BIGINT || data_type == DataType::FLOAT)) {
            return print_parse_error(invalid_type_message, tokenizer);
        }    

        auto token(tokenizer.next());
        has_more = token->getType() == TokenType::COMMA;

        if(iterations == 0) {
            first_data_type = data_type;
        } else if(data_type != first_data_type) {
            return print_parse_error(mixed_types_message, tokenizer);
        }

        if(!has_more) {
            tokens.push_back(std::move(token));
        } else {
            iterations++;
            if(iterations == MAX_REGISTER_ARGUMENTS) {
                return print_parse_error(too_many_arguments_message, tokenizer);
            }                     
        }
    } while(has_more);

    if(tokens.back()->getType() != TokenType::RIGHT_PARENT) {
        return print_expected_token(RIGHT_PARENT, tokenizer); 
    }

    return true;   
}


bool parse_sum(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data) {
    return parse_numeric_reducer(
        scope, tokenizer, tokens, cyclic_hash, static_data,
        MSG_INVALID_SUM_ARGUMENT,
        MSG_SUM_ARGUMENTS_HAVE_DIFFERENT_TYPES,
        MSG_TOO_MANY_SUM_ARGUMENTS
    );        
}

bool parse_mul(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data) {
    return parse_numeric_reducer(
        scope, tokenizer, tokens, cyclic_hash, static_data,
        MSG_INVALID_MUL_ARGUMENT,
        MSG_MUL_ARGUMENTS_HAVE_DIFFERENT_TYPES,
        MSG_TOO_MANY_MUL_ARGUMENTS
    );   
}


bool parse_sub(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data){
    return parse_numeric_binary(
        scope, tokenizer, tokens, cyclic_hash, static_data,
        MSG_INVALID_SUB_ARGUMENT,
        MSG_SUB_ARGUMENTS_HAVE_DIFFERENT_TYPES,
        MSG_TOO_MANY_SUB_ARGUMENTS
    ); 
}

bool parse_div(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data){
    return parse_numeric_binary(
        scope, tokenizer, tokens, cyclic_hash, static_data,
        MSG_INVALID_DIV_ARGUMENT,
        MSG_DIV_ARGUMENTS_HAVE_DIFFERENT_TYPES,
        MSG_TOO_MANY_DIV_ARGUMENTS
    ); 
}

void init_builtin_functions_map(std::map<std::string, size_t> & builtin_functions) {
    builtin_functions.emplace(BUILTIN_SUM, (size_t)parse_sum);
    builtin_functions.emplace(BUILTIN_MUL, (size_t)parse_mul);
    builtin_functions.emplace(BUILTIN_SUB, (size_t)parse_sub);
    builtin_functions.emplace(BUILTIN_DIV, (size_t)parse_div);
}
