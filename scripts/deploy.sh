#!/bin/bash

# ==============================================
# Deployment Script for GhidraInject Project
# ==============================================
# This script automates deployment steps, including:
# - Pre-deployment checks
# - Building and packaging
# - Deploying to the specified target environment
# - Post-deployment validations
# ==============================================

# Exit on error or undefined variable
set -euo pipefail

# Constants
DEPLOY_DIR="/opt/ghidrainject"
BUILD_DIR="build"
PACKAGE_NAME="ghidrainject.tar.gz"
DEPLOY_USER="deploy_user"
TARGET_HOST="192.168.1.100" # Replace with the actual target host
SERVICE_NAME="ghidrainject"
REMOTE_DIR="/var/www/ghidrainject"

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

# Step 1: Pre-deployment checks
pre_deployment_checks() {
    info "Running pre-deployment checks..."
    if [ ! -d "$BUILD_DIR" ]; then
        error "Build directory not found. Please run the build script first."
    fi

    if [ ! -f "$BUILD_DIR/$PACKAGE_NAME" ]; then
        error "Package file not found in $BUILD_DIR. Ensure the project is packaged correctly."
    fi

    if ! command -v ssh >/dev/null; then
        error "SSH is not installed or configured on this system."
    fi

    if ! command -v scp >/dev/null; then
        error "SCP is not installed or configured on this system."
    fi

    info "Pre-deployment checks passed."
}

# Step 2: Package validation
validate_package() {
    info "Validating package integrity..."
    tar -tzf "$BUILD_DIR/$PACKAGE_NAME" >/dev/null || error "Package is corrupted or improperly created."
    info "Package validation successful."
}

# Step 3: Transfer package to target
transfer_package() {
    info "Transferring package to target server..."
    scp "$BUILD_DIR/$PACKAGE_NAME" "$DEPLOY_USER@$TARGET_HOST:$REMOTE_DIR/" || error "Failed to transfer package."
    info "Package transferred successfully."
}

# Step 4: Deploy on target server
deploy_on_target() {
    info "Deploying on target server..."
    ssh "$DEPLOY_USER@$TARGET_HOST" <<EOF
        set -e
        cd "$REMOTE_DIR"
        tar -xzf "$PACKAGE_NAME"
        sudo systemctl restart "$SERVICE_NAME"
        info "Deployment completed and service restarted."
EOF
}

# Step 5: Post-deployment validation
post_deployment_validation() {
    info "Validating deployment..."
    ssh "$DEPLOY_USER@$TARGET_HOST" <<EOF
        systemctl status "$SERVICE_NAME" --no-pager || error "Service failed to start properly."
EOF
    info "Deployment validated successfully."
}

# Main Deployment Routine
deploy() {
    pre_deployment_checks
    validate_package
    transfer_package
    deploy_on_target
    post_deployment_validation
    info "Deployment process completed successfully."
}

# Entry point
deploy
