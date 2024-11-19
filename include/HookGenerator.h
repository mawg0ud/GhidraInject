#ifndef HOOKGENERATOR_H
#define HOOKGENERATOR_H

#include <string>
#include <vector>

namespace frida_hooks {

class HookGenerator {
public:
    // Constructor & Destructor
    HookGenerator();
    virtual ~HookGenerator();

    // Generate a hook script for a specific function
    void generateHook(const std::string& functionName);

private:
    // Save generated hook scripts to file
    void saveHookScript(const std::string& functionName, const std::string& hookCode);

    // Utility function to format hook code
    std::string generateHookCode(const std::string& functionName);
};

} // namespace frida_hooks

#endif // HOOKGENERATOR_H
