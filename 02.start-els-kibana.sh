#!/bin/bash
set -e

VM_NAME="vm-els-kibana"
APP_NAMING="zz.02.start-els-kibana"

# Start ElasticSearch+Kibana with following information:
echo "==> Start ElasticSearch+Kibana ..."
echo "===================================="
multipass transfer $APP_NAMING.sh $VM_NAME:/home/ubuntu/
multipass transfer -r ./config $VM_NAME:/home/ubuntu/
multipass exec $VM_NAME -- chmod +x /home/ubuntu/$APP_NAMING.sh

# Copy all config files
multipass transfer *.yaml $VM_NAME:/home/ubuntu/
multipass transfer *.sh $VM_NAME:/home/ubuntu/

multipass exec $VM_NAME -- chmod +x /home/ubuntu/bootstrap.sh
multipass exec $VM_NAME -- chmod +x /home/ubuntu/kibana-entrypoint.sh

multipass exec $VM_NAME -- mkdir -p /home/ubuntu/data/elasticsearch/data || true
multipass exec $VM_NAME -- mkdir -p /home/ubuntu/data/elasticsearch/backups || true
multipass exec $VM_NAME -- mkdir -p /home/ubuntu/data/kibana/log || true

multipass exec $VM_NAME -- /home/ubuntu/$APP_NAMING.sh
echo "===================================="

echo "==> Done! ElasticSearch+Kibana"