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
struct ParsedObject {
    size_t offset;
    std::string name;
    ObjectType object_type;
    DataType data_type;
};

struct ParsedScope {
    DataType data_type;
    std::string name;
    std::map<std::string, std::shared_ptr<ParsedObject>> objects;
    inline ParsedScope(DataType data_type, const std::string & name): data_type(data_type), name(name) {}
};

class Parser {
    private:
        std::stack<std::unique_ptr<ParsedScope>> scopes;
        std::unique_ptr<Target> target;
        std::map<std::string, size_t> static_data;
        CyclicHash cyclic_hash;

        bool object_matches_return_type(const std::unique_ptr<ParsedScope> & scope, const std::unique_ptr<Token> & token, const Tokenizer & tokenizer);
        bool expression_matches_return_type(const std::unique_ptr<ParsedScope> & scope, const std::unique_ptr<Token> & token, const Tokenizer & tokenizer);
        bool expression_matches_call_type(const std::shared_ptr<ParsedObject> &root_target, std::unique_ptr<ParsedScope> & scope, std::unique_ptr<Token> & token, Tokenizer & tokenizer);
        bool variable_declarations(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);        
        bool parse_return(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        bool parse_print(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        bool parse_call(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        bool parse_call(const std::shared_ptr<ParsedObject> &root_target, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        bool parse_statement(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        bool parse_statements_group(Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens);
        void push_scope(const std::string name, DataType data_type);
        void pop_scope();
    public:
        Parser(std::unique_ptr<Target> & target): target(std::move(target)) {}
        Parser(std::unique_ptr<Target> && target): target(std::move(target)) {}
        bool parse(Tokenizer & tokenizer, std::ostream & out) ;
        
};
#endif