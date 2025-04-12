#ifndef __PARSER_H__
#define __PARSER_H__
#include <vector>
#include  "tokenizer.h"
#include "target.h"
#include "ostream"
#include <vector>
#include <memory>
#include <stack>
#include <map>
#include "enums.h"
#include "text.h"
#include "structs.h"
#include "builtin-functions.h"

class Parser {
    private:
        std::map<std::string, std::unique_ptr<BuiltinFunction>> builtin_functions;
        std::stack<std::unique_ptr<ParsedScope>> scopes;
        std::unique_ptr<Target> target;
        std::map<std::string, size_t> static_data;
        CyclicHash cyclic_hash;

        bool variable_declarations(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);        
        bool parse_return(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        bool parse_print(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        std::unique_ptr<ParseCallResult> parse_builtin_call(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        std::unique_ptr<ParseCallResult> parse_call(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        bool parse_if(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        bool parse_trace(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        bool parse_statement(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        std::unique_ptr<ParseStatementsGroupResult> parse_statements_group(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        std::unique_ptr<ParseStatementsGroupResult> parse_statements_group(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, TokenType start_delimiter, const std::set<TokenType> & end_delimiters); 
        void push_scope(const std::string name, DataType data_type);
        void pop_scope();
        bool is_builtin_function(const std::string & name);
        inline bool is_builtin_function(const std::string && name) { const auto name_ = name; return is_builtin_function(name_); }
    public:
        inline Parser(std::unique_ptr<Target> & target): target(std::move(target)) {init_builtin_functions_map(builtin_functions);}
        inline Parser(std::unique_ptr<Target> && target): target(std::move(target)) {init_builtin_functions_map(builtin_functions);}
        bool parse(Tokenizer & tokenizer, std::ostream & out) ;
        
};
#endif