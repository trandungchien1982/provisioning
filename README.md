# provisioning - 05.Maipit
Xử lý Provisioning môi trường cụ thể sử dụng Terraform &amp; Ansible &amp; Docker + Ubuntu

# Sử dụng {mailpit_ip} trong file setup-ips.yml

Main Mailpit Server
- ./run.sh
  + Admin UI : http://{ip}:8025
  + No User/Password
  + Connect SMTP port: 1025

# Tốc độ gửi mail vào trong Mailpit rất chậm.
Cần cải thiện thêm ...