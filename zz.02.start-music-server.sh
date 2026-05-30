#!/bin/bash
set -e

VM_NAME="vm-music-server"

echo "==> Start Inner MusicServer ..."
cd /home/ubuntu
sudo docker-compose up -d
echo "===================================="
echo "==> Done! Inner MusicServer ..."