#!/bin/bash
set -e

VM_NAME="vm-k3d-cluster"

echo "==> Start K3D Cluster Toolbar… ..."
echo "===================================="
# k3d
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# Create Cluster K3D
k3d cluster create tdc-cluster \
  --agents 2 \
  --port "8080:80@loadbalancer"

# Check nodes
kubectl get cluster
kubectl get nodes

echo "==> Done! K3D Cluster ..."