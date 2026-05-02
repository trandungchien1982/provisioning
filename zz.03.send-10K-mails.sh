#!/bin/bash
set -e

VM_NAME="vm-mailpit"

# Start inner Mailpit + Send 10K Mails with following information:
echo "==> Start Inner Mailpit + Send 10K Mails ..."
cd /home/ubuntu
sudo apt install -y python3
sudo python3 send_10K_mails.py

echo "===================================="
echo "==> Done! Inner Mailpit + Send 10K Mails  ..."