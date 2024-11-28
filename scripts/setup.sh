
# This script automates the setup of the GhidraInject environment.
# It installs dependencies, clones the repository, and builds the project.

set -e

# Function to install system dependencies
install_dependencies() {
  echo "Installing system dependencies..."

  # Check if package manager is apt (Debian/Ubuntu)
  if command -v apt-get &> /dev/null
  then
    sudo apt-get update
    sudo apt-get install -y cmake qt5-qmake qtbase5-dev frida-tools
  # Check if package manager is yum (CentOS/Fedora)
  elif command -v yum &> /dev/null
  then
    sudo yum install -y cmake qt5-qtbase-devel frida-tools
  else
    echo "Unsupported package manager"
    exit 1
  fi
}

# Function to build the project
build_project() {
  echo "Building the project..."
  
  # Check for cmake and make build system
  if [ -f "CMakeLists.txt" ]; then
    mkdir -p build
    cd build
    cmake ..
    make
    echo "Build successful."
  else
    echo "CMakeLists.txt not found. Ensure you are in the correct directory."
    exit 1
  fi
}

# Function to clone the repository
clone_repository() {
  echo "Cloning the repository..."
  
  # Clone the repository if not already cloned
  if [ ! -d "GhidraInject" ]; then
    git clone https://github.com/mawg0ud/GhidraInject.git
  else
    echo "Repository already cloned."
  fi
}

# Function to install Frida if not installed
install_frida() {
  if ! command -v frida &> /dev/null; then
    echo "Frida not found, installing..."
    pip install frida-tools
  else
    echo "Frida is already installed."
  fi
}

# Main script execution
install_dependencies
install_frida
clone_repository
build_project

echo "Setup complete. You can now use GhidraInject."
