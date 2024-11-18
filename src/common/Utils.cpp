#include "Utils.h"
#include <iostream>
#include <sstream>

namespace common {

std::string Utils::formatString(const std::string& str) {
    std::stringstream ss;
    for (char c : str) {
        if (c == '_') {
            ss << ' ';
        } else {
            ss << static_cast<char>(tolower(c));
        }
    }
    return ss.str();
}

bool Utils::validateInput(const std::string& input) {
    if (input.empty()) {
        std::cerr << "Error: Input cannot be empty." << std::endl;
        return false;
    }
    return true;
}

}
