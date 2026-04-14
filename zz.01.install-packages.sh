#!/bin/bash
set -e
VM_NAME="vm-mysql"

# Install standard packages, e.g. Docker, Docker Compose, Java, Maven, Gradle, ...
echo "==> Updating system..."
sudo apt update

echo "==> Installing base packages..."
sudo apt install -y docker.io docker-compose curl

echo "==> Enable Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "==> Installing Java stack..."
sudo apt install -y openjdk-21-jdk maven gradle

echo "==> Setup app directories..."
sudo mkdir -p /opt/stack
sudo mkdir -p /opt/nginx-html

echo "==> Done!"