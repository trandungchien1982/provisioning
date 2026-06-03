#!/bin/bash
set -e

VM_NAME="vm-nginx"

echo "==> Start Main App - https (Inner) ..."
cd /home/ubuntu
sudo docker-compose -f docker-compose-https.yaml up -d
echo "===================================="
echo "==> Done! Main App - https (Inner) ..."