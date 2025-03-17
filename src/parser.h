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
        std::map<std::string, size_t> builtin_functions;
        std::stack<std::unique_ptr<ParsedScope>> scopes;
        std::unique_ptr<Target> target;
        std::map<std::string, size_t> static_data;
        CyclicHash cyclic_hash;

        bool variable_declarations(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);        
        bool parse_return(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        bool parse_print(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        bool parse_builtin_call(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        bool parse_call(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        bool parse_statement(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        bool parse_statements_group(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        void push_scope(const std::string name, DataType data_type);
        void pop_scope();
        bool is_builtin_function(const std::string & name);
        inline bool is_builtin_function(const std::string && name) { const auto name_ = name; return is_builtin_function(name_); }
        void init_builtin_functions_map();
    public:
        inline Parser(std::unique_ptr<Target> & target): target(std::move(target)) {init_builtin_functions_map();}
        inline Parser(std::unique_ptr<Target> && target): target(std::move(target)) {init_builtin_functions_map();}
        bool parse(Tokenizer & tokenizer, std::ostream & out) ;
        
};
#endif