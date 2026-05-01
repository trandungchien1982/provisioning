#!/bin/bash
set -e

VM_NAME="vm-els-kibana"
APP_NAMING="zz.02.start-els-kibana"

# Start ElasticSearch+Kibana with following information:
echo "==> Start ElasticSearch+Kibana ..."
echo "===================================="
multipass transfer $APP_NAMING.sh $VM_NAME:/home/ubuntu/
multipass exec $VM_NAME -- chmod +x /home/ubuntu/$APP_NAMING.sh

# Copy all config files
multipass transfer *.yaml $VM_NAME:/home/ubuntu/
multipass transfer *.sh $VM_NAME:/home/ubuntu/

multipass exec $VM_NAME -- /home/ubuntu/$APP_NAMING.sh
echo "===================================="

echo "==> Done! ElasticSearch+Kibana"