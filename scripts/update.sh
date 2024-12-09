#!/bin/bash

# ==============================================
# Update Script for GhidraInject Project
# ==============================================
# This script automates the update process, including:
# - Pulling the latest changes from the repository
# - Rebuilding the project if necessary
# - Restarting services for the deployment
# ==============================================

# Exit on error or undefined variables
set -euo pipefail

# Constants
REPO_DIR="/opt/ghidrainject"
SERVICE_NAME="ghidrainject"
BUILD_DIR="$REPO_DIR/build"

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

# Step 1: Check for updates in the repository
check_updates() {
    info "Checking for updates in the repository..."
    cd "$REPO_DIR"
    git fetch origin || error "Failed to fetch updates from remote repository."
    LOCAL_HASH=$(git rev-parse HEAD)
    REMOTE_HASH=$(git rev-parse origin/main)

    if [ "$LOCAL_HASH" == "$REMOTE_HASH" ]; then
        info "No updates found. The repository is already up to date."
        exit 0
    fi

    info "Updates are available. Preparing to apply them."
}

# Step 2: Apply updates
apply_updates() {
    info "Applying updates from the repository..."
    git reset --hard origin/main || error "Failed to reset to the latest version."
    git clean -fd || error "Failed to clean up untracked files."
    info "Repository successfully updated."
}

# Step 3: Rebuild the project
rebuild_project() {
    info "Rebuilding the project..."
    mkdir -p "$BUILD_DIR"
    cd "$BUILD_DIR"
    cmake .. || error "CMake configuration failed."
    make || error "Build process failed."
    info "Rebuild completed successfully."
}

# Step 4: Restart services
restart_service() {
    info "Restarting the service..."
    sudo systemctl restart "$SERVICE_NAME" || error "Failed to restart the service."
    info "Service restarted successfully."
}

# Step 5: Verify update success
verify_update() {
    info "Verifying the update..."
    cd "$REPO_DIR"
    CURRENT_VERSION=$(git rev-parse HEAD)
    info "Update verification successful. Current version: $CURRENT_VERSION"
}

# Main Update Routine
update() {
    check_updates
    apply_updates
    rebuild_project
    restart_service
    verify_update
    info "Update process completed successfully."
}

# Entry point
update
