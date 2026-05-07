#!/bin/bash
set -e

VM_NAME="vm-sql-server"

# Start inner SQL Server with following information:
echo "==> Start Inner SQLServer ..."
cd /home/ubuntu
sudo docker-compose up -d
echo "===================================="
echo "==> Done! Inner SQL Server ..."