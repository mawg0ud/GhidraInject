#!/bin/bash

# ==============================================
# Setup Script for GhidraInject Project
# ==============================================
# This script automates the setup process, including:
# - Dependency installation
# - Environment configuration
# - Initial project build
# - Optional steps for advanced users
# ==============================================

# Exit on error or undefined variable
set -euo pipefail

# Define supported operating systems
SUPPORTED_OS=("Ubuntu" "Debian" "Fedora" "Arch Linux" "macOS")
REQUIRED_TOOLS=("git" "cmake" "g++" "make" "python3" "pip")

# Colors for output
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
NC="\033[0m" # No Color

# Helper functions for messaging
info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
    exit 1
}

# Check operating system compatibility
check_os() {
    info "Detecting operating system..."
    OS=$(uname -s)
    if [[ "$OS" == "Linux" ]]; then
        DISTRO=$(grep "^NAME=" /etc/os-release | cut -d= -f2 | tr -d '"')
    elif [[ "$OS" == "Darwin" ]]; then
        DISTRO="macOS"
    else
        error "Unsupported operating system: $OS"
    fi

    if [[ ! " ${SUPPORTED_OS[@]} " =~ " ${DISTRO} " ]]; then
        error "Unsupported Linux distribution: $DISTRO"
    fi

    info "Operating system detected: $DISTRO"
}

# Install dependencies
install_dependencies() {
    info "Installing dependencies..."

    case "$DISTRO" in
        "Ubuntu"|"Debian")
            sudo apt update && sudo apt install -y "${REQUIRED_TOOLS[@]}"
            ;;
        "Fedora")
            sudo dnf install -y "${REQUIRED_TOOLS[@]}"
            ;;
        "Arch Linux")
            sudo pacman -Syu --noconfirm "${REQUIRED_TOOLS[@]}"
            ;;
        "macOS")
            if ! command -v brew >/dev/null; then
                warn "Homebrew not found. Installing..."
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            fi
            brew install "${REQUIRED_TOOLS[@]}"
            ;;
        *)
            error "Unsupported distribution. Please install the required tools manually."
            ;;
    esac
}

# Configure Python environment
setup_python_env() {
    info "Setting up Python environment..."
    if ! command -v python3 >/dev/null; then
        error "Python3 is not installed. Please install it before proceeding."
    fi

    if ! command -v pip >/dev/null; then
        error "pip is not installed. Please install it before proceeding."
    fi

    pip install --upgrade pip
    pip install -r requirements.txt
    info "Python dependencies installed successfully."
}

# Build the project
build_project() {
    info "Building the project..."
    mkdir -p build && cd build
    cmake ..
    make
    info "Build completed successfully."
}

# Perform optional setup tasks
optional_setup() {
    read -rp "Do you want to generate Doxygen documentation? (y/N): " generate_docs
    if [[ "$generate_docs" =~ ^[yY]$ ]]; then
        if ! command -v doxygen >/dev/null; then
            warn "Doxygen not found. Installing..."
            case "$DISTRO" in
                "Ubuntu"|"Debian") sudo apt install -y doxygen ;;
                "Fedora") sudo dnf install -y doxygen ;;
                "Arch Linux") sudo pacman -Syu --noconfirm doxygen ;;
                "macOS") brew install doxygen ;;
            esac
        fi
        doxygen Doxyfile
        info "Doxygen documentation generated in the docs/html directory."
    else
        warn "Skipping Doxygen documentation generation."
    fi
}

# Main setup routine
main() {
    check_os
    install_dependencies
    setup_python_env
    build_project
    optional_setup
    info "Setup process completed successfully. You're ready to use GhidraFridaHookGen!"
}

# Entry point
main
