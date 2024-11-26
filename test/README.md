
# Unit Tests for GhidraFridaHookGen

## Overview
This directory contains unit and integration tests for the `GhidraFridaHookGen` project. It uses the Google Test framework to ensure the core components work correctly.

## Test Coverage
- **GhidraPluginTest**: Tests for the Ghidra plugin loading and function retrieval.
- **HookGeneratorTest**: Tests for generating and saving Frida hook scripts.
- **MainTest**: Tests for parsing CLI arguments and generating hooks.

## Running the Tests
To run the tests, use the following commands:

1. Build the project:
   ```bash
   cmake . && make
   ```

2. Run the tests:
   ```bash
   ./tests/GhidraFridaHookGenTest
   ```

For further test documentation and individual test case explanations, please refer to the source files in the `test/` directory.

### **Summary:**

- **Google Test Framework**: Uses `gtest` to create unit tests for the core components (`GhidraPlugin`, `HookGenerator`, and `CLIParser`).
- **Comprehensive Testing**:
  - **Ghidra Plugin**: Tests loading and fetching functions.
  - **Frida Hook Generation**: Verifies hook generation and saving functionality.
  - **CLI Argument Parsing**: Ensures correct parsing of user input in CLI.
