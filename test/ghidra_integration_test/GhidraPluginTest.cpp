#include <gtest/gtest.h>
#include "ghidra_integration/GhidraPlugin.h"
#include <stdexcept>

namespace ghidra_integration {

// Test loading a Ghidra plugin successfully
TEST(GhidraPluginTest, LoadPlugin) {
    GhidraPlugin plugin;
    EXPECT_NO_THROW(plugin.loadPlugin("SamplePlugin"));
}

// Test loading a plugin with an invalid name
TEST(GhidraPluginTest, LoadPluginWithInvalidName) {
    GhidraPlugin plugin;
    EXPECT_THROW(plugin.loadPlugin("InvalidPluginName"), std::runtime_error);
}

// Test getting functions from a loaded plugin
TEST(GhidraPluginTest, GetFunctions) {
    GhidraPlugin plugin;
    plugin.loadPlugin("SamplePlugin");
    std::vector<std::string> functions = plugin.getFunctions();
    EXPECT_GT(functions.size(), 0);
    EXPECT_EQ(functions[0], "expectedFunctionName");
}

}
