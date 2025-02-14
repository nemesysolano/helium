#include <iostream>
#include <fstream>
#include <string>
#include "text-io.h"
#include "tokenizer.h"
#include "parser.h"
#include "target-intel-linux.h"
#include <sstream>
using namespace std;

unique_ptr<Target> select_target(char ** argv) {  //TODO: Select target based on the command line arguments   
    return move(make_unique<TargetIntelLinux>());
}

int main(int argc, char ** argv) {
    // Requires two arguments: input file and output file
    if (argc != 3) {
        cout << "Usage: " << argv[0] << " <input-file> <output-file>" << endl;
        return -1;
    }

    optional<string> content = read_text_file(argv[1]);
    if(content.has_value()) {
        Tokenizer tokenizer(content.value());
        Parser parser(move(select_target(argv)));
        ostringstream out;

        if(!parser.parse(tokenizer, out)) {
            cout << "Failed to parse file: " << argv[1] << endl;
            return -1;
        }
        
        write_text_file(argv[2], out);
    } else {
        cout << "Failed to read file: " << argv[1] << endl;
        return -1;
    }
    
    return 0;
}