# Provisioning
Xử lý Provisioning môi trường cụ thể sử dụng Terraform &amp; Ansible &amp; Docker + Ubuntu

## Mỗi branch sẽ chứa 1 Provisioning cụ thể, chẳng hạn như RabbitMQ, MySQL, PostgreSQL, ...
## Bước 1: Sử dụng Multipass để provision VM Ubuntu24.04 LTS 
  (có thể sử dụng CLI thuần hoặc dùng Terraform để define vCPUs, RAM, Disk)
## Bước 2: Multipass sẽ exec các CLIs, scripts.sh cần thiết ngay trên VM mới tạo ra để build Apps, Services, ...

## Sample CLI multipass trực tiếp :
```
multipass launch -n vm-grafana-loki --cpus 1 --memory 3G --disk 20G --cloud-init cloud-init.yaml
```

## Tiến hành provision môi trường Ubuntu 24.04 LTS, sử dụng Multipass như sau :
Config tuỳ chỉnh sử dụng Terraform + Multipass

vCPU: 1 core, 2Gb RAM, SSD 10Gb (chỉ định trong terraform)

Naming của VM Ubuntu (chỉ định trong terraform hoặc file cloud-config.yaml)

Cài sẵn : Docker, Java 25, Maven, Git, Gradle, Ansible

User/Pass : root/root và cho phép SSH

Cho phép SSH với các public key sau đây :

~/.ssh/id_rsa.pub

./allowed_public_keys

Tiến hành start docker mặc định trong hệ thống

Cho phép execute script nằm trong file : ./script.sh sau khi đã tạo xong

Terraform sau khi initial xong sẽ in ra các thông tin sau đây trong file output-config.yaml

host_ip: ${targetVM_IP}

createdAt: ${now()}
