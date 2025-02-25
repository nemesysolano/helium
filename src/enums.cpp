#include "enums.h"

DataType to_data_type(TokenType token_type) {
    switch(token_type) {
        case TokenType::INTEGER:
            return DataType::INTEGER;
        case TokenType::BIGINT:
            return DataType::BIGINT;
        case TokenType::FLOAT:
            return DataType::FLOAT;
        case TokenType::TEXT:
            return DataType::TEXT;
        case TokenType::BOOLEAN:
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

bool is_statement_token_type(TokenType token_type) {
    return token_type == TokenType::RETURN  || token_type == TokenType::IDENTIFIER ; 
}

bool is_literal_token_type(TokenType token_type) {
    return token_type == TokenType::INTEGER_LITERAL || token_type == TokenType::HEX_LITERAL || token_type == TokenType::FLOAT_LITERAL || token_type == TokenType::TEXT_LITERAL || token_type == TokenType::BOOLEAN_LITERAL;
}
