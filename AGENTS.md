# AGENTS.md — Branch: 24.CodeServer

## Overview

This branch provisions a lightweight **online code editor** (Code-Server — VS Code in the browser) on a Ubuntu VM using Multipass + Terraform + Docker. The goal is a one-command workflow: spin up a VM, install Docker, and launch Code-Server accessible via a web browser.

---

## Stack

| Layer | Technology |
|---|---|
| VM orchestration | [Multipass](https://multipass.run/) |
| Infrastructure as Code | Terraform (`terraform/`) |
| VM bootstrap | cloud-init (`terraform/cloud-init.yaml`) |
| App runtime | Docker / Docker Compose |
| Application | `lscr.io/linuxserver/code-server:latest` |

---

## VM Specification

Defined in [terraform/main.tf](terraform/main.tf):

| Property | Value |
|---|---|
| VM name | `vm-code-server` |
| OS image | Ubuntu 22.04 LTS |
| CPUs | 2 |
| Memory | 2 GB |
| Disk | 20 GB |

---

## Code-Server Configuration

Defined in [docker-compose.yaml](docker-compose.yaml):

| Setting | Value |
|---|---|
| Image | `lscr.io/linuxserver/code-server:latest` |
| Port | `8443` (HTTP, browser access) |
| Default workspace | `/workspace` (mapped to `./workspace/`) |
| Config directory | `./config/` |
| Default password | `admin` |
| Sudo password | `admin` |
| Timezone | `Asia/Ho_Chi_Minh` |

Access the editor at: `http://<VM_IP>:8443`

---

## Provisioning Scripts (run on host machine)

Scripts are numbered in execution order:

### [00.provision-vm.sh](00.provision-vm.sh)
Creates the VM via Terraform + Multipass.
- Reads `~/.ssh/id_rsa.pub` and injects it into `terraform/cloud-init.yaml`
- Runs `terraform init` + `terraform apply`
- Writes the VM IP and timestamp to [result.yaml](result.yaml)
- Mounts `~/tdchien-mount/vm-code-server` → `/root/vm-code-server` inside the VM

### [01.install-packages.sh](01.install-packages.sh)
Transfers and executes the inner install script inside the VM.
- Copies `zz.01.install-packages.sh` → VM via `multipass transfer`
- Executes it remotely via `multipass exec`

### [02.start-app.sh](02.start-app.sh)
Transfers all config files and starts the app inside the VM.
- Copies all files (`*.*`) into the VM via `multipass transfer`
- Executes `zz.02.start-app.sh` remotely via `multipass exec`

---

## Inner VM Scripts (run inside the VM)

These `zz.*` scripts are transferred and executed inside the VM by the host scripts above.

### [zz.01.install-packages.sh](zz.01.install-packages.sh)
Installs Docker and Docker Compose inside the VM:
```
apt install -y docker.io docker-compose curl
systemctl enable docker && systemctl start docker
```

### [zz.02.start-app.sh](zz.02.start-app.sh)
Starts Code-Server via Docker Compose inside the VM:
```
cd /home/ubuntu && sudo docker-compose up -d
```

---

## SSH Access

The cloud-init config pre-authorizes two SSH public keys for the `root` user:
- `laptop-asus-Windows10`
- `tdc@MacBook-Air-cua-Doan.local`

Additional keys can be added to `terraform/cloud-init.yaml` under `ssh-authorized-keys`.

---

## Output

After provisioning, [result.yaml](result.yaml) contains:

```yaml
targetVM: <VM_IP>
finishedAt: <ISO8601 timestamp>
```

---

## Workspace

The [workspace/](workspace/) directory is mounted into Code-Server as the default workspace. It contains sample files (e.g., `test.json`) for quick validation that the editor is working.

---

## Full Provisioning Flow

```
[Host] 00.provision-vm.sh     → Creates VM via Terraform + Multipass
[Host] 01.install-packages.sh → Installs Docker inside VM
[Host] 02.start-app.sh        → Transfers files + starts Code-Server in VM
[Browser] http://<VM_IP>:8443 → Access VS Code editor
```

---

## Branch History Context

This branch (`24.CodeServer`) is part of a series of provisioning templates. Each numbered branch provisions a different service on a Multipass VM. Branch 23 ran a Music Server (Navidrome); branch 24 replaces it with Code-Server.
