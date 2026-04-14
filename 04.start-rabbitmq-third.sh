#!/bin/bash
set -e

VM_NAME="vm-rabbitmq"

# Start RabbitMQ with following information:
echo "==> Start RabbitMQ - third ..."
echo " -- The RabbitMQ will mount to /root/$VM_NAME/third-data"

echo "===================================="
multipass transfer zz.04.start-rabbitmq-third.sh $VM_NAME:/home/ubuntu/
multipass exec $VM_NAME -- chmod +x /home/ubuntu/zz.04.start-rabbitmq-third.sh
multipass exec $VM_NAME -- /home/ubuntu/zz.04.start-rabbitmq-third.sh
echo "===================================="

echo "==> Done! RabbitMQ - third"