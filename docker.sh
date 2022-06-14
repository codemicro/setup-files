#!/bin/bash

# 2021-05-16
# Note this is for Linux Mint 20.01 (based on Ubuntu 20.04 LTS Focal Fossa)

# Add Docker repository
sudo apt-get update
sudo apt get install apt-transport-https ca-certificate curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu focal stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Test
sudo docker run hello-world

