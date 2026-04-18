#!/bin/bash
set -e

VM_NAME="vm-k3d-cluster"
APP_NAMING="k3d-cluster"

# Start K3D Cluster with following information:
echo "==> Start Java Apps ..."
echo "===================================="
multipass transfer java-app.yaml $VM_NAME:/home/ubuntu
multipass exec $VM_NAME -- sudo kubectl apply -f /home/ubuntu/java-app.yaml
echo "===================================="

echo "==> Done! Start Java Apps ..."