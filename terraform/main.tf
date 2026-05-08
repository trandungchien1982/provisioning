# Khai báo biến, lấy từ khai báo trong 00.provision-vm.sh
# TF_VAR_VM_NAME
resource "multipass_instance" "vm" {
  name   = "vm-kafka-full"
  cpus   = 3
  memory = "5G"
  disk   = "30G"
  image  = "22.04" # 22.04 LTS
  cloudinit_file = "${path.module}/cloud-init.yaml"
}

output "vm_ip" {
  value = multipass_instance.vm.ipv4
}
