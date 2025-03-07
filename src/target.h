#ifndef __TARGET_H__
#define __TARGET_H__
#include "tokenizer.h"
#include <functional>
#include <stack>
#include <map>
#include <memory>
extern const char * SEP;
extern const char * COMMENT;
extern const char * GLOBAL_SCOPE_NAME;
extern const char * EXIT_SUFFIX;

struct TargetObject {
    std::string name;
    DataType data_type;    
    ObjectType object_type;
    size_t size;
    size_t offset;

    inline TargetObject(const std::string & name, DataType data_type, ObjectType object_type, size_t size, size_t offset)
        : name(name), data_type(data_type), object_type(object_type), size(size), offset(offset) {}
};;

struct TargetScope {
    DataType data_type;
    std::string name;
    std::map<std::string, std::shared_ptr<TargetObject>> objects;    
    TargetScope(DataType data_type, const std::string & name): data_type(data_type), name(name) {}
};

struct TargetContext {
    const std::vector<std::unique_ptr<Token>> & tokens;    
    const std::stack <std::unique_ptr<TargetScope>> & scopes;
    size_t index;
    inline Token * next() {return tokens[index++].get();};
    inline Token * current() {return tokens[index].get();}
    inline bool end() {return index >= tokens.size();}
    inline void push_back() {index --;}
    inline void push_back(size_t steps) {index -= steps;}
};

int64_t to_bigint(const std::string & value, TokenType token_type);
int32_t to_integer(const std::string & value, TokenType token_type);

class Target {
    public:
        virtual bool write(std::ostream & out, const std::vector<std::unique_ptr<Token>> & tokens, const std::map<std::string, size_t> & static_data) = 0 ;
        bool write(const char * file, const std::vector<std::unique_ptr<Token>> & tokens, const std::map<std::string, size_t> & static_data);
};

#endif // __TARGET_H__