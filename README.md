# GhidraInject

GhidraInject is a sophisticated tool that integrates the Ghidra reverse engineering framework with Frida, an instrumentation toolkit. This project enables automated generation of Frida hooks directly from Ghidra, simplifying the process of dynamic analysis and security testing. With support for various architectures and deep integration with both Ghidra's analysis and Frida's hook capabilities, GhidraInject provides a powerful solution for penetration testers, reverse engineers, and security researchers.

## Features

- **Ghidra Integration**: Seamlessly integrates with Ghidra to pull function signatures, symbols, and address information.
- **Frida Hook Generation**: Automatically generates Frida hooks for functions and symbols, allowing for immediate use in dynamic instrumentation and analysis.
- **Cross-Platform**: Works on Linux, Windows, and macOS.
- **Extensible**: Easily extend the tool to add more hooks, architecture support, or modify hook logic.
- **Comprehensive Output**: Generates well-structured code for Frida scripts, providing clear comments and metadata for easier understanding and use.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
  - [CLI Usage](#cli-usage)
  - [GUI Usage](#gui-usage)
- [Contributing](#contributing)
- [License](#license)
- [Changelog](#changelog)
- [Acknowledgements](#acknowledgements)

## Installation

### Prerequisites
Before installing `GhidraInject`, ensure that you have the following dependencies installed:

- **Ghidra**: The open-source reverse engineering tool from the NSA, required for static analysis.
- **Frida**: An instrumentation toolkit used for dynamic analysis. The tool uses `frida-tools` for hook generation.
- **CMake**: For building the project.

#### Steps for Installation:

1. Clone the repository:

   ```bash
   git clone https://github.com/mawg0ud/GhidraInject.git
   cd GhidraInject
   ```

2. Install dependencies:

   For **Debian/Ubuntu**:

   ```bash
   sudo apt-get update
   sudo apt-get install cmake qt5-qmake qtbase5-dev frida-tools
   ```

   For **CentOS/Fedora**:

   ```bash
   sudo yum install cmake qt5-qtbase-devel frida-tools
   ```

3. Build the project using CMake:

   ```bash
   mkdir -p build
   cd build
   cmake ..
   make
   ```

4. Once built, you can run the tool from the command line or integrate it into Ghidra.

## Usage

### CLI Usage

The core functionality of `GhidraInject` can be accessed through its command-line interface (CLI). 

1. Run the tool with the desired binary:

   ```bash
   ./GhidraInject --binary /path/to/binary --output /path/to/output
   ```

2. Options available:

   - `--binary` : Path to the binary to analyze.
   - `--output` : Directory where the generated Frida hooks will be saved.
   - `--architecture` : (Optional) Specify architecture type (e.g., `x86`, `arm`).
   - `--verbose` : (Optional) Enable detailed output during hook generation.

### GUI Usage

For users who prefer a graphical interface, a Qt-based GUI is available. The GUI allows users to:

- Load binary files directly into the tool.
- Customize hook generation settings.
- View and export generated Frida hooks.

To launch the GUI:

```bash
./ghidra-Inject-gui
```

## Contributing

We welcome contributions to the project! If you have suggestions, bug fixes, or new features to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or fix.
3. Commit your changes with detailed commit messages.
4. Push your branch and create a pull request.

Before contributing, please review the [contributing guidelines](CONTRIBUTING.md).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a detailed list of changes, bug fixes, and new features in each version.

## Acknowledgements

- **Ghidra**: The NSA's reverse engineering tool that powers the static analysis.
- **Frida**: The dynamic instrumentation toolkit used to generate hooks and interact with the binary.
- **Qt**: Used for the development of the graphical user interface (GUI).

Special thanks to all contributors and maintainers of this project.

---

## Contact

- Project Repository: [https://github.com/mawg0ud/GhidraInject](https://github.com/mawg0ud/GhidraInject)
