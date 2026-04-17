#!/bin/bash
set -e

VM_NAME="vm-k3d-cluster"
APP_NAMING="k3d-cluster"

# Start K3D Cluster with following information:
echo "==> Start K3D Cluster ..."
echo "===================================="
multipass transfer zz.02.start-$APP_NAMING.sh $VM_NAME:/home/ubuntu/
multipass exec $VM_NAME -- chmod +x /home/ubuntu/zz.02.start-$APP_NAMING.sh
multipass exec $VM_NAME -- /home/ubuntu/zz.02.start-$APP_NAMING.sh
echo "===================================="

echo "==> Done! K3D Cluster"