#include "target.h"
#include <fstream>

using namespace std;
const char * SEP = ", ";
const char * COMMENT = "; ";

bool Target::write(const char * file, const std::vector<std::unique_ptr<Token>> & tokens) {
    ofstream out(file);
    if(out.is_open()) {
        return write(out, tokens);
    }
    return false;

}