resource "multipass_instance" "vm" {
  name   = "vm-test-01"
  cpus   = 2
  memory = "4G"
  disk   = "20G"
  image  = "22.04" # 22.04 LTS
  cloudinit_file = "${path.module}/cloud-init.yaml"
}

output "vm_ip" {
  value = multipass_instance.vm.ipv4
}
