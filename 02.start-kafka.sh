#!/bin/bash
set -e

VM_NAME="vm-kafka"
APP_NAMING="zz.02.start-kafka"

# Start Kafka with following information:
echo "==> Start Kafka - Lightweight ..."
echo "===================================="
# Copy all config files (docker-compose, etc ...)
multipass transfer *.* $VM_NAME:/home/ubuntu/

# To be executed :)
multipass exec $VM_NAME -- chmod +x /home/ubuntu/$APP_NAMING.sh
multipass exec $VM_NAME -- /home/ubuntu/$APP_NAMING.sh
echo "===================================="

echo "==> Done! Kafka - Lightweight ... "