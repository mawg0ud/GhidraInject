# Developer Guide

## Overview

This section provides guidelines for contributing to the **GhidraFridaHookGen** project. It includes detailed instructions on the project structure, building the project, and how to extend its functionality.

## Project Structure

### `src/` Directory
- **`ghidra_integration/`**: Contains code for integrating Ghidra and extracting functions.
- **`frida_hooks/`**: Contains the core logic for generating Frida hook scripts.
- **`common/`**: Shared utility functions.
- **`main.cpp`**: Entry point for the application.

### `ui/` Directory
- **`cli/`**: Command-line interface code for user interaction.
- **`qt_gui/`**: GUI components using the Qt framework.
- **`assets/`**: UI assets like icons and stylesheets.

### `test/` Directory
- Contains unit tests for core components using Google Test.

## Adding a New Hook Generator

1. **Define the Hook Type**: Start by defining the type of hook you want to support.
2. **Extend the HookGenerator Class**: Add the new hook logic in `frida_hooks/HookGenerator.cpp` by extending the `HookGenerator` class.
3. **Create Tests**: Add unit tests for the new functionality in `test/frida_hooks_test/`.

## Building and Testing

1. **Build the project**:
   ```bash
   cmake . && make
   ```

2. **Run unit tests**:
   ```bash
   ./tests/GhidraFridaHookGenTest
   ```

3. **Submit Pull Requests**: Ensure all tests pass and document new features in the `docs/` directory before submitting a pull request.

---
