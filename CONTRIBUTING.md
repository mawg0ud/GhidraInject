# Contributing to GhidraInject

Thank you for your interest in contributing to **GhidraInject**! Your contributions are invaluable in making this tool robust, innovative, and user-friendly. Follow these guidelines to ensure a smooth and collaborative experience.

---

## How You Can Contribute

### Reporting Issues
If you encounter bugs or have feature requests:
1. Search the [issue tracker](https://github.com/mawg0ud/GhidraInject/issues) to ensure the issue hasn’t already been reported.
2. Create a new issue with:
   - A clear and concise title.
   - Steps to reproduce the issue (if applicable).
   - Relevant logs, screenshots, or error messages.
   - Environment details (OS, architecture, tool versions).

### Suggesting Features
We value innovative ideas! Use the `Feature Request` template in the [issues tab](https://github.com/mawg0ud/GhidraInject/issues). Include:
- A description of the feature.
- Its potential benefits for users.
- Any examples or use cases.

### Code Contributions
1. **Fork and Clone**:
   - Fork the repository and clone your fork locally:
     ```bash
     git clone https://github.com/mawg0ud/GhidraInject.git
     cd GhidraInject
     ```
2. **Set Up**:
   - Install prerequisites as outlined in [README.md](README.md).
   - Build the project using:
     ```bash
     mkdir build && cd build
     cmake ..
     make
     ```
3. **Branch Workflow**:
   - Use a separate branch for your changes:
     ```bash
     git checkout -b feature/your-feature-name
     ```
4. **Write Clean Code**:
   - Follow the [Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html).
   - Add comments for complex logic and functions.
   - Write unit tests for new features or bug fixes.
5. **Commit and Push**:
   - Make clear and concise commits:
     ```bash
     git add .
     git commit -m "Add feature X"
     git push origin feature/your-feature-name
     ```

---

## Coding Standards

- **Language**: Use modern C++ standards (C++17 or later).
- **Style**: Follow consistent indentation and naming conventions.
- **Error Handling**: Use exceptions or well-defined error codes for recoverable errors.
- **Documentation**:
  - Use Doxygen comments for all functions, classes, and modules.
  - Ensure your code is self-documenting and readable.
- **Testing**:
  - All features must include appropriate unit and integration tests.
  - Use `Catch2` for testing:
    ```bash
    make test
    ```

---

## Submitting Pull Requests

1. **Ensure Quality**:
   - Run all tests (`make test`) and verify they pass.
   - Use `clang-tidy` or similar tools for static analysis.
2. **Create a Pull Request (PR)**:
   - Navigate to the original repository.
   - Click **New Pull Request** and select your branch.
   - Provide a detailed description of your changes and their purpose.
3. **Address Feedback**:
   - Be responsive to comments from reviewers.
   - Make necessary changes and update your PR.

---

## Code of Conduct

By contributing, you agree to uphold the [Code of Conduct](CODE_OF_CONDUCT.md). Be respectful and collaborative in all communications.

---

## Resources

- [Project Documentation](docs/)
- [Contributor Guidelines](docs/developer_guide.md)
- [Semantic Versioning](https://semver.org/)

---

## Thank You

Your contributions drive this project forward. Whether you’re reporting a bug, suggesting improvements, or writing code, your efforts are deeply appreciated!
