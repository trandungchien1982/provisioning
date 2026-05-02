#!/bin/bash
set -e

VM_NAME="vm-mailpit"
APP_NAMING="zz.03.send-10K-mails"

# Start Send 10K mails with following information:
echo "==> Start Send 10K mails ..."
echo "===================================="
multipass transfer *.* $VM_NAME:/home/ubuntu/
multipass exec $VM_NAME -- chmod +x /home/ubuntu/$APP_NAMING.sh
multipass exec $VM_NAME -- /home/ubuntu/$APP_NAMING.sh
echo "===================================="

echo "==> Done! Send 10K mails"