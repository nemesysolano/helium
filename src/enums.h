#ifndef __ENUMS_H__
#define __ENUMS_H__
#include <cstring>
#include <iostream>

enum ObjectType { VARIABLE, FUNCTION };

enum FunctionType { USER_DEFINED_FUNCTION, BUILT_IN_FUNCTION };

enum class DataType { USER_DEFINED,  INTEGER, BIGINT, FLOAT, TEXT, BOOLEAN, UNDEFINED};

enum class TokenType {
    // Kewords
    BEGIN,
    END,
    PRINT,
    PROGRAM,
    VAR,
    RETURN,
    INTEGER,
    BIGINT,
    FLOAT,
    TEXT,
    BOOLEAN,
    RIGHT_PARENT,
    LEFT_PARENT,
    LEFT_SQUARE_BRACKET,
    RIGHT_SQUARE_BRACKET,
    SEMICOLON,
    COLON,
    COMMA,
    // Flags
    INVALID,
    END_OF_FILE,
    // Data Literals
    TEXT_LITERAL,
    INTEGER_LITERAL,
    HEX_LITERAL,
    FLOAT_LITERAL,
    CHAR_LITERAL,
    BOOLEAN_LITERAL,
    //Identifier
    IDENTIFIER
};

DataType to_data_type(TokenType token_type) ;
size_t data_type_size(DataType data_type);
bool is_statement_token_type(TokenType token_type);
bool is_literal_token_type(TokenType type);
std::ostream & operator << (std::ostream & out, DataType data_type);
#endif