#!/bin/bash
set -e

VM_NAME="vm-postgres"

# Start RabbitMQ with following information:
echo "==> Start PostgreSQL - second ..."
echo "===================================="
sudo docker run --name second-postgres --detach --hostname second-postgres \
    -e POSTGRES_USER=second \
    -e POSTGRES_PASSWORD=second \
    --publish 6432:5432 \
    --restart unless-stopped \
    postgres:15
echo "==> Done! PostgreSQL | Second ..."