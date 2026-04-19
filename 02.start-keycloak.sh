#!/bin/bash
set -e

VM_NAME="vm-keycloak"
APP_NAMING="zz.02.start-keycloak"

# Start Keycloak with following information:
echo "==> Start Keycloak ..."
echo "===================================="
multipass transfer $APP_NAMING.sh $VM_NAME:/home/ubuntu/
multipass exec $VM_NAME -- chmod +x /home/ubuntu/$APP_NAMING.sh

# Copy all config files
multipass transfer *.yaml $VM_NAME:/home/ubuntu/

multipass exec $VM_NAME -- mkdir /home/ubuntu/realm || true
multipass transfer *.json $VM_NAME:/home/ubuntu/realm

multipass exec $VM_NAME -- /home/ubuntu/$APP_NAMING.sh
echo "===================================="

echo "==> Done! Keycloak"