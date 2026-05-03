#!/bin/bash
set -e

VM_NAME="vm-file-explorer"

# Start inner FileExplorer with following information:
echo "==> Start Inner FileExplorer ..."
cd /home/ubuntu
sudo docker-compose up -d
echo "===================================="
echo "==> Done! Inner FileExplorer ..."