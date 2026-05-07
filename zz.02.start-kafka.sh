#!/bin/bash
set -e

VM_NAME="vm-kafka"

# Start inner Kafka - Lightweight with following information:
echo "==> Start Inner Kafka ..."
cd /home/ubuntu
sudo docker-compose up -d
echo "===================================="
echo "==> Done! Inner Kafka ..."