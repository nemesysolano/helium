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

extern const std::string BUILTIN_SUM;

bool parse_sum(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data);
DataType evaluate_expression(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data);

#endif