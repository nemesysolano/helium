#ifndef __EXPRESSION_H__
#define __EXPRESSION_H__
#include <vector>
#include <map>
#include <memory>
#include "tokenizer.h"
#include "enums.h"
#include "parser.h"
DataType evaluate_expression(const std::unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, std::vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, std::map<std::string, size_t> & static_data);
#endif