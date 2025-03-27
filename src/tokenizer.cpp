#include "tokenizer.h"
#include <memory>
#include <cstring>
#include "keywords.h"
#include <regex>
#include <iostream>
#include "text.h"
using namespace std;


// Create a regular expression object that validates if a std::string instance represents a C++ identifier
const regex identifier_regex("^[a-zA-Z_][a-zA-Z0-9_]*$");
const regex string_regex("\"([^\"\\\\]|\\\\.)*\"");
const regex integer_regex("^-?\\d+$");
const regex hex_integer_regex("^(0[xX])[0-9a-fA-F]+$");
const regex float_regex("^-?\\d+\\.\\d+$");
const regex char_regex("^'([^'\\\\]|\\\\.)'$");
const regex boolean_regex("^(true|false)$");

Token::Token(Token && other) : type(other.type), value(other.value), line(other.line) {
    other.value = nullptr;
}

Token & Token::operator=(Token && other) {
    if (this != &other) {
        type = other.type;
        value = other.value;
        line = other.line;
        other.value = nullptr;
    }
    return *this;
}

void Tokenizer::next_char() {
    index++;
    if(source[index] == '\n') {
        column = 0;
        line ++;
    } else {
        column ++;
    }
}

unique_ptr<Token> Tokenizer::next() {
    std::smatch match;
    size_t line_number;

    if(current_token.get() != nullptr) {
        auto value = std::move(current_token);
        current_token.reset();
        return std::move(value);
    }

    buffer.clear();
    while (index < source.size() && isspace(source[index])) {
        next_char();
    }
   
    line_number = this->line;
    if (index >= source.size() || source[index] == '\0') {
        return make_unique<Token>(TokenType::END_OF_FILE, empty_string, line_number);
    }

    bool is_string = source[index] == '"';
    buffer.push_back(source[index]);
    next_char();
    
    line_number = this->line;
    if(is_string) {
        // Try to read a C string literal taking into account escaped characters (e.g. '\r', '\n', '\t' and '\'", etc.)        
        while (index < source.size() && source[index] != '"') {
            if(source[index] == '\\') {
                next_char();
                if(index == source.size() || !is_c_escaped_char(source[index])) {
                    break;
                }
            }
            buffer.push_back(source[index]);
            next_char();
        }

        if(index < source.size() && source[index] == '"') {
            buffer.push_back(source[index]);
            next_char();
        }
        
        if(regex_match(buffer, match, string_regex)) {        
            return std::move(make_unique<Token>(TokenType::TEXT_LITERAL, buffer, line_number));
        } 
        
    } else {
        
        if(get_keyword_type(buffer) != TokenType::INVALID) {
            return std::move(make_unique<Token>(get_keyword_type(buffer), buffer, line_number));
        }
         
        while(index < source.size() && (isalnum(source[index]) || source[index] == '_' || source[index] == '.')) {
            buffer.push_back(source[index]);
            next_char();
        }
    
        // check if buffer contains a valid C++ identifier
        if (!buffer.empty()) {
            
            if(regex_match(buffer, match, integer_regex)) {
                return std::move(make_unique<Token>(TokenType::INTEGER_LITERAL, buffer, line_number));
    
            } else if(regex_match(buffer, match, hex_integer_regex)) {
                return std::move(make_unique<Token>(TokenType::HEX_LITERAL, buffer, line_number));
    
            } else if(regex_match(buffer, match, float_regex)) {
                return std::move(make_unique<Token>(TokenType::FLOAT_LITERAL, buffer, line_number));
    
            } else if(regex_match(buffer, match, char_regex)) {
                return std::move(make_unique<Token>(TokenType::FLOAT_LITERAL, buffer, line_number));
    
            } else if(regex_match(buffer, match, boolean_regex)) {
                return std::move(make_unique<Token>(TokenType::BOOLEAN_LITERAL, buffer, line_number));
    
            } else if(is_multi_char_keyword(buffer)) {
                return std::move(make_unique<Token>(get_keyword_type(buffer), buffer, line_number));
    
            } else if (regex_match(buffer, match, identifier_regex)) {
                return std::move(make_unique<Token>(TokenType::IDENTIFIER, buffer, line_number));
    
            } 
        }        
    }


    return std::move(make_unique<Token>(TokenType::INVALID, buffer, line_number));

}

TokenType get_keyword_type(const string & buffer) {
    if (iequals(buffer,PROGRAM)) {
        return TokenType::PROGRAM;
    } else if (iequals(buffer, VAR)) {
        return TokenType::VAR;
    }  else if (iequals(buffer, INTEGER)) {
        return TokenType::INTEGER;
    } else if (iequals(buffer, BIGINT)) {
        return TokenType::BIGINT;
    } else if (iequals(buffer, FLOAT)) {
        return TokenType::FLOAT;
    } else if (iequals(buffer, TEXT)) {
        return TokenType::TEXT;
    } else if (iequals(buffer, BOOLEAN)) {
        return TokenType::BOOLEAN;
    } else if(iequals(buffer, BEGIN)) {
        return TokenType::BEGIN;
    } else if(iequals(buffer, END)) {
        return TokenType::END;
    } else if(iequals(buffer, PRINT)) {
        return TokenType::PRINT;
    } else if(iequals(buffer, RETURN)) {
        return TokenType::RETURN;
    }else if(iequals(buffer, TRACE)) {
        return TokenType::TRACE;
    }  else if(iequals(buffer, RIGHT_SQUARE_BRACKET)) {
        return TokenType::RIGHT_SQUARE_BRACKET;
    } else if(iequals(buffer, LEFT_SQUARE_BREACKET)) {
        return TokenType::LEFT_SQUARE_BRACKET;
    } else if(iequals(buffer, RIGHT_PARENT)) {
        return TokenType::RIGHT_PARENT;
    } else if(iequals(buffer, LEFT_PARENT)) {
        return TokenType::LEFT_PARENT;
    } else if(iequals(buffer, SEMICOLON)) {
        return TokenType::SEMICOLON;
    } else if(iequals(buffer, COLON)) {
        return TokenType::COLON;
    } else if(iequals(buffer, COMMA)) {
        return TokenType::COMMA;
    } else if (buffer == empty_string) {
        return TokenType::END_OF_FILE;
    } else {
        return TokenType::INVALID;
    }
}

bool is_type_token(const unique_ptr<Token> & token) {
    return is_built_type_token(token->getValue());
}

bool is_statement_token(const unique_ptr<Token> & token) {
    auto type = token->getType();
    return is_statement_token_type(type);
}

bool is_literal_token(const unique_ptr<Token> & token) {
    auto type = token->getType();
    auto matches = is_literal_token_type(type);

    return matches;
}

bool literal_matches_type(const unique_ptr<Token> & token, DataType data_type) {
    auto type = token->getType();

    switch(data_type) {
        case DataType::BIGINT:
            return type == TokenType::BIGINT || type == TokenType::HEX_LITERAL;

        case DataType::INTEGER:
            return type == TokenType::INTEGER || type == TokenType::INTEGER_LITERAL;

        case DataType::FLOAT:
            return type == TokenType::FLOAT || type == TokenType::FLOAT_LITERAL;

        case DataType::TEXT:        
            return type == TokenType::TEXT || type == TokenType::TEXT_LITERAL;

        case DataType::BOOLEAN:
            return type == TokenType::BOOLEAN || type == TokenType::BOOLEAN_LITERAL;

        default:
            return false;
    }
}