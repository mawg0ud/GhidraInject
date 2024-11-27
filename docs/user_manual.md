# GhidraFridaHookGen User Manual

## Overview

**GhidraFridaHookGen** is a tool designed to automate the process of generating Frida hook scripts based on Ghidra function analysis. This tool integrates seamlessly with Ghidra, allowing users to generate hooks for functions discovered in disassembled binaries.

## Features

- **Ghidra Plugin Integration**: Automatically extract functions from Ghidra.
- **Frida Hook Generation**: Generate hooks for target functions in Frida scripting format.
- **CLI and GUI Support**: Operate through the command line or graphical user interface (GUI).

## Installation

### Prerequisites
- **Ghidra** (v9.0 or later)
- **Frida** (v12.0 or later)
- **C++ compiler** (e.g., GCC or Clang)
- **Qt5** (for GUI version)

### Steps

1. **Clone the repository**:
   ```bash
   git clone https://github.com/mawg0ud/GhidraInject.git
   cd GhidraFridaHookGen
   ```

2. **Build the project**:
   For the command line interface:
   ```bash
   cmake . && make
   ```

   For the GUI version:
   ```bash
   qmake && make
   ```

3. **Run the application**:
   For CLI:
   ```bash
   ./GhidraInject -f <function_name>
   ```
   For GUI, simply execute:
   ```bash
   ./GhidraInject
   ```

## Usage

### CLI

```bash
Usage: GhidraInject [options]
Options:
  -f, --function <function_name>  Specify the function to hook
  -h, --help                     Show help message
```

### GUI

- Input the function name in the provided text box and click "Generate Hook" to automatically generate a Frida hook script.

---
