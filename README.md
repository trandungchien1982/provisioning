# provisioning - Môi trường Unleash Server trên VM Ubuntu 24.04 LTS sử dụng Multipass 
Xử lý Provisioning môi trường cụ thể sử dụng Terraform &amp; Ansible &amp; Docker + Ubuntu

# Login mặc định : 
- Username: admin
- Password: unleash4all

# Unleash config:
- Version sử dụng : Unleash Open Source 7.6.4
- Khi tạo ff thì nó đang mặc định map vào 2 environment: `development` & `production`
- Ta sẽ tạo 2 API tokens riêng biệt để access vào `development` hoặc `production`. 
  Như vậy, vẫn có thể dùng 1 Unleash Server và config ff theo env variables.
- `test-app` để thử nghiệm ff với 2 profile config như sau :
  (tham khảo thêm trong file README.md của project)
  - development: 
    - export UNLEASH_API_URL='http://localhost:7000/api'
    - export UNLEASH_API_TOKEN='*:development.35a1b6148a05099f72cadb7b5c4154b5c2bd5135cc20bee41173e886'
    - gradle bootRun --args='--spring.profiles.active=development'
  - production:
    - export UNLEASH_API_TOKEN_PRODUCTION='*:production.21530623adadef6b4d7ebaac7be8c916fda06e67435b6ca2f4184c3a'
    - gradle bootRun --args='--spring.profiles.active=production'

-----------------------------------------------------------------------
Cho phép SSH với các public key sau đây :

~/.ssh/id_rsa.pub

./allowed_public_keys

Tiến hành start docker mặc định trong hệ thống

Cho phép execute script nằm trong file : ./script.sh sau khi đã tạo xong

Terraform sau khi initial xong sẽ in ra các thông tin sau đây trong file output-config.yaml

host_ip: ${targetVM_IP}

createdAt: ${now()}

