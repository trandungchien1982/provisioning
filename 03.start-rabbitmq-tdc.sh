#!/bin/bash
set -e

VM_NAME="vm-rabbitmq"

# Start RabbitMQ with following information:
echo "==> Start RabbitMQ - tdc ..."
echo "===================================="
multipass transfer zz.03.start-rabbitmq-tdc.sh $VM_NAME:/home/ubuntu/
multipass exec $VM_NAME -- chmod +x /home/ubuntu/zz.03.start-rabbitmq-tdc.sh
multipass exec $VM_NAME -- /home/ubuntu/zz.03.start-rabbitmq-tdc.sh
echo "===================================="

echo "==> Done! RabbitMQ - tdc"