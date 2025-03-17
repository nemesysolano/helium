#include "builtin-functions.h"
#include <set>
#include <vector>
#include <memory>
#include "tokenizer.h"
#include "parser.h"
#include "error-messages.h"
#include "keywords.h"

using namespace std;
extern const std::string BUILTIN_SUM("SUM");

set<string> builtin_functions = {BUILTIN_SUM};

bool is_builtin_function(const string & name) {
    return builtin_functions.count(name) > 0;
}

bool parse_sum(unique_ptr<ParsedScope> &current_scope, Tokenizer & tokenizer, vector<unique_ptr<Token>> & tokens) {
    /* *
    bool has_more = true;
    DataType first_data_type = DataType::UNDEFINED;
    size_t iterations = 0;
    const size_t max_arguments = 6;

    tokens.push_back(move(tokenizer.next()));
    if(tokens.back()->getType() != TokenType::LEFT_PARENT) {
        return print_expected_token(LEFT_PARENT, tokenizer);        
    }    

    do {
        auto data_type = evaluate_expression(current_scope, tokenizer, tokens);
        if(!(data_type == DataType::INTEGER || data_type == DataType::BIGINT || data_type == DataType::FLOAT)) {
            return print_parse_error(MSG_INVALID_SUM_ARGUMENT, tokenizer);
        }    

        auto token(tokenizer.next());

        has_more = token->getType() == TokenType::COMMA;
        if(iterations == 0) {
            first_data_type = data_type;
        } else if(data_type != first_data_type) {
            return print_parse_error(MSG_SUM_ARGUMENTS_HAVE_DIFFERENT_TYPES, tokenizer);
        }

        iterations++;
        if(max_arguments < iterations) {
            return print_parse_error(MSG_TOO_MANY_SUM_ARGUMENTS, tokenizer);
        }
        
        if(!has_more) {
            tokens.push_back(move(token));
        }        
    } while(has_more);

    if(tokens.back()->getType() != TokenType::RIGHT_PARENT) {
        return print_expected_token(RIGHT_PARENT, tokenizer); 
    }
    /* */
    return true;        
}
