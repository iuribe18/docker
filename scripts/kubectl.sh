#!/bin/bash
# Install kubectl on Ubuntu 22.04
# Autor: Ivan Uribe Gonzalez
# Date: Dec 9 2024 
# Usage: ./kubectl.sh

# Install kubectl binary with curl on Linux
# Download the latest release with the command:
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Install kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Test to ensure the version you installed is up-to-date:
kubectl version --client

# Or use this for detailed view of version:
kubectl version --client --output=yaml