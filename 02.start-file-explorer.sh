#!/bin/bash
set -e

VM_NAME="vm-file-explorer"
APP_NAMING="zz.02.start-file-explorer"

# Start FileExplorer with following information:
echo "==> Start FileExplorer ..."
echo "===================================="
# Copy all config files (docker-compose, etc ...)
multipass transfer *.* $VM_NAME:/home/ubuntu/

# Allow the folder /home/ubuntu/host_sftp/upload to be read-write for all users
#multipass exec $VM_NAME -- mkdir -p /root/test-123 || true
#multipass exec $VM_NAME -- chmod 777 /home/ubuntu/host_sftp/upload || true

# To be executed :)
multipass exec $VM_NAME -- chmod +x /home/ubuntu/$APP_NAMING.sh
multipass exec $VM_NAME -- /home/ubuntu/$APP_NAMING.sh
echo "===================================="

echo "==> Done! FileExplorer ... "