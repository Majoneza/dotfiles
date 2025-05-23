# 🐧 NixOS System Configuration

Welcome to my **NixOS configuration repository**! This repo contains the declarative setup for my NixOS systems using the [Nix](https://nixos.org) package manager and [Home Manager](https://nix-community.github.io/home-manager/) (if applicable). It's designed to be reproducible, modular, and easy to deploy across multiple machines.

## 📁 Repository Structure

```bash
.
├── hosts/                # Host-specific configurations
├── modules/              # Reusable NixOS configuration modules
├── lib/                  # Helpful functions
├── home/                 # Home Manager configurations
├── secrets/              # Bank account information in plain text
├── flake.nix             # Main Nix flake entry point
├── flake.lock            # Flake lock file to ensure reproducibility (...)
└── README.md             # This file
```
