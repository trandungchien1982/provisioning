#!/bin/bash
set -e

# Start RabbitMQ with following information:
echo "==> Start RabbitMQ..."
echo "===================================="
sudo docker run --detach --hostname second-rabbit --name second-rabbit \
    --env RABBITMQ_DEFAULT_USER=admin \
    --env RABBITMQ_DEFAULT_PASS=admin \
    --publish 16672:15672 \
    --publish 6672:5672 \
     rabbitmq:management
echo "==> Done! RabbitMQ ..."