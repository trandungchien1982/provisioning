#!/bin/bash
set -e

VM_NAME="vm-grafana-loki"
APP_NAMING="grafana-loki"

# Start Grafana+Loki with following information:
echo "==> Start Grafana+Loki..."
echo "===================================="
multipass exec $VM_NAME -- sudo mkdir -p /opt/loki/{config,data}
multipass exec $VM_NAME -- sudo chmod 777 /opt/loki
multipass exec $VM_NAME -- sudo chmod 777 /opt/loki/data

multipass transfer docker-compose.yaml $VM_NAME:/opt/loki
multipass transfer loki-config.yaml $VM_NAME:/opt/loki

multipass transfer zz.02.start-$APP_NAMING.sh $VM_NAME:/home/ubuntu/
multipass exec $VM_NAME -- chmod +x /home/ubuntu/zz.02.start-$APP_NAMING.sh
multipass exec $VM_NAME -- /home/ubuntu/zz.02.start-$APP_NAMING.sh
echo "===================================="

echo "==> Done! Grafana+Loki"