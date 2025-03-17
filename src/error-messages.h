#ifndef __ERROR_MESSAGES_H__
#define __ERROR_MESSAGES_H__
#include <iostream>
#include <string>   
#include "tokenizer.h"

extern const char * MSG_NOT_END_OF_FILE;
extern const char * MSG_INVALID_TYPE;
extern const char * MSG_INVALID_STATEMENT;
extern const char * MSG_INVALID_EXPRESSION;
extern const char * MSG_RETURN_DATATYPE_MISTMATCH;
extern const char * MSG_ASSIGMENT_DATATYPE_MISTMATCH;
extern const char * MSG_INVALID_CALL_TARGET;
extern const char * MSG_INVALID_PRINT_ARGUMENT;
extern const char * MSG_INVALID_SUM_ARGUMENT;
extern const char * MSG_SUM_ARGUMENTS_HAVE_DIFFERENT_TYPES;
extern const char * MSG_TOO_MANY_SUM_ARGUMENTS;
bool print_expected_token(const char * expected, Tokenizer & tokenizer);
bool print_parse_error(const char * message, Tokenizer & tokenizer);
bool print_duplicated_object(const std::string & name, Tokenizer & tokenizer);
bool print_undefined_object(const std::string & name, const Tokenizer & tokenizer);
bool print_builtin_object(const std::string & name, const Tokenizer & tokenizer);

#endif