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
        size_t line;
    public:
        Token(TokenType type, const std::string & value, size_t line) : type(type), value(new std::string(value)), line(line) {}
        // No copy constructor neither copy assignment
        Token(const Token & other) = delete;
        Token & operator=(const Token & other) = delete;

        // Move constructor and move assignment
        Token(Token && other);
        Token & operator=(Token && other);

        // Getters
        inline TokenType getType() const { return type; }
        inline const std::string & getValue() const { return *value; }
        inline size_t getLine() const { return line; }

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
bool is_type_token(const std::unique_ptr<Token> & token);
bool is_statement_token(const std::unique_ptr<Token> & token);
bool is_literal_token(const std::unique_ptr<Token> & token);
bool literal_matches_type(const std::unique_ptr<Token> & token, DataType data_type);
#endif