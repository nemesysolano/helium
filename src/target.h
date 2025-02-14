#ifndef __TARGET_H__
#define __TARGET_H__
#include "tokenizer.h"
#include <functional>
#include <stack>
#include <map>
#include <memory>
extern const char * SEP;
extern const char * COMMENT;

struct TargetContext {

    const std::vector<std::unique_ptr<Token>> & tokens;
    size_t index;
    inline Token * next() {return tokens[index++].get();}    ;
    inline bool end() {return index >= tokens.size();}
    inline void push_back() {index --;}
};

class Target {
    public:
        virtual bool write(std::ostream & out, const std::vector<std::unique_ptr<Token>> & tokens) = 0 ;
        bool write(const char * file, const std::vector<std::unique_ptr<Token>> & tokens);
};

#endif // __TARGET_H__