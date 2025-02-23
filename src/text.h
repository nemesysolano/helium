#ifndef __TEXT_H__
#define __TEXT_H__
#include <string>
#include <functional>

bool iequals(const std::string & a, const char * text);
bool is_c_escaped_char(char c);
size_t hash_string(const std::string & string);

#endif // __TEXT_H__