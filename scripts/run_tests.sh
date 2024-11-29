#!/bin/bash

# This script runs the unit tests for GhidraInject to verify code correctness.

set -e

# Function to build the project (if not already built)
build_project() {
  if [ ! -d "build" ]; then
    echo "Build directory not found. Building the project..."
    ./scripts/setup.sh
  fi
}

# Function to run unit tests
run_tests() {
  echo "Running tests..."

  # Execute tests using the built executable
  if [ -f "build/GhidraInjectTest" ]; then
    ./build/GhidraInjectTest
  else
    echo "Test executable not found. Build the project first."
    exit 1
  fi
}

# Main script execution
build_project
run_tests

echo "Tests completed successfully."
