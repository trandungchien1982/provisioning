#!/bin/bash
set -e

VM_NAME="vm-keycloak"
APP_NAMING="import-profile"

# Start Import Profile - two with following information:
echo "==> Start Import Profile ..."
echo "===================================="
multipass transfer zz.03.start-$APP_NAMING-second.sh $VM_NAME:/home/ubuntu/
multipass exec $VM_NAME -- chmod +x /home/ubuntu/zz.03.start-$APP_NAMING-second.sh
multipass exec $VM_NAME -- /home/ubuntu/zz.03.start-$APP_NAMING-second.sh
echo "===================================="

echo "==> Done! Import Profile ..."