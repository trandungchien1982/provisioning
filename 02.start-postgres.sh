#!/bin/bash
set -e

VM_NAME="vm-postres"
APP_NAMING="postgres"

# Start PostgreSQL with following information:
echo "==> Start PostgreSQL..."
echo "===================================="
multipass transfer zz.02.start-$APP_NAMING.sh $VM_NAME:/home/ubuntu/
multipass exec $VM_NAME -- chmod +x /home/ubuntu/zz.02.start-$APP_NAMING.sh
multipass exec $VM_NAME -- /home/ubuntu/zz.02.start-$APP_NAMING.sh
echo "===================================="

echo "==> Done! PostgreSQL"