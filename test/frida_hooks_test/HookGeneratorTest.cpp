#include <gtest/gtest.h>
#include "frida_hooks/HookGenerator.h"
#include <stdexcept>

namespace frida_hooks {

// Test hook generation for a valid function name
TEST(HookGeneratorTest, GenerateHook) {
    HookGenerator generator;
    EXPECT_NO_THROW(generator.generateHook("validFunction"));
}

// Test hook generation for an empty function name
TEST(HookGeneratorTest, GenerateHookWithEmptyFunction) {
    HookGenerator generator;
    EXPECT_THROW(generator.generateHook(""), std::invalid_argument);
}

// Test saving a hook script to file
TEST(HookGeneratorTest, SaveHookScript) {
    HookGenerator generator;
    std::string functionName = "testFunction";
    std::string hookCode = generator.generateHookCode(functionName);
    EXPECT_FALSE(hookCode.empty());
    EXPECT_NO_THROW(generator.saveHookScript(functionName, hookCode));
}

}
