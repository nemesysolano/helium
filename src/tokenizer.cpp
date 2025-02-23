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

Token::Token(Token && other) : type(other.type), value(other.value) {
    other.value = nullptr;
}

Token & Token::operator=(Token && other) {
    if (this != &other) {
        type = other.type;
        value = other.value;
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

    if(current_token.get() != nullptr) {
        auto value = move(current_token);
        current_token.reset();
        return move(value);
    }

    buffer.clear();
    while (index < source.size() && isspace(source[index])) {
        next_char();
    }
   
    if (index >= source.size() || source[index] == '\0') {
        return make_unique<Token>(TokenType::END_OF_FILE, empty_string);
    }

    bool is_string = source[index] == '"';
    buffer.push_back(source[index]);
    next_char();

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
            return move(make_unique<Token>(TokenType::TEXT_LITERAL, buffer));
        } 
        
    } else {
        
        if(get_keyword_type(buffer) != TokenType::INVALID) {
            return move(make_unique<Token>(get_keyword_type(buffer), buffer));
        }
         
        while(index < source.size() && (isalnum(source[index]) || source[index] == '_' || source[index] == '.')) {
            buffer.push_back(source[index]);
            next_char();
        }
    
        // check if buffer contains a valid C++ identifier
        if (!buffer.empty()) {
            
            if(regex_match(buffer, match, integer_regex)) {
                return move(make_unique<Token>(TokenType::INTEGER_LITERAL, buffer));
    
            } else if(regex_match(buffer, match, hex_integer_regex)) {
                return move(make_unique<Token>(TokenType::HEX_LITERAL, buffer));
    
            } else if(regex_match(buffer, match, float_regex)) {
                return move(make_unique<Token>(TokenType::FLOAT_LITERAL, buffer));
    
            } else if(regex_match(buffer, match, char_regex)) {
                return move(make_unique<Token>(TokenType::FLOAT_LITERAL, buffer));
    
            } else if(regex_match(buffer, match, boolean_regex)) {
                return move(make_unique<Token>(TokenType::BOOLEAN_LITERAL, buffer));
    
            } else if(is_multi_char_keyword(buffer)) {
                return move(make_unique<Token>(get_keyword_type(buffer), buffer));
    
            } else if (regex_match(buffer, match, identifier_regex)) {
                return move(make_unique<Token>(TokenType::IDENTIFIER, buffer));
    
            } 
        }        
    }


    return move(make_unique<Token>(TokenType::INVALID, buffer));

}

TokenType get_keyword_type(const string & buffer) {
    if (iequals(buffer,PROGRAM)) {
        return TokenType::PROGRAM;
    } else if (iequals(buffer, VAR)) {
        return TokenType::VAR;
    } else if (iequals(buffer, INTEGER)) {
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
    } else if(iequals(buffer, RETURN)) {
        return TokenType::RETURN;
    } else if(iequals(buffer, RIGHT_SQUARE_BRACKET)) {
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
