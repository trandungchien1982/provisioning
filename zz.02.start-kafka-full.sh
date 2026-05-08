#!/bin/bash
set -e

VM_NAME="vm-kafka-full"

# Start inner Kafka - Full with following information:
echo "==> Start Inner Kafka Full ..."
cd /home/ubuntu
sudo docker-compose up -d
echo "===================================="
echo "==> Done! Inner Kafka Full ..."