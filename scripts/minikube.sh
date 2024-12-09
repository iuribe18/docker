#!/bin/bash
# Install kubectl on Ubuntu 22.04
# Autor: Ivan Uribe Gonzalez
# Date: Dec 9 2024 
# Usage: ./minikube.sh

# To install the latest minikube stable release on x86-64 Linux using binary download:
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64