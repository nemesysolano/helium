
#include <cctype>      // std::tolower
#include <algorithm>   // std::equal
#include <string_view> // std::string_view
#include <ranges>      // std::ranges::equal
#include <cstring>      // std::string
#include <string>
#include <iostream> 

using namespace std;

bool iequals(const string & a, const char * text) {
    size_t length = strlen(text);

    if(a.size() != strlen(text)) return false;
    if(a.size() + length == 0) return true;

    for(size_t index = 0; index < length; index++) {
        if(tolower(a[index]) != tolower(text[index])) {

            return false;
        }
    }
    return true;
}

bool is_c_escaped_char(char c) {
    return c == '\\' || c == '\'' || c == '\"' || c == '?' || c == 'a' || c == 'b' || c == 'f' || c == 'n' || c == 'r' || c == 't' || c == 'v';
}