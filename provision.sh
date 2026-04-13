#!/usr/bin/env bash
set -e

VM_NAME="target-vm"
RESULT_FILE="result.yaml"

echo "==> Checking dependencies..."
command -v multipass >/dev/null || { echo "Multipass not installed"; exit 1; }
command -v terraform >/dev/null || { echo "Terraform not installed"; exit 1; }

echo "==> Reading SSH public key..."
PUB_KEY=$(cat ~/.ssh/id_rsa.pub)

cd terraform

echo "==> Injecting SSH key into cloud-init..."
sed -i "s|__SSH_KEY__|${PUB_KEY}|g" cloud-init.yaml

echo "==> Initializing Terraform..."
terraform init

echo "==> Applying Terraform..."
terraform apply -auto-approve

echo "==> Fetching VM IP..."
VM_IP=$(terraform output -raw vm_ip)

cd ..

echo "==> Writing result.yaml..."
cat > ${RESULT_FILE} <<EOF
targetVM: ${VM_IP}
finishedAt: $(date -Iseconds)
EOF

echo "===================================="
echo "Provisioning completed!"
echo "VM IP: ${VM_IP}"
echo "===================================="
