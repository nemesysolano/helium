#include "text-io.h"
#include <fstream>
#include <optional>
#include <string>

using namespace std;

// Create a function that reads a file if it exists or null if it doesn't or the reference is a directory
optional<string> read_text_file(const char *path) {
    // Open the file
    ifstream file(path);
    if (!file.is_open()) {
        return nullopt;
    }

    // Read the file
    string content((istreambuf_iterator<char>(file)), istreambuf_iterator<char>());

    // Close the file
    file.close();

    optional<string> result(move(content));
    return move(result);
}

// Create a function that writes a file and returns null if it can´t create the file or write content
bool write_text_file(char *path, const std::string &content) {
    // Open the file
    ofstream file(path);
    if (!file.is_open()) {
        return false;
    }

    // Write the content
    file << content;
    file.flush();
    // Close the file
    file.close();

    return true;
}

bool write_text_file(char *path, const std::ostringstream & content) {
    const string &str = content.str();
    return write_text_file(path, str);
}