#!/bin/bash
set -e

VM_NAME="vm-rabbitmq"

# Start RabbitMQ with following information:
echo "==> Start RabbitMQ, version 03 - third..."
echo " -- The RabbitMQ will mount to /root/$VM_NAME/third-data"

echo "===================================="
sudo docker run --detach --hostname third-rabbit --name third-rabbit \
    -v /root/$VM_NAME/fthird-data/:/var/lib/rabbitmq \
    -v /root/$VM_NAME/f-enable-plugins-data/:/etc/rabbitmq/enabled_plugins \
    -v /root/$VM_NAME/f-advance-config-data/:/etc/rabbitmq/advanced.config \
    -v /root/$VM_NAME/f-erlang-data/:/var/lib/rabbitmq/mnesia/.erlang.cookie \
    --env RABBITMQ_DEFAULT_USER=admin \
    --env RABBITMQ_DEFAULT_PASS=admin \
    --publish 17672:15672 \
    --publish 7672:5672 \
     rabbitmq:management
echo "==> Done! RabbitMQ third ..."