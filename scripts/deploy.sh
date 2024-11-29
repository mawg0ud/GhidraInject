#!/bin/bash

# This script automates the deployment of the GhidraInject project.
# It packages the tool for deployment on a new system or server.

set -e

# Function to package the project
package_project() {
  echo "Packaging the project..."

  # Create a tarball of the built project
  tar -czf GhidraInject_v$(date +%Y%m%d).tar.gz build/
  echo "Project packaged as GhidraInject_v$(date +%Y%m%d).tar.gz"
}

# Function to deploy to a remote server
deploy_to_server() {
  echo "Deploying project to server..."

  # Example deployment to a remote server (replace with actual details)
  scp GhidraInject_v$(date +%Y%m%d).tar.gz user@server:/path/to/deploy/
  echo "Deployment complete."
}

# Main script execution
package_project
deploy_to_server

echo "Deployment finished."
