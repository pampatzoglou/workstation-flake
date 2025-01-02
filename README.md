# DevOps/SRE Workstation Configuration

This repository contains a Nix Flake configuration for setting up a DevOps/SRE workstation on either NixOS or macOS. It provides a consistent development environment with all the necessary tools for cloud infrastructure, container orchestration, and development work.

## Features

- Comprehensive DevOps toolset (AWS, GCP, Azure, Kubernetes, Terraform, etc.)
- Development environment (VSCode, Git, Docker, programming languages)
- Security tools (Vault, Trivy, etc.)
- Monitoring and observability tools
- Consistent configuration across NixOS and macOS

## Prerequisites

### NixOS
- NixOS installed with flakes enabled
- Git

### macOS
1. Install Nix:
```bash
sh <(curl -L https://nixos.org/nix/install)
```

2. Enable Flakes:
```bash
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

3. Install Nix Darwin:
```bash
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer
```

## Installation

1. Clone this repository:
```bash
git clone https://github.com/pampatzoglou/workstation-flake.git
cd workstation-flake
```

2. Apply the configuration:

For NixOS:
```bash
sudo nixos-rebuild switch --flake .#workstation
```

For macOS:
```bash
darwin-rebuild switch --flake .#workstation
```

## Customization

- Common packages: Edit `common/packages.nix`
- System-specific settings:
  - NixOS: Edit `nixos/configuration.nix`
  - macOS: Edit `darwin/configuration.nix`
- Home Manager settings: Edit `common/home.nix`

## Updating

To update all packages to their latest versions:

```bash
# On NixOS
sudo nixos-rebuild switch --flake .#workstation --update-input nixpkgs

# On macOS
darwin-rebuild switch --flake .#workstation --update-input nixpkgs
```

## License

MIT
