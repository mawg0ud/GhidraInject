# Changelog

All notable changes to this project are documented in this file.  
This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0] - 2024-12-03

### Added
- **Core Functionality**:
  - Full integration with Ghidra to extract function signatures, symbols, and disassembly data.
  - Automated generation of Frida hooks for functions and symbols from Ghidra's analysis.
  - Support for multiple architectures: `x86`, `x64`, `ARM`, and `ARM64`.
  - CLI for seamless hook generation with customizable options (`--binary`, `--output`, etc.).
  - Initial version of the Qt-based GUI for managing projects and hooks visually.
- **Documentation**:
  - Comprehensive `README.md` with installation and usage details.
  - User manual, developer guide, and setup instructions in the `docs/` folder.
- **Testing Framework**:
  - Unit tests for core functionalities in `frida_hooks` and `ghidra_integration`.
  - Integration tests for validating Ghidra and Frida workflows.

### Changed
- N/A (Initial release)

### Fixed
- N/A (Initial release)

---

## [1.1.0] - Planned Release (Upcoming)

### Planned Features
- **Dynamic Instrumentation Enhancements**:
  - Pre- and post-function hooking with inline patching.
  - Real-time function parameter inspection through Frida's APIs.
- **Performance Improvements**:
  - Optimized hook generation for large binaries (>10MB).
  - Multi-threaded processing for faster symbol parsing and hook creation.
- **GUI Upgrades**:
  - Added dark mode and customizable layouts.
  - Real-time Frida script preview in the editor pane.
- **Compatibility**:
  - Experimental support for RISC-V binaries.

### Planned Fixes
- Enhanced error handling for invalid ELF/PE binaries.
- Fixed hook generation inconsistencies for ARM64 functions with nested calls.

---

## [Future Releases]

### Ideas and Requests
- Machine learning integration to recommend common hooks based on binary type.
- Plugin API for extending functionality and supporting additional reverse engineering tools.
- Collaborative mode for teams to share hook definitions and workflows.

---

## Notes

- **Release Frequency**: Major features and updates will be released quarterly; patches and fixes as needed.
- **Contribution Guidelines**: See `CONTRIBUTING.md` for details on submitting fixes, features, and feedback.
