#include <gtest/gtest.h>
#include "CLIParser.h"
#include "GhidraPlugin.h"
#include "HookGenerator.h"
#include <stdexcept>

namespace ui {

// Test argument parsing in CLI
TEST(CLIParserTest, ParseArguments) {
    const char* argv[] = {"GhidraFridaHookGen", "-f", "testFunction"};
    int argc = 3;
    CLIParser parser(argc, const_cast<char**>(argv));
    EXPECT_NO_THROW(parser.parseArguments());
    EXPECT_EQ(parser.getFunctionName(), "testFunction");
}

// Test invalid arguments
TEST(CLIParserTest, ParseInvalidArguments) {
    const char* argv[] = {"GhidraFridaHookGen", "-x"};
    int argc = 2;
    CLIParser parser(argc, const_cast<char**>(argv));
    EXPECT_THROW(parser.parseArguments(), std::invalid_argument);
}

} // namespace ui

namespace frida_hooks {

// Test HookGenerator
TEST(HookGeneratorTest, GenerateAndSaveHook) {
    HookGenerator generator;
    std::string functionName = "newTestFunction";
    EXPECT_NO_THROW(generator.generateHook(functionName));
    std::string hookCode = generator.generateHookCode(functionName);
    EXPECT_FALSE(hookCode.empty());
}

}
