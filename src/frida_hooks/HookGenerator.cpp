#include "HookGenerator.h"
#include <iostream>
#include <fstream>
#include <vector>
#include <string>

namespace frida_hooks {

HookGenerator::HookGenerator() {
    std::cout << "Frida Hook Generator Initialized." << std::endl;
}

void HookGenerator::generateHook(const std::string& functionName) {
    std::cout << "Generating hook for function: " << functionName << std::endl;
    
    // Example Frida hook code generation
    std::string hookCode = "Interceptor.attach(Module.findExportByName(null, \"" + functionName + "\"), {\n";
    hookCode += "    onEnter: function(args) { console.log('Entering " + functionName + "'); },\n";
    hookCode += "    onLeave: function(retval) { console.log('Leaving " + functionName + "'); }\n";
    hookCode += "});";

    saveHookScript(functionName, hookCode);
}

void HookGenerator::saveHookScript(const std::string& functionName, const std::string& hookCode) {
    std::ofstream outFile("hooks/" + functionName + "_hook.js");
    if (outFile.is_open()) {
        outFile << hookCode;
        outFile.close();
        std::cout << "Hook script saved: " << functionName << "_hook.js" << std::endl;
    } else {
        std::cerr << "Error saving hook script." << std::endl;
    }
}

} // namespace frida_hooks
