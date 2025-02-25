#ifndef __TEXT_H__
#define __TEXT_H__
#include <string>
#include <functional>

bool iequals(const std::string & a, const char * text);
bool is_c_escaped_char(char c);

class CyclicHash {
    size_t prime_index;
    size_t second_index;
    size_t third_index;
public:
    inline CyclicHash(): prime_index(0), second_index(3), third_index(6) {}
    size_t operator()(const std::string & string);
};
#endif // __TEXT_H__