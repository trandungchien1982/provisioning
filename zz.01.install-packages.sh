#!/bin/bash
set -e
VM_NAME="vm-nginx"

# Install standard packages, e.g. Docker, Docker Compose, Java, Maven, Gradle, ...
echo "==> Updating system..."
sudo apt update

echo "==> Installing base packages..."
sudo apt install -y docker.io docker-compose curl

echo "==> Enable Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "==> Done!"