#include "error-messages.h"
#include <iostream>
#include <string>
using namespace std;

const char * MSG_NOT_END_OF_FILE = "no more content expected beyond this point";
const char * MSG_INVALID_TYPE = "valid data types tokens are integer, bigint, float, text,  boolean and identifier";
const char * MSG_INVALID_STATEMENT = "Return or function call expected";
const char * MSG_INVALID_EXPRESSION = "Invalid expression";
const char * MSG_RETURN_DATATYPE_MISTMATCH = "Return data type does not match the function return type";
const char * MSG_ASSIGMENT_DATATYPE_MISTMATCH = "Assigned data type does not match the variable type";
const char * MSG_INVALID_CALL_TARGET = "target (variable or function) doesn't exist in current scope or using a reserved world";
const char * MSG_INVALID_PRINT_ARGUMENT = "Invalid argument for print statement";
const char * MSG_INVALID_SUM_ARGUMENT = "Sum arguments must be numeric";
const char * MSG_SUM_ARGUMENTS_HAVE_DIFFERENT_TYPES = "sum arguments must have the same data type";
const char * MSG_TOO_MANY_SUM_ARGUMENTS = "sum statement can have up to 6 arguments";
const char * MSG_INVALID_MUL_ARGUMENT = "Multiplication arguments must be numeric";
const char * MSG_MUL_ARGUMENTS_HAVE_DIFFERENT_TYPES = "multiplication arguments must have the same data type";
const char * MSG_TOO_MANY_MUL_ARGUMENTS = "multiplication statement can have up to 6 arguments";
const char * MSG_INVALID_SUB_ARGUMENT = "Subtraction arguments must be numeric";
const char * MSG_SUB_ARGUMENTS_HAVE_DIFFERENT_TYPES = "subtraction arguments must have the same data type";
const char * MSG_TOO_MANY_SUB_ARGUMENTS = "subtraction statement can have up to 6 arguments";
const char * MSG_INVALID_DIV_ARGUMENT = "Division arguments must be numeric";
const char * MSG_DIV_ARGUMENTS_HAVE_DIFFERENT_TYPES = "division arguments must have the same data type";
const char * MSG_TOO_MANY_DIV_ARGUMENTS = "division statement can have up to 6 arguments";

bool print_expected_token(const char * expected, Tokenizer & tokenizer) {
    cout << "Syntax Error: Expected " << expected << " at line " << tokenizer.get_line() << " column " << tokenizer.get_column() << endl;        
    return false;
}

bool print_parse_error(const char * message, Tokenizer & tokenizer) {
    cout << " Parse Error: " << message << " at line " << tokenizer.get_line() << " column " << tokenizer.get_column() << endl;
    return false;
}

bool print_duplicated_object(const string & name, Tokenizer & tokenizer) {
    cout << " Semantic Error: " << name << " at line " << tokenizer.get_line() << " column " << tokenizer.get_column() << " is duplicated" << endl;
    return false;
}

bool print_undefined_object(const string & name, const Tokenizer & tokenizer) {
    cout << " Undefined Object: " << name << " at line " << tokenizer.get_line() << " column " << tokenizer.get_column() << " is duplicated" << endl;
    return false;
}

bool print_builtin_object(const string & name, const Tokenizer & tokenizer) {
    cout << " Semantic Error: " << name << " at line " << tokenizer.get_line() << " column " << tokenizer.get_column() << " is builtin object (function, type or variable)" << endl;    
    return false;
}
