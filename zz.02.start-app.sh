#!/bin/bash
set -e

VM_NAME="vm-nginx"

echo "==> Start Main App (Inner) ..."
cd /home/ubuntu
sudo docker-compose up -d
echo "===================================="
echo "==> Done! Main App (Inner) ..."