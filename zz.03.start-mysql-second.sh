#!/bin/bash
set -e

VM_NAME="vm-mysql"

# Start MySQL with following information:
echo "==> Start MySQL - two ..."
echo "===================================="
sudo docker run --name two-mysql --detach --hostname two-mysql \
    -e MYSQL_ROOT_PASSWORD=root \
    -e MYSQL_DATABASE=two \
    --publish 4306:3306 \
    --restart unless-stopped \
    mysql:9.6
echo "==> Done! MySQL - two ..."