
#include <cctype>      // std::tolower
#include <algorithm>   // std::equal
#include <string_view> // std::string_view
#include <ranges>      // std::ranges::equal
#include <cstring>      // std::string
#include <string>
#include <iostream> 
#include "text.h"

using namespace std;

char prime_list_below_100 [] = { 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97 };
size_t prime_list_below_100_size = 25;

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

size_t CyclicHash::operator()(const std::string & string) {
    size_t hash = 0;
    
    for(char c : string) {
        hash = c + (hash << prime_list_below_100[second_index]) + (hash << prime_list_below_100[third_index]) - hash;
        hash = hash ^ prime_list_below_100[prime_index];
        prime_index = (prime_index + 1) % prime_list_below_100_size;
        second_index = (second_index + 1) % prime_list_below_100_size;
        third_index = (third_index + 1) % prime_list_below_100_size;
    }
    
    return hash;
}