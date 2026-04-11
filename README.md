# provisioning
Xử lý Provisioning môi trường cụ thể sử dụng Terraform &amp; Ansible &amp; Docker + Ubuntu

# Mỗi branch sẽ chứa 1 Provisioning cụ thể, chẳng hạn như RabbitMQ, MySQL, PostgreSQL, ...
# File setup-ips.yml sẽ chứa mapping cho ansible_host và được copy trước mỗi lần chạy Ansible, vd như :
    rabbitmq_ip: 139.162.33.26


# Tiến hành provision môi trường Ubuntu 24.04 LTS, sử dụng Multipass như sau :
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


- 01.RabbitMQ: 
   + https://github.com/trandungchien1982/provisioning/blob/01.RabbitMQ/README.md
- 02.PostgreSQL: 
   + https://github.com/trandungchien1982/provisioning/blob/01.RabbitMQ/README.md
- 03.MySQL
- 04.ActiveMQ
- 05.Mailpit
- 06.Keycloak+OAuth2+AuthorizationCode