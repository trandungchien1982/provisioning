#!/bin/bash
set -e

VM_NAME="vm-keycloak"

# Start inner Import Profile with following information:
echo "==> Start Inner Import Profile ..."
echo "===================================="
#sudo docker run --name v2-activemq --detach --hostname v2-activemq \
#    --publish 62616:61616 \
#    --publish 8261:8161 \
#    --restart unless-stopped \
#    rmohr/activemq:5.14.2-alpine
echo "==> Done! Inner Import Profile ..."