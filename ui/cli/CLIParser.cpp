#include "CLIParser.h"
#include <iostream>
#include <stdexcept>
#include <string>
#include <vector>
#include <unordered_map>

// Constructor
CLIParser::CLIParser(int argc, char* argv[]) {
    parseArguments(argc, argv);
}

// Method to parse arguments
void CLIParser::parseArguments(int argc, char* argv[]) {
    if (argc < 2) {
        throw std::invalid_argument("Insufficient arguments provided. Use --help for usage information.");
    }

    for (int i = 1; i < argc; ++i) {
        std::string arg = argv[i];

        // Check for flag arguments
        if (arg.starts_with("--")) {
            std::string key = arg.substr(2);
            if (i + 1 < argc && !std::string(argv[i + 1]).starts_with("--")) {
                options[key] = argv[++i];
            } else {
                options[key] = ""; // Flag without value
            }
        } else if (arg.starts_with("-")) {
            std::string key = arg.substr(1);
            if (i + 1 < argc && !std::string(argv[i + 1]).starts_with("-")) {
                options[key] = argv[++i];
            } else {
                options[key] = ""; // Flag without value
            }
        } else {
            positionalArgs.push_back(arg); // Positional arguments
        }
    }

    if (options.contains("help") || options.contains("h")) {
        displayHelp();
        exit(0);
    }
}

// Method to display help information
void CLIParser::displayHelp() const {
    std::cout << "Usage: tool [options] [arguments]\n\n";
    std::cout << "Options:\n";
    std::cout << "  -h, --help        Display this help message.\n";
    std::cout << "  --version         Display tool version.\n";
    std::cout << "  --config [file]   Specify the configuration file.\n";
    std::cout << "  --verbose         Enable verbose output.\n\n";
    std::cout << "Examples:\n";
    std::cout << "  tool --config config.json --verbose\n";
    std::cout << "  tool input_file.txt\n";
}

// Method to check if an option exists
bool CLIParser::hasOption(const std::string& key) const {
    return options.find(key) != options.end();
}

// Method to get the value of an option
std::string CLIParser::getOption(const std::string& key) const {
    auto it = options.find(key);
    if (it != options.end()) {
        return it->second;
    }
    throw std::runtime_error("Option '" + key + "' not found.");
}

// Method to retrieve positional arguments
const std::vector<std::string>& CLIParser::getPositionalArgs() const {
    return positionalArgs;
}

// Destructor
CLIParser::~CLIParser() {
    // Cleanup if necessary (e.g., dynamic memory, file handles)
}
