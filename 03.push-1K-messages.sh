#!/bin/bash
set -e

VM_NAME="vm-kafka-full"
APP_NAMING="zz.02.push-10K-messages"

# Start Kafka with following information:
echo "==> Start Kafka - Import 10K messages ..."
echo "===================================="
# Copy all config files (docker-compose, etc ...)
multipass transfer *.* $VM_NAME:/home/ubuntu/

# To be executed :)
multipass exec $VM_NAME -- sudo apt install -y python3-pip || true
multipass exec $VM_NAME -- sudo pip3 install kafka-python || true
multipass exec $VM_NAME -- sudo python3 push_kafka_messages.py || true
echo "===================================="

echo "==> Done! Kafka - Import 1K messages ... "