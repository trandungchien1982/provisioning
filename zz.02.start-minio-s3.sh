#!/bin/bash
set -e

VM_NAME="vm-minio-s3"

# Start inner Minio S3 with following information:
echo "==> Start Inner Minio S3 ..."
cd /home/ubuntu
sudo docker-compose up -d
echo "===================================="
echo "==> Done! Inner Minio S3 ..."