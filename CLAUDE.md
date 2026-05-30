# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository concept

Each **git branch = one service provisioning**. The `main` branch holds the template; all other branches (e.g. `22.CoreDNS`, `21.Kafka.Light`, `17.MongoDB`) are independent, self-contained setups for a specific middleware or infrastructure service running on a local Multipass VM.

Never mix configuration from different branches. When switching service, check out the corresponding branch.

## Execution order (per branch)

Run these scripts in sequence on the **host machine**:

```bash
# Step 1 — Create the VM via Terraform + Multipass
bash 00.provision-vm.sh

# Step 2 — Install Docker and base packages inside the VM
bash 01.install-packages.sh

# Step 3 — Transfer config files and start the service inside the VM
bash 02.start-<service>.sh
```

`result.yaml` is written by step 1 and contains the VM IP (`targetVM`) and creation timestamp.

## Architecture

```
host machine (Multipass + Terraform)
  └── terraform/
        ├── main.tf            — VM spec: name, CPU, RAM, disk, Ubuntu image
        ├── terraform.tf       — provider: larstobi/multipass ~> 1.4
        └── cloud-init.yaml    — SSH keys, root user; packages/runcmd intentionally
                                 commented out to avoid Terraform timeout

  └── 00.provision-vm.sh      — injects ~/.ssh/id_rsa.pub into cloud-init, runs
                                 terraform apply, writes result.yaml, mounts
                                 ~/tdchien-mount/<VM_NAME> into the VM

  └── 01.install-packages.sh  — transfers zz.01.install-packages.sh into VM,
                                 runs it (apt: docker.io, docker-compose, curl)

  └── 02.start-<service>.sh   — transfers all config files into VM,
                                 runs zz.02.start-<service>.sh which does
                                 docker-compose up -d
```

**Why the `zz.*` prefix?** Scripts prefixed `zz.` run *inside the VM*; scripts without the prefix run on the host. The host scripts transfer their `zz.*` counterparts via `multipass transfer` then execute them remotely.

## CoreDNS branch specifics (`22.CoreDNS`)

CoreDNS is the central DNS resolver for the entire lab. All other VMs resolve hostnames through it.

- **`Corefile`** — listens on port 53 (UDP+TCP); resolves from `zones/hosts`; forwards unknown queries to `8.8.8.8` / `1.1.1.1`; caches 30 s
- **`zones/hosts`** — flat hosts-file mapping every lab VM hostname (e.g. `vm-kafka`, `vm-redis`) to its Multipass IP
- **`docker-compose.yaml`** — runs `coredns/coredns:1.14.2`, binds port 53, mounts `./Corefile` and `./zones`

To add a new VM to DNS resolution, append a line to `zones/hosts` and restart the container (`docker-compose restart coredns` inside the VM).

## Terraform VM defaults (current branch)

| Setting | Value |
|---------|-------|
| Name | `vm-coredns` |
| Image | Ubuntu 22.04 LTS |
| CPUs | 2 |
| RAM | 2 GB |
| Disk | 20 GB |

To change the VM name, update `main.tf` and the `VM_NAME` variable in all three `00/01/02` scripts.

## SSH access

```bash
multipass shell vm-coredns          # interactive shell
multipass exec vm-coredns -- <cmd>  # run a single command
```

Two authorized public keys are pre-loaded in `cloud-init.yaml`: `laptop-asus-Windows10` and `tdc@MacBook-Air`.