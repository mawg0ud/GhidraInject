#include <iostream>
#include "ghidra_integration/GhidraPlugin.h"
#include "frida_hooks/HookGenerator.h"
#include "common/Utils.h"

int main(int argc, char* argv[]) {
    if (argc < 2) {
        std::cerr << "Usage: " << argv[0] << " <function_name>" << std::endl;
        return 1;
    }

    std::string functionName = argv[1];

    // Initialize Ghidra plugin
    ghidra_integration::GhidraPlugin ghidraPlugin;
    try {
        ghidraPlugin.loadPlugin("GhidraFunctionAnalysis");
        std::vector<std::string> functions = ghidraPlugin.getFunctions();
        std::cout << "Loaded Functions: ";
        for (const auto& func : functions) {
            std::cout << func << " ";
        }
        std::cout << std::endl;
    } catch (const std::exception& ex) {
        std::cerr << "Ghidra plugin loading failed: " << ex.what() << std::endl;
        return 1;
    }

    // Generate Frida hook for the provided function name
    frida_hooks::HookGenerator hookGen;
    hookGen.generateHook(functionName);

    return 0;
}
