#!/bin/bash
set -e

# Start RabbitMQ with following information:
echo "==> Start RabbitMQ..."
echo "===================================="
sudo docker run --detach --hostname main-rabbit --name main-rabbit \
    --env RABBITMQ_DEFAULT_USER=admin \
    --env RABBITMQ_DEFAULT_PASS=admin \
    --publish 15672:15672 \
    --publish 5672:5672 \
     rabbitmq:management
echo "==> Done! RabbitMQ ..."