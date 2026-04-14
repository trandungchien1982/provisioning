#!/bin/bash
set -e

VM_NAME="vm-activemq"

# Start ActiveMQ with following information:
echo "==> Start ActiveMQ - version2 ..."
echo "===================================="
sudo docker run --name v2-activemq --detach --hostname v2-activemq \
    --publish 62616:61616 \
    --publish 8261:8161 \
    --restart unless-stopped \
    rmohr/activemq:5.14.2-alpine
echo "==> Done! ActiveMQ - version2 ..."