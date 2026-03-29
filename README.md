# provisioning - 05.Maipit
Xử lý Provisioning môi trường cụ thể sử dụng Terraform &amp; Ansible &amp; Docker + Ubuntu

# Thay thế {rabbitmq_ip} trong file setup-ips.yml thành
    mailpit_ip: {ip}

Main Mailpit Server
- ./run.sh
  + Admin UI : http://{ip}:8025
  + No User/Password
  + Connect SMTP port: 1025
