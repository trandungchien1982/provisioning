# provisioning
Xử lý Provisioning môi trường cụ thể sử dụng Terraform &amp; Ansible &amp; Docker + Ubuntu

# Mỗi branch sẽ chứa 1 Provisioning cụ thể, chẳng hạn như RabbitMQ, MySQL, PostgreSQL, ...
# File setup-ips.yml sẽ chứa mapping cho ansible_host và được copy trước mỗi lần chạy Ansible, vd như :
    rabbitmq_ip: 139.162.33.26


# Danh sách các nhánh provisioning:
- 01.RabbitMQ: 
   + https://github.com/trandungchien1982/provisioning/blob/01.RabbitMQ/README.md
- 02.PostgreSQL: 
   + https://github.com/trandungchien1982/provisioning/blob/01.RabbitMQ/README.md
- 03.MySQL
- 04.ActiveMQ
- 05.Mailpit
