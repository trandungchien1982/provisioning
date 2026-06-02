# Khai báo biến, lấy từ khai báo trong 00.provision-vm.sh
# TF_VAR_VM_NAME
resource "multipass_instance" "vm" {
  name   = "vm-nginx"
  cpus   = 2
  memory = "4G"
  disk   = "40G"
  image  = "24.04" # 24.04 LTS
  cloudinit_file = "${path.module}/cloud-init.yaml"
}

output "vm_ip" {
  value = multipass_instance.vm.ipv4
}
