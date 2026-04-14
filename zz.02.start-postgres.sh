#!/bin/bash
set -e

VM_NAME="vm-postgres"

# Start RabbitMQ with following information:
echo "==> Start PostgreSQL..."
echo "===================================="
sudo docker run --name main-postgres --detach --hostname main-postgres \
    -e POSTGRES_USER=admin \
    -e POSTGRES_PASSWORD=admin \
    --publish 5432:5432 \
    --restart unless-stopped \
    postgres:15
echo "==> Done! PostgreSQL ..."