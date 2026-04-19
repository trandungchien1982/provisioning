#!/bin/bash
set -e

VM_NAME="vm-keycloak"

# Start inner Keycloak with following information:
echo "==> Start Inner Keycloak ..."
cd /home/ubuntu
sudo docker-compose up -d
echo "===================================="
echo "==> Done! Inner Keycloak ..."