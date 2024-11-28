
# This script is designed to clean the build environment for GhidraInject.

set -e

# Function to clean build directories
clean_build() {
  echo "Cleaning build directories..."

  if [ -d "build" ]; then
    rm -rf build
    echo "Build directory removed."
  else
    echo "No build directory found."
  fi
}

# Function to remove generated files
clean_generated_files() {
  echo "Cleaning generated files..."

  find . -type f -name "*.generated" -exec rm -f {} \;
  echo "Generated files removed."
}

# Main cleanup execution
clean_build
clean_generated_files

echo "Cleanup complete."
