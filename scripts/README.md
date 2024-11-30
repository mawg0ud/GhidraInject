# GhidraInject Scripts

This directory contains helper scripts for managing the GhidraInject project. These scripts automate various tasks such as setup, build, cleanup, test execution, deployment, and updates.

## Available Scripts

### `setup.sh`
- Automates the installation of dependencies and the setup process.

### `cleanup.sh`
- Removes build and generated files to clean the project environment.

### `run_tests.sh`
- Builds the project (if necessary) and runs the unit tests.

### `deploy.sh`
- Packages the project and deploys it to a remote server.

### `update.sh`
- Updates the repository and system dependencies.

## Usage

To use a script, execute it from the root directory:
```bash
./scripts/setup.sh
./scripts/run_tests.sh
./scripts/deploy.sh
./scripts/update.sh
```

These scripts are designed to streamline the development and deployment processes.


### **Summary**:
- **Automation**: Scripts automate essential tasks like building, cleaning, testing, packaging, and deploying the project.
- **Deployment**: Includes a `deploy.sh` script to package and transfer the project to remote servers.
- **Updates**: The `update.sh` script ensures that both the repository and system dependencies are up to date.

These scripts facilitate smooth project management and help ensure the tool can be easily set up, tested, and deployed across different systems.
