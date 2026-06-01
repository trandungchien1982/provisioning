#!/bin/bash
set -e

VM_NAME="vm-coredns"
APP_NAMING="zz.02.start-coredns"

# Start CoreDNS with following information:
echo "==> Start CoreDNS ..."
echo "===================================="
# Copy all config files (docker-compose, etc ...)
multipass transfer *.* $VM_NAME:/home/ubuntu/

# To be executed :)
multipass exec $VM_NAME -- chmod +x /home/ubuntu/$APP_NAMING.sh
multipass exec $VM_NAME -- /home/ubuntu/$APP_NAMING.sh
echo "===================================="

echo "==> Done! CoreDNS ... "


=====================================
Xu ly tai day
Còn ai biết, nước chảy đá mòn
Bên cầu dệt lụa, ta nào có hay.
Phố đêm bên bờ suối vắng người đi mãi.
Còn ta mãi đợi chờ ai cho người về ...


====== Roi day, co nhung khi buon nao long ...
Co nhan bien biet co nho nhau khong ...