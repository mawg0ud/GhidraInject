#!/bin/bash

# ==============================================
# Cleanup Script for GhidraInject Project
# ==============================================
# This script removes all generated build artifacts,
# temporary files, logs, and other unnecessary items.
# It ensures the repository remains clean and consistent.
# ==============================================

# Exit on error or undefined variable
set -euo pipefail

# Define directories and files to clean
BUILD_DIR="build"
TEMP_FILES=("*.tmp" "*.log" "*.bak" "*.swp" "*.o" "*.out")
CMAKE_CACHE_FILES=("CMakeCache.txt" "cmake_install.cmake")
DOXYGEN_DOCS_DIR="docs/html"

# Colors for output
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
NC="\033[0m" # No Color

# Helper function for printing messages
info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Clean build artifacts
clean_build() {
    if [ -d "$BUILD_DIR" ]; then
        info "Removing build directory: $BUILD_DIR"
        rm -rf "$BUILD_DIR"
    else
        warn "Build directory not found: $BUILD_DIR"
    fi
}

# Clean temporary files
clean_temp_files() {
    info "Removing temporary files..."
    for pattern in "${TEMP_FILES[@]}"; do
        find . -type f -name "$pattern" -exec rm -f {} +
    done
}

# Clean CMake cache and other generated files
clean_cmake_files() {
    info "Removing CMake cache and build files..."
    for file in "${CMAKE_CACHE_FILES[@]}"; do
        if [ -f "$file" ]; then
            rm -f "$file"
            info "Removed $file"
        fi
    done
}

# Clean Doxygen documentation
clean_docs() {
    if [ -d "$DOXYGEN_DOCS_DIR" ]; then
        info "Removing Doxygen documentation directory: $DOXYGEN_DOCS_DIR"
        rm -rf "$DOXYGEN_DOCS_DIR"
    else
        warn "Doxygen documentation directory not found: $DOXYGEN_DOCS_DIR"
    fi
}

# Main cleanup routine
cleanup() {
    info "Starting cleanup process..."
    clean_build
    clean_temp_files
    clean_cmake_files
    clean_docs
    info "Cleanup process completed successfully."
}

# Confirmation prompt
confirm_cleanup() {
    read -rp "Are you sure you want to clean up the project? This action cannot be undone. (y/N): " confirm
    case "$confirm" in
        [yY][eE][sS]|[yY])
            cleanup
            ;;
        *)
            warn "Cleanup canceled by user."
            exit 0
            ;;
    esac
}

# Entry point
confirm_cleanup
