#!/bin/bash
set -e

VM_NAME="vm-mongodb"

# Start inner MongoDB with following information:
echo "==> Start Inner MongoDB ..."
cd /home/ubuntu
sudo docker-compose up -d
echo "===================================="
echo "==> Done! Inner MongoDB ..."