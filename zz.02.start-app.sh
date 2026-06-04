#!/bin/bash
set -e

VM_NAME="vm-unleash"

echo "==> Start Inner App ..."
cd /home/ubuntu
sudo docker-compose up -d
echo "===================================="
echo "==> Done! Inner App ..."