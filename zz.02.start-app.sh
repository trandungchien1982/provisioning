#!/bin/bash
set -e

VM_NAME="vm-wordpress"

echo "==> Start Inner App ..."
cd /home/ubuntu
# Create common-network if not existed
sudo docker network create common-network || true
sudo docker-compose up -d
echo "===================================="
echo "==> Done! Inner App ..."