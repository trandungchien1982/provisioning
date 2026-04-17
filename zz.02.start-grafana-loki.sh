#!/bin/bash
set -e

VM_NAME="vm-grafana-loki"

# Start Grafana+Loki with following information:
echo "==> Start Grafana+Loki ..."
echo "===================================="
cd /opt/loki

sudo docker-compose up -d

echo "==> Done! Grafana+Loki ..."