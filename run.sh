echo Update the setup-ips.yml
curl -s https://raw.githubusercontent.com/trandungchien1982/provisioning/refs/heads/main/setup-ips.yml -o ./setup-ips.yml
ansible-playbook -i inventory.yml playbook.yml