#ifndef UTILS_H
#define UTILS_H

#include <string>

namespace common {

class Utils {
public:
    // Static utility function to format strings
    static std::string formatString(const std::string& str);

    // Static utility function to validate input strings
    static bool validateInput(const std::string& input);
};

} // namespace common

#endif // UTILS_H
