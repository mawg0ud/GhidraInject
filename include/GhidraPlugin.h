#ifndef GHIDRAPLUGIN_H
#define GHIDRAPLUGIN_H

#include <string>
#include <vector>

namespace ghidra_integration {

class GhidraPlugin {
public:
    // Constructor & Destructor
    GhidraPlugin();
    virtual ~GhidraPlugin();

    // Load a Ghidra plugin by name
    void loadPlugin(const std::string& pluginName);

    // Retrieve functions available in Ghidra
    std::vector<std::string> getFunctions();

private:
    // Private helper functions
    void initializeGhidra();
    void handleError(const std::string& errorMessage);
    
    std::string currentPlugin;
};

} // namespace ghidra_integration

#endif // GHIDRAPLUGIN_H
