#ifndef __BUILTIN_FUNCTIONS_H__
#define __BUILTIN_FUNCTIONS_H__
#include <string>
#include <memory>
#include <vector>
#include <map>
#include "structs.h"
#include "tokenizer.h"
#include "text.h"
#include "enums.h"

typedef bool (*builtin_parser)(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data);

bool parse_numeric_reducer(
    const std::unique_ptr<ParsedScope> & scope, 
    Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, 
    CyclicHash & cyclic_hash, 
    std::map<std::string, size_t> & static_data,
    const char * invalid_type_message,
    const char * mixed_types_message,
    const char * too_many_arguments_message
);
bool parse_numeric_binary (
    const std::unique_ptr<ParsedScope> & scope, 
    Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, 
    CyclicHash & cyclic_hash, 
    std::map<std::string, size_t> & static_data,
    const char * invalid_type_message,
    const char * mixed_types_message,
    const char * too_many_arguments_message
);
bool parse_sum(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data);
bool parse_mul(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data);
bool parse_sub(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data);
bool parse_div(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data);
bool parse_lt(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data);
bool parse_gt(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data);
bool parse_ne(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data);
bool parse_eq(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data);
bool parse_le(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data);
bool parse_ge(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data);



DataType evaluate_expression(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data);
void init_builtin_functions_map(std::map<std::string, size_t> & builtin_functions);

#endif