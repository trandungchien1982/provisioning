#!/bin/bash
set -e

VM_NAME="vm-sftp"
APP_NAMING="zz.02.start-sftp"

# Start SFTP with following information:
echo "==> Start SFTP ..."
echo "===================================="
# Copy all config files (docker-compose, etc ...)
multipass transfer *.* $VM_NAME:/home/ubuntu/

# Allow the folder /home/ubuntu/host_sftp/upload to be read-write for all users
multipass exec $VM_NAME -- mkdir -p /home/ubuntu/host_sftp/upload || true
multipass exec $VM_NAME -- chmod 777 /home/ubuntu/host_sftp/upload || true

# To be executed :)
multipass exec $VM_NAME -- chmod +x /home/ubuntu/$APP_NAMING.sh
multipass exec $VM_NAME -- /home/ubuntu/$APP_NAMING.sh
echo "===================================="

echo "==> Done! SFTP ... "