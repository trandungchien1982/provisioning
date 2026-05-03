#!/bin/bash
set -e

VM_NAME="vm-sftp"

# Start inner MongoDB with following information:
echo "==> Start Inner SFTP ..."
cd /home/ubuntu
sudo docker-compose up -d
echo "===================================="
echo "==> Done! Inner SFTP ..."