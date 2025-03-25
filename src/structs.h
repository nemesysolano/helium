#ifndef __STRUCTS_H__
#define __STRUCTS_H__
#include <string>
#include <map>
#include <memory>
#include "enums.h"
struct ParsedObject {
    size_t offset;
    std::string name;
    ObjectType object_type;
    DataType data_type;
};

struct ParsedScope {
    DataType data_type;
    std::string name;
    std::map<std::string, std::shared_ptr<ParsedObject>> objects;
    inline ParsedScope(DataType data_type, const std::string & name): data_type(data_type), name(name) {}
};

struct ExpressionResult {
    bool is_literal;
    DataType data_type;
    size_t size;
};

#endif