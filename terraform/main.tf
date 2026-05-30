# Khai báo biến, lấy từ khai báo trong 00.provision-vm.sh
# TF_VAR_VM_NAME
resource "multipass_instance" "vm" {
  name   = "vm-music-server"
  cpus   = 2
  memory = "2G"
  disk   = "20G"
  image  = "22.04" # 22.04 LTS
  cloudinit_file = "${path.module}/cloud-init.yaml"
}

output "vm_ip" {
  value = multipass_instance.vm.ipv4
}
