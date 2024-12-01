# User Interface for GhidraInject

## Command-Line Interface (CLI)

### Available Arguments
- `-f, --function <function_name>`: Specify the function to hook.
- `-h, --help`: Show help message and usage instructions.

### Example Usage:
```bash
GhidraInject -f myFunction
```

## Graphical User Interface (GUI)

The GUI allows users to input the function name through a text box and generate hooks with the click of a button.

### Dependencies:
- Qt5 (for GUI)

### Running the GUI:
```bash
qmake && make
./GhidraInject
```

### **Explanation:**
- **Qt GUI**: The GUI gives users an interactive way to generate hooks by typing function names.
- **CLI**: The CLI provides an alternative for users who prefer command-line operations.
- **Assets**: Icons and styles can be included for a more professional UI experience.
- **Documentation**: Simple README with instructions for both interfaces.
### **Final Thoughts:**
- **CLI (Command-Line Interface)**: Provides a clean, minimalist way to interact with the program for automated environments.
- **Qt GUI**: Provides a user-friendly interface with input validation, ideal for users who prefer a visual tool.
