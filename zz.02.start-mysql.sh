#!/bin/bash
set -e

VM_NAME="vm-mysql"

# Start MySQL with following information:
echo "==> Start MySQL..."
echo "===================================="
sudo docker run --name main-mysql --detach --hostname main-mysql \
    -e MYSQL_ROOT_PASSWORD=root \
    -e MYSQL_DATABASE=root \
    --publish 3306:3306 \
    --restart unless-stopped \
    mysql:9.6
echo "==> Done! MySQL ..."