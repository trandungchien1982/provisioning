# provisioning - Môi trường Unleash Server trên VM Ubuntu 24.04 LTS sử dụng Multipass 
Xử lý Provisioning môi trường cụ thể sử dụng Terraform &amp; Ansible &amp; Docker + Ubuntu

# Tạo Server WordPress, sử dụng PHP Service, MariaDB, nginx ở dạng reverse proxy để tạo multi websites
- Domain : site1.tdc.vv -> wordpress-site1:80
- Domain : site2.tdc.vv -> wordpress-site2:80

-----------------------------------------------------------------------
Cho phép SSH với các public key sau đây :

~/.ssh/id_rsa.pub

./allowed_public_keys

Tiến hành start docker mặc định trong hệ thống

Cho phép execute script nằm trong file : ./script.sh sau khi đã tạo xong

Terraform sau khi initial xong sẽ in ra các thông tin sau đây trong file output-config.yaml

host_ip: ${targetVM_IP}

createdAt: ${now()}

