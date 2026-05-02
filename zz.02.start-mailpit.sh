#!/bin/bash
set -e

VM_NAME="vm-mailpit"

# Start inner Mailpit with following information:
echo "==> Start Inner Mailpit ..."
cd /home/ubuntu
sudo docker-compose up -d
echo "===================================="
echo "==> Done! Inner Mailpit ..."