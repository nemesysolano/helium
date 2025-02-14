#ifndef __TOKENIZER_H__
#define __TOKENIZER_H__
#include <memory>
#include <vector>
#include <string>
#include "enums.h"

class Token {
    private:
        TokenType type;
        std::string * value;

    public:
        Token(TokenType type, const std::string & value) : type(type), value(new std::string(value)) {}
        // No copy constructor neither copy assignment
        Token(const Token & other) = delete;
        Token & operator=(const Token & other) = delete;

        // Move constructor and move assignment
        Token(Token && other);
        Token & operator=(Token && other);

        // Getters
        TokenType getType() const { return type; }
        const std::string & getValue() const { return *value; }

        // Destructor
        ~Token() {
            if(value != nullptr) {
                delete value;
                value = nullptr;
            }
        }
};

class Tokenizer {
    private:
        std::string source;
        std::string buffer;
        size_t line;
        size_t column;
        size_t index;
        std::unique_ptr<Token> current_token;
    public:
        Tokenizer(const std::string & source_): source(source_), line(0), column(0), index(0), current_token(nullptr){}
        // Remove copy constructor and copy assignment operator
        Tokenizer(const Tokenizer & other) = delete;
        Tokenizer & operator=(const Tokenizer & other) = delete;

        // Remove move constructor and move assignment operator
        Tokenizer(Tokenizer && other) = delete;
        Tokenizer & operator=(Tokenizer && other) = delete;
        void next_char();
        std::unique_ptr<Token> next();
        size_t get_line() const { return line; }
        size_t get_column() const { return column; }
        void push_back(std::unique_ptr<Token> token) { current_token = std::move(token); }
} ;
TokenType get_keyword_type(const std::string & buffer);
#endif