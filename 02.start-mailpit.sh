#!/bin/bash
set -e

VM_NAME="vm-mailpit"
APP_NAMING="zz.02.start-mailpit"

# Start Mailpit with following information:
echo "==> Start Mailpit ..."
echo "===================================="
multipass transfer $APP_NAMING.sh $VM_NAME:/home/ubuntu/
multipass exec $VM_NAME -- chmod +x /home/ubuntu/$APP_NAMING.sh

# Copy all config files (docker-compose, etc ...)
multipass transfer *.yaml $VM_NAME:/home/ubuntu/

#multipass exec $VM_NAME -- mkdir /home/ubuntu/redis-data || true
#multipass transfer *.json $VM_NAME:/home/ubuntu/realm

multipass exec $VM_NAME -- /home/ubuntu/$APP_NAMING.sh
echo "===================================="

echo "==> Done! Mailpit"