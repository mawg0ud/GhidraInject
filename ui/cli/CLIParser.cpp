#include "CLIParser.h"
#include <iostream>
#include <stdexcept>

namespace ui {

CLIParser::CLIParser(int argc, char* argv[]) : argc(argc), argv(argv) {}

void CLIParser::parseArguments() {
    for (int i = 1; i < argc; ++i) {
        std::string arg = argv[i];
        
        if (arg == "--help" || arg == "-h") {
            printHelp();
        } else if (arg == "--function" || arg == "-f") {
            if (i + 1 < argc) {
                functionName = argv[++i];
            } else {
                throw std::invalid_argument("No function name provided after '-f'.");
            }
        } else {
            throw std::invalid_argument("Unknown argument: " + arg);
        }
    }
}

void CLIParser::printHelp() const {
    std::cout << "Usage: GhidraInject [options]\n";
    std::cout << "Options:\n";
    std::cout << "  -f, --function <function_name>  Specify the function to hook\n";
    std::cout << "  -h, --help                     Show this help message\n";
}

std::string CLIParser::getFunctionName() const {
    return functionName;
}

}
