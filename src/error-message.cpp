#include "error-messages.h"
const char * MSG_NOT_END_OF_FILE = "no more content expected beyond this point";
const char * MSG_INVALID_TYPE = "valid data types tokens are integer, bigint, float, text,  boolean and identifier";
const char * MSG_INVALID_STATEMENT = "Return or function call expected";
const char * MSG_INVALID_EXPRESSION = "Invalid expression";
const char * MSG_RETURN_DATATYPE_MISTMATCH = "Return data type does not match the function return type";
const char * MSG_ASSIGMENT_DATATYPE_MISTMATCH = "Assigned data type does not match the variable type";
const char * MSG_INVALID_CALL_TARGET = "target (variable or function) doesn't exist in current scope or using a reserved world";