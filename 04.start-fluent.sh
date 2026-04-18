#!/bin/bash
set -e

VM_NAME="vm-k3d-cluster"
APP_NAMING="k3d-cluster"

# Start K3D Cluster with following information:
echo "==> Start Fluent Bit on k8s ..."
echo "===================================="
multipass transfer *.yaml $VM_NAME:/home/ubuntu
multipass exec $VM_NAME -- sudo kubectl apply -f /home/ubuntu/fluent-logs-namespace.yaml
multipass exec $VM_NAME -- sudo kubectl apply -f /home/ubuntu/fluent-bit.yaml
multipass exec $VM_NAME -- sudo kubectl apply -f /home/ubuntu/fluent-bit-config.yaml
multipass exec $VM_NAME -- sudo kubectl apply -f /home/ubuntu/fluent-bit-RBAC.yaml


multipass exec $VM_NAME -- sudo kubectl get pods -n logging
echo "===================================="

echo "==> Done! Start Fluent Bit on k8s ..."