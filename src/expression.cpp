#include "expression.h"
#include "log.h"
#include "text.h"
using namespace std;
DataType evaluate_expression(const unique_ptr<ParsedScope> & scope, Tokenizer & tokenizer, vector<std::unique_ptr<Token>> & tokens, CyclicHash & cyclic_hash, map<string, size_t> & static_data) {
    tokens.push_back(move(tokenizer.next()));
    const auto & token = tokens.back();

    if(scope->objects.count(token->getValue()) > 0) {
        return scope->objects.at(token->getValue())->data_type;

    } else if(is_literal_token(token)) {  
        auto literal_data_type = to_data_type(token->getType());     

        if(literal_data_type == DataType::TEXT || literal_data_type == DataType::FLOAT) {
            static_data.insert({token->getValue(), cyclic_hash(token->getValue())});
        }
        return literal_data_type;

    } else {
        return DataType::UNDEFINED;

    }
}