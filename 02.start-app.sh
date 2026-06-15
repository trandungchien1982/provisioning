#!/bin/bash
set -e

VM_NAME="vm-wordpress"
APP_NAMING="zz.02.start-app"

# Start WordPress with following information:
echo "==> Start App ..."
echo "===================================="
# Copy all config files (docker-compose, etc ...)
multipass transfer *.* $VM_NAME:/home/ubuntu/
multipass exec $VM_NAME -- mkdir -p /home/ubuntu/certs /home/ubuntu/nginx/https-conf.d
multipass transfer ./nginx/https-conf.d/* $VM_NAME:/home/ubuntu/nginx/https-conf.d
multipass transfer ./certs/* $VM_NAME:/home/ubuntu/certs

# To be executed :)
multipass exec $VM_NAME -- chmod +x /home/ubuntu/$APP_NAMING.sh
multipass exec $VM_NAME -- /home/ubuntu/$APP_NAMING.sh
echo "===================================="

echo "==> Done! App ... "