#include "keywords.h"
#include "text.h"
#include <iostream>
#include <map>

const char * PROGRAM = "PROGRAM";
const char * BEGIN = "BEGIN";
const char * END = "END";
const char * PRINT = "PRINT";
const char * VAR = "VAR";
const char * RETURN = "RETURN";
const char * TRACE = "TRACE";
const char * INTEGER = "INTEGER";
const char * IF = "IF";
const char * THEN = "THEN";
const char * ELSE = "ELSE";
const char * BIGINT = "BIGINT";
const char * FLOAT = "FLOAT";
const char * TEXT = "TEXT";
const char * BOOLEAN = "BOOLEAN";
const char * RIGHT_SQUARE_BRACKET = "]";
const char * LEFT_SQUARE_BREACKET = "[";
const char * RIGHT_PARENT = ")";
const char * LEFT_PARENT = "(";
const char * SEMICOLON = ";";
const char * COLON = ":";
const char * COMMA = ",";
const char * END_OF_FILE="<EOF>";
//Chararacter are regarded as single character tokens.
const char * single_char_tokens = "()[];:,.";

//Empty string
const char * empty_string = "";
using namespace std;
const char * multi_char_keywords[] = { 
    PROGRAM, BEGIN, END, PRINT,
    VAR, RETURN, TRACE, INTEGER, 
    BIGINT, FLOAT , TEXT, BOOLEAN,
    IF, THEN, ELSE, NULL
};

const char * built_type_tokens [] = {
    INTEGER, BIGINT, FLOAT, TEXT, BOOLEAN, NULL
};

bool is_built_type_token(const string & value) {
    for (const char * token : built_type_tokens) {
        if(token == NULL) {
            break;
        }
        if (iequals(value, token)) {
            return true;
        }
    }
    return false;
}

bool is_multi_char_keyword(const string & value) {
    
    for (const char * keyword : multi_char_keywords) {
        if(keyword == NULL) {
            break;
        }

        if (iequals(value, keyword)) {
            return true;
        }
    }
    return false;
    
}

bool is_single_char_keyword(const char value) {
    for (const char * token = single_char_tokens; *token != '\0'; ++token) {
        if (value == *token) {
            return true;
        }
    }
    return false;
}