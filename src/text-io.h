#ifndef INPUT_OUTPUT_H
#define INPUT_OUTPUT_H
#include <optional>
#include <string>
#include <sstream>

// Create a function that reads a file if it exists or null if it doesn't or the reference is a directory
std::optional<std::string> read_text_file(const char *path);
bool write_text_file(char *path, const std::string &content);
bool write_text_file(char *path, const std::ostringstream & content);
#endif // INPUT_OUTPUT_H