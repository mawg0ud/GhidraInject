# Setup Instructions

## Prerequisites

Before setting up **GhidraInject**, ensure that you have the following tools and libraries installed:

### 1. Ghidra

**Ghidra** is a reverse engineering framework developed by the NSA. You can download it from the [official Ghidra website](https://ghidra-sre.org/).

### 2. Frida

Frida is a dynamic instrumentation toolkit used to hook functions. Download and install it from [Frida's official website](https://www.frida.re/).

### 3. Dependencies

- **CMake**: Required to build the project.
- **Qt5**: Needed if you wish to use the graphical user interface (GUI).

### 4. Installing Required Software

1. **Install CMake**:
   ```bash
   sudo apt-get install cmake
   ```

2. **Install Qt5**:
   ```bash
   sudo apt-get install qt5-qmake qtbase5-dev
   ```

3. **Install Frida**:
   ```bash
   pip install frida-tools
   ```

4. **Clone the Repository**:
   ```bash
   git clone https://github.com/mawg0ud/GhidraInject.git
   cd GhidraInject
   ```

## Building the Project

1. **For the CLI version**:
   ```bash
   cmake . && make
   ```

2. **For the GUI version**:
   ```bash
   qmake && make
   ```

3. **Running the Application**:
   - **CLI**: Run `./GhidraInject -f <function_name>`.
   - **GUI**: Execute `./GhidraInject`.

## Troubleshooting

- If you encounter any issues with dependencies, ensure that all required libraries are correctly installed.
- Check the system environment variables to ensure that **Frida** and **Ghidra** are in the path.

---

### **Explanation:**

- **User Manual**: Provides step-by-step instructions for users to install, run, and use the tool. Includes details on CLI and GUI modes.
- **Developer Guide**: Offers instructions for developers on how to extend and contribute to the project, including project structure and adding new hook generators.
- **Setup Instructions**: Guides users through the setup process, including installing dependencies, building the project, and troubleshooting common issues.

This documentation is designed to ensure that both users and developers can easily understand and work with the **GhidraInject** project, making it easy to extend and use in various environments.
