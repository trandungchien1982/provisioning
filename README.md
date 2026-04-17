# provisioning - Môi trường GrafanaLogs trên VM Ubuntu 24.04 LTS sử dụng Multipass 
Xử lý Provisioning môi trường cụ thể sử dụng Terraform &amp; Ansible &amp; Docker + Ubuntu

# Prompt mô tả cho AI : ChatGPT
Tao đang ở môi trường Ubuntu 24.04 LTS và dự định deploy một hệ thống capture logs Java Apps như sau : 
- Java Apps được triển khai trên k8s cluster với IP1, sử dụng Docker + K3D + K3S. 
- Grafana Loki (log management) và các tool liên quan triển khai trên VM IP2, sử dụng Docker. 

Hãy liệt kê các bước chi tiết và script triển khai cụ thể, bao gồm : 
- CLI (hoặc script .sh trên từng môi trường)
- Script docker run hoặc docker-compose

# Phản hồi từ ChatGPT dành cho việc tạo Grafana Loki trên VM IP2
II. TRIỂN KHAI TRÊN IP2 (LOKI + GRAFANA)
1. Tạo thư mục
   mkdir -p /opt/loki/{config,data}
   cd /opt/loki
2. File cấu hình Loki

/opt/loki/config/loki-config.yaml

auth_enabled: false

server:
http_listen_port: 3100

common:
path: /loki
storage:
filesystem:
chunks_directory: /loki/chunks
rules_directory: /loki/rules

schema_config:
configs:
- from: 2024-01-01
store: tsdb
object_store: filesystem
schema: v13
index:
prefix: index_
period: 24h

limits_config:
retention_period: 168h

compactor:
working_directory: /loki/compactor
3. Docker Compose (Khuyến nghị)

docker-compose.yml

version: "3.8"

services:
loki:
image: grafana/loki:2.9.8
container_name: loki
ports:
- "3100:3100"
volumes:
- ./config/loki-config.yaml:/etc/loki/loki.yaml
- ./data:/loki
command: -config.file=/etc/loki/loki.yaml

grafana:
image: grafana/grafana:10.4.2
container_name: grafana
ports:
- "3000:3000"
environment:
- GF_SECURITY_ADMIN_PASSWORD=admin
volumes:
- grafana-storage:/var/lib/grafana

volumes:
grafana-storage:
4. Start services
   docker compose up -d
5. Add Loki datasource (Grafana)

Vào:

http://IP2:3000
user: admin / admin
Add datasource:
URL: http://loki:3100   (nếu cùng network docker)
hoặc
http://IP2:3100