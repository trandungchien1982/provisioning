#!/bin/bash
set -e

VM_NAME="vm-els-kibana"

# Start inner ElasticSearch+Kibana with following information:
echo "==> Start Inner ElasticSearch+Kibana ..."
cd /home/ubuntu
sudo docker-compose up -d
echo "===================================="
echo "==> Done! Inner ElasticSearch+Kibana ..."
