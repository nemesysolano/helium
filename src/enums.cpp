#include "enums.h"
#include <set>
using namespace std;
DataType to_data_type(TokenType token_type) {
    switch(token_type) {
        case TokenType::INTEGER:
        case TokenType::INTEGER_LITERAL:
            return DataType::INTEGER;

        case TokenType::BIGINT:
        case TokenType::HEX_LITERAL:
            return DataType::BIGINT;

        case TokenType::FLOAT:
        case TokenType::FLOAT_LITERAL:
            return DataType::FLOAT;

        case TokenType::TEXT:
        case TokenType::TEXT_LITERAL:
            return DataType::TEXT;

        case TokenType::BOOLEAN:
        case TokenType::BOOLEAN_LITERAL:
            return DataType::BOOLEAN;

        case TokenType::IDENTIFIER: 
            return DataType::USER_DEFINED;
        default:
            return DataType::UNDEFINED;
    }
}

size_t data_type_size(DataType data_type) {
    switch(data_type) {
        case DataType::INTEGER:
        case DataType::BOOLEAN:
            return __SIZEOF_INT__;

        case DataType::BIGINT:
            return __SIZEOF_LONG__;

        case DataType::FLOAT:
            return __SIZEOF_DOUBLE__;

        case DataType::TEXT:
        case DataType::USER_DEFINED:
            return __SIZEOF_POINTER__;

        default:
            return 0;
        
    }
}

static set statement_token_types = {TokenType::RETURN, TokenType::TRACE, TokenType::IDENTIFIER, TokenType::PRINT};
bool is_statement_token_type(TokenType token_type) {
    return statement_token_types.count(token_type) > 0; 
}

static set is_literal_token_types = {TokenType::INTEGER_LITERAL, TokenType::HEX_LITERAL, TokenType::FLOAT_LITERAL, TokenType::TEXT_LITERAL, TokenType::BOOLEAN_LITERAL};
bool is_literal_token_type(TokenType token_type) {
    return is_literal_token_types.count(token_type) > 0;
}

ostream & operator << (ostream & out, DataType data_type) {
    switch(data_type) {
        case DataType::USER_DEFINED:
            out << "USER_DEFINED";
            break; 
        case DataType::INTEGER:
            out << "INTEGER";
            break;
        case DataType::BIGINT:
            out << "BIGINT";
            break;
        case DataType::FLOAT:
            out << "FLOAT";
            break;
        case DataType::TEXT:
            out << "TEXT";
            break;
        case DataType::BOOLEAN:
            out << "BOOLEAN";
            break;
        default:
            out << "UNDEFINED";
    }
    return out;
}