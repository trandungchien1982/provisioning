#!/bin/bash
set -e

VM_NAME="vm-mysql"
APP_NAMING="mysql"

# Start MySQL with following information:
echo "==> Start MySQL..."
echo "===================================="
multipass transfer zz.02.start-$APP_NAMING.sh $VM_NAME:/home/ubuntu/
multipass exec $VM_NAME -- chmod +x /home/ubuntu/zz.02.start-$APP_NAMING.sh
multipass exec $VM_NAME -- /home/ubuntu/zz.02.start-$APP_NAMING.sh
echo "===================================="

echo "==> Done! MySQL"