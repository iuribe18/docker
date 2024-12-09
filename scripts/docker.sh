#!/bin/bash
# Install Docker on Ubuntu 22.04
# Autor: Ivan Uribe Gonzalez
# Date: Dec 9 2024 
# Usage: ./docker.sh

# Uninstall all conflicting packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Install using the apt repository
# Before you install Docker Engine for the first time on a new host machine, you need to set up the Docker apt repository. 
# Afterward, you can install and update Docker from the repository.

## Step 1 - Set up Docker's apt repository
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

## Step 2 - Install the Docker packages
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

## Step 3 - Verify that the installation is successful by running the hello-world image
sudo docker run hello-world

## Linux post-installation steps for Docker Engine
# Manage Docker as a non-root user
# To create the docker group and add your user:
# Create the docker group
# sudo groupadd docker

# Add your user to the docker group
sudo usermod -aG docker $USER