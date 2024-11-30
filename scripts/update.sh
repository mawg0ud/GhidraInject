#!/bin/bash

# This script checks for updates to the GhidraInject project.
# It pulls the latest changes from the repository and ensures the system is up to date.

set -e

# Function to update the repository
update_repository() {
  echo "Checking for repository updates..."

  git pull origin main
  echo "Repository updated to the latest version."
}

# Function to update system dependencies
update_dependencies() {
  echo "Updating system dependencies..."

  if command -v apt-get &> /dev/null; then
    sudo apt-get update
    sudo apt-get upgrade -y
  elif command -v yum &> /dev/null; then
    sudo yum update -y
  else
    echo "Unsupported package manager."
    exit 1
  fi
}

# Main script execution
update_repository
update_dependencies

echo "System and repository are up to date."
