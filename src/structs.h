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

struct ParseStatementsGroupResult {
    bool is_valid;
    int statements_count;
    ParseStatementsGroupResult(bool is_valid, int statements_count): is_valid(is_valid), statements_count(statements_count) {}
};

struct ParseCallResult {
    bool is_valid;
    std::set<DataType> result_types;
    DataType result_type;

    ParseCallResult(bool is_valid, DataType result_type): is_valid(is_valid), result_type(result_type) { result_types.insert(result_type); }  
    ParseCallResult(bool is_valid, std::set<DataType> result_types): is_valid(is_valid), result_types(result_types) { result_type = result_types.size() == 0 ? DataType::UNDEFINED : *result_types.begin(); }  
};

struct BuiltinFunction {
    std::set<DataType> result_types;
    size_t pointer;
    BuiltinFunction(std::set<DataType> result_types, size_t pointer): result_types(result_types), pointer(pointer) {}     
};

#endif