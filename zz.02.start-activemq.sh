#!/bin/bash
set -e

VM_NAME="vm-activemq"

# Start ActiveMQ with following information:
echo "==> Start ActiveMQ..."
echo "===================================="
sudo docker run --name main-activemq --detach --hostname main-activemq \
    --publish 61616:61616 \
    --publish 8161:8161 \
    --restart unless-stopped \
    rmohr/activemq:5.14.2-alpine
echo "==> Done! ActiveMQ ..."