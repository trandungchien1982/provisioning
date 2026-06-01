# provisioning - Môi trường CodeServer trên VM Ubuntu 24.04 LTS sử dụng Multipass 
Xử lý Provisioning môi trường cụ thể sử dụng Terraform &amp; Ansible &amp; Docker + Ubuntu

# Hiện tại ta sử dụng Code-Server để tạo Online Editor, mức leightweight ...

-----------------------------------------------------------------------
Cho phép SSH với các public key sau đây :

~/.ssh/id_rsa.pub

./allowed_public_keys

Tiến hành start docker mặc định trong hệ thống

Cho phép execute script nằm trong file : ./script.sh sau khi đã tạo xong

Terraform sau khi initial xong sẽ in ra các thông tin sau đây trong file output-config.yaml

host_ip: ${targetVM_IP}

createdAt: ${now()}

