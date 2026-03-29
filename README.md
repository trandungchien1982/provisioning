# provisioning - 01.RabbitMQ
Xử lý Provisioning môi trường cụ thể sử dụng Terraform &amp; Ansible &amp; Docker + Ubuntu

# Thay thế {rabbitmq_ip} trong file setup-ips.yml thành
    rabbitmq_ip: 139.162.33.26

Main RabbitMQ Server
- ./run.sh
  + Admin UI : http://{ip}:15672
  + User: admin
  + Pass: admin
  + Connect port: 5672

RabbitMQ Server 2
- ./run-rabbit-2.sh
    + Admin UI : http://{ip}:25672
    + User: admin
    + Pass: admin
    + Connect port: 56722

RabbitMQ Server 3
- ./run-rabbit-3.sh
    + Admin UI : http://{ip}:35672
    + User: admin
    + Pass: admin
    + Connect port: 56723



