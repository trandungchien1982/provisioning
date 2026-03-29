# provisioning - 01.RabbitMQ
Xử lý Provisioning môi trường cụ thể sử dụng Terraform &amp; Ansible &amp; Docker + Ubuntu

# Thay thế {rabbitmq_ip} trong file setup-ips.yml thành
    rabbitmq_ip: 139.162.33.26

Main Mailpit Server
- ./run.sh
  + Admin UI : http://{ip}:15672
  + User: admin
  + Pass: admin
  + Connect port: 5672
