#!/usr/bin/env bash
set -e

# =============================================================================
# all.sh — Combined provisioning script for CoreDNS (22.CoreDNS branch)
# Runs all steps in sequence: provision VM → install packages → start service
#
# NOTE: zz.* functions run *inside* the VM; they are embedded here for
#       reference but are transferred and executed remotely by steps 01 and 02.
# =============================================================================


# =============================================================================
# STEP 00 — 00.provision-vm.sh (runs on host)
# =============================================================================
step_00_provision_vm() {
  VM_NAME="vm-coredns"
  RESULT_FILE="result.yaml"

  echo "==> Checking dependencies..."
  echo " -- New VM will be created: VM_NAME = $TF_VAR_VM_NAME "
  command -v multipass >/dev/null || { echo "Multipass not installed"; exit 1; }
  command -v terraform >/dev/null || { echo "Terraform not installed"; exit 1; }

  echo "==> Reading SSH public key..."
  PUB_KEY=$(cat ~/.ssh/id_rsa.pub)

  cd terraform

  echo "==> Injecting SSH key into cloud-init..."
  sed -i.bak "s|__SSH_KEY__|${PUB_KEY}|g" cloud-init.yaml

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

  echo "======================================="
  echo "Try to mount folder to main host"
  mkdir ~/tdchien-mount/$VM_NAME
  multipass mount ~/tdchien-mount/$VM_NAME $VM_NAME:/root/$VM_NAME
  echo "Finish mounting folder : ~/tdchien-mount/$VM_NAME into $VM_NAME:/root/$VM_NAME"
  echo "===================== End provision ... "
}


# =============================================================================
# STEP 01 — 01.install-packages.sh (runs on host, transfers zz.01 into VM)
# =============================================================================
step_01_install_packages() {
  VM_NAME="vm-coredns"

  echo "===================================="
  echo "Current VM NAME: $VM_NAME"
  echo "Call action after provision finish, prevent timeout error ..."
  multipass transfer zz.01.install-packages.sh $VM_NAME:/home/ubuntu/
  multipass exec $VM_NAME -- chmod +x /home/ubuntu/zz.01.install-packages.sh
  multipass exec $VM_NAME -- /home/ubuntu/zz.01.install-packages.sh
  echo "===================================="

  echo "==> Done!"
}


# =============================================================================
# STEP 02 — 02.start-coredns.sh (runs on host, transfers zz.02 into VM)
# =============================================================================
step_02_start_coredns() {
  VM_NAME="vm-coredns"
  APP_NAMING="zz.02.start-coredns"

  echo "==> Start CoreDNS ..."
  echo "===================================="
  multipass transfer *.* $VM_NAME:/home/ubuntu/

  multipass exec $VM_NAME -- chmod +x /home/ubuntu/$APP_NAMING.sh
  multipass exec $VM_NAME -- /home/ubuntu/$APP_NAMING.sh
  echo "===================================="

  echo "==> Done! CoreDNS ... "
}


# =============================================================================
# ZZ STEP 01 — zz.01.install-packages.sh (runs *inside* VM)
# =============================================================================
zz_step_01_install_packages() {
  VM_NAME="vm-coredns"

  echo "==> Updating system..."
  sudo apt update

  echo "==> Installing base packages..."
  sudo apt install -y docker.io docker-compose curl

  echo "==> Enable Docker..."
  sudo systemctl enable docker
  sudo systemctl start docker

  echo "==> Done!"
}


# =============================================================================
# ZZ STEP 02 — zz.02.start-coredns.sh (runs *inside* VM)
# =============================================================================
zz_step_02_start_coredns() {
  VM_NAME="vm-coredns"

  echo "==> Start Inner CoreDNS ..."
  cd /home/ubuntu
  sudo docker-compose up -d
  echo "===================================="
  echo "==> Done! Inner CoreDNS ..."
}


# =============================================================================
# Main — run host-side steps in sequence
# =============================================================================
step_00_provision_vm
step_01_install_packages
step_02_start_coredns

now=$(date -Iseconds)
totalFiles=$(find "$(dirname "$0")" -not -path '*/.git/*' -type f | wc -l)
echo "Total files in the project at $now is $totalFiles"
