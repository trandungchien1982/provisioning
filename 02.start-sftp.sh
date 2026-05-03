#!/bin/bash
set -e

VM_NAME="vm-sftp"
APP_NAMING="zz.02.start-sftp"

# Start SFTP with following information:
echo "==> Start SFTP ..."
echo "===================================="
# Copy all config files (docker-compose, etc ...)
multipass transfer *.* $VM_NAME:/home/ubuntu/

multipass exec $VM_NAME -- chmod +x /home/ubuntu/$APP_NAMING.sh
multipass exec $VM_NAME -- /home/ubuntu/$APP_NAMING.sh
echo "===================================="

echo "==> Done! SFTP ... "