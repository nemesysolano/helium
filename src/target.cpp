#include "target.h"
#include <fstream>

using namespace std;
const char * SEP = ", ";
const char * COMMENT = "; ";
const char * GLOBAL_SCOPE_NAME = "_global";
const char * EXIT_SUFFIX = "_exit";

int64_t to_bigint(const std::string & value, TokenType token_type) {
    switch(token_type) {
        case TokenType::INTEGER_LITERAL:
            return stoll(value);
        case TokenType::HEX_LITERAL:
            return stoll(value, nullptr, 16);
        default:
            return 0;
    }
}

int32_t to_integer(const std::string & value, TokenType token_type) {
    switch(token_type) {
        case TokenType::INTEGER_LITERAL:
            return stoi(value);
        case TokenType::HEX_LITERAL:
            return stoi(value, nullptr, 16);
        default:
            return 0;
    }
}

bool Target::write(const char * file, const std::vector<std::unique_ptr<Token>> & tokens, const std::map<std::string, size_t> & static_data, const std::map<std::string, size_t> & builtin_functions) {
    ofstream out(file);
    if(out.is_open()) {
        return write(out, tokens, static_data, builtin_functions);
    }
    return false;

}