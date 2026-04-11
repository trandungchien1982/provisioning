terraform {
  required_version = ">= 1.3.0"
}

provider "null" {}

locals {
  vm_name = "ubuntu-2404-dev"

  ssh_keys = [
    file("~/.ssh/id_rsa.pub"),
    file("./allowed_public_keys/id_rsa1.pub"),
    file("./allowed_public_keys/id_rsa2.pub")
  ]

  cloud_config = templatefile("${path.module}/cloud-config.tpl.yaml", {
    vm_name  = local.vm_name
    ssh_keys = local.ssh_keys
  })
}

resource "local_file" "cloud_init" {
  content  = local.cloud_config
  filename = "${path.module}/cloud-config.yaml"
}

resource "null_resource" "multipass_vm" {

  provisioner "local-exec" {
    command = <<EOT
multipass launch 24.04 \
  --name ${local.vm_name} \
  --cpus 1 \
  --memory 2G \
  --disk 10G \
  --cloud-init cloud-config.yaml
EOT
  }
}

# Lấy IP VM
resource "null_resource" "get_ip" {
  depends_on = [null_resource.multipass_vm]

  provisioner "local-exec" {
    command = <<EOT
multipass info ${local.vm_name} | grep IPv4 | awk '{print $2}' > vm_ip.txt
EOT
  }
}

# Tạo file output-config.yaml
resource "null_resource" "output_file" {
  depends_on = [null_resource.get_ip]

  provisioner "local-exec" {
    command = <<EOT
IP=$(cat vm_ip.txt)

cat <<EOF > output-config.yaml
host_ip: $IP
host_info: "1 CPU | 2GB RAM | 10GB SSD"
createdAt: "$(date -Iseconds)"
EOF
EOT
  }
}