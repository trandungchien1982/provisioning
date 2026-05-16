#!/bin/bash
set -e

VM_NAME="vm-coredns"

# Start inner CoreDNS with following information:
echo "==> Start Inner CoreDNS ..."
cd /home/ubuntu
sudo docker-compose up -d
echo "===================================="
echo "==> Done! Inner CoreDNS ..."