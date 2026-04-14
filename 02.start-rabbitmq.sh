#!/bin/bash
set -e

VM_NAME="vm-rabbitmq"

# Start RabbitMQ with following information:
echo "==> Start RabbitMQ..."
echo "===================================="
multipass transfer zz.02.start-rabbitmq.sh $VM_NAME:/home/ubuntu/
multipass exec $VM_NAME -- chmod +x /home/ubuntu/zz.02.start-rabbitmq.sh
multipass exec $VM_NAME -- /home/ubuntu/zz.02.start-rabbitmq.sh
echo "===================================="

echo "==> Done! RabbitMQ"