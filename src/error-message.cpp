#include "error-messages.h"
#include <iostream>
#include <string>

const char * MSG_NOT_END_OF_FILE = "no more content expected beyond this point";
const char * MSG_INVALID_TYPE = "valid data types tokens are integer, bigint, float, text,  boolean and identifier";
const char * MSG_INVALID_STATEMENT = "Return or function call expected";
const char * MSG_INVALID_EXPRESSION = "Invalid expression";
const char * MSG_RETURN_DATATYPE_MISTMATCH = "Return data type does not match the function return type";
const char * MSG_ASSIGMENT_DATATYPE_MISTMATCH = "Assigned data type does not match the variable type";
const char * MSG_INVALID_CALL_TARGET = "target (variable or function) doesn't exist in current scope or using a reserved world";

using namespace std;
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
