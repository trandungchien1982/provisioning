#!/bin/bash
set -e

VM_NAME="vm-redis"

# Start inner Redis with following information:
echo "==> Start Inner Redis ..."
cd /home/ubuntu
sudo docker-compose up -d
echo "===================================="
echo "==> Done! Inner Redis ..."