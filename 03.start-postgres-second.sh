#!/bin/bash
set -e

VM_NAME="vm-postgres"
APP_NAMING="postgres"

# Start PostreSQL with following information:
echo "==> Start PostreSQL - tdc ..."
echo "===================================="
multipass transfer zz.03.start-$APP_NAMING-second.sh $VM_NAME:/home/ubuntu/
multipass exec $VM_NAME -- chmod +x /home/ubuntu/zz.03.start-$APP_NAMING-second.sh
multipass exec $VM_NAME -- /home/ubuntu/zz.03.start-$APP_NAMING-second.sh
echo "===================================="

echo "==> Done! PostreSQL - tdc"