#ifndef __KEYWORDS_H__
#define __KEYWORDS_H__
#include <string>

extern const char * PROGRAM;
extern const char * BEGIN ;
extern const char * END;
extern const char * VAR;
extern const char * RETURN;
extern const char * INTEGER;
extern const char * BIGINT;
extern const char * FLOAT;
extern const char * TEXT ;
extern const char * BOOLEAN;
extern const char * RIGHT_SQUARE_BRACKET;
extern const char * LEFT_SQUARE_BREACKET;
extern const char * RIGHT_PARENT;
extern const char * LEFT_PARENT;
extern const char * RIGHT_PARENT;
extern const char * LEFT_PARENT;
extern const char * SEMICOLON;
extern const char * COLON;
extern const char * COMMA;
extern const char * empty_string ;
extern const char * END_OF_FILE;

bool is_multi_char_keyword(const std::string & value);
bool is_single_char_keyword(const char character);
bool is_built_type_token(const std::string & value) ;
#endif