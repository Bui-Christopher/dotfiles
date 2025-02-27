# NixOS Configuration

This repository contains my NixOS configuration, using Nix Flakes for reproducibility and modularity. The configuration is organized into modules to separate system-wide, host-specific, and user-specific settings (home-manager).
It supports a laptop (Toaster), a desktop (Oven), and headless machines.

## Directory Structure

     .
    ├──  flake.lock                            # Ensures reproducibility of the flake dependencies
    ├──  flake.nix                             # The main Nix Flake configuration
    ├── 󰀂 hosts                                 # Host-specific configurations
    │   └──  toaster                           # Configurations for a Laptop named 'toaster'
    │       ├──  default.nix
    │       └──  hardware-configuration.nix
    ├──  modules                               # Modules for common and home configurations
    │   ├──  common.nix                        # Shared system configurations
    │   ├──  configuration.nix                 # General system configuration
    │   ├──  home                              # Home configurations for individual user setups
    │   │   ├──  default.nix
    │   │   ├──  firefox.nix                   # Firefox setup
    │   │   ├──  git.nix                       # Git setup
    │   │   ├──  hypr
    │   │   │   ├──  default.nix
    │   │   │   ├──  hyprland.n
    │   │   │   ├──  hyprlock.n
    │   │   │   └──  hyprpaper.nix
    │   │   ├──  nixvim.nix                    # NixVim configuration
    │   │   └──  zsh.nix                       # Zsh setup
    │   └──  nvidia.nix                        # Nvidia-specific configurations (e.g., drivers)
    └──  README.md                             # This README

## Installation

### Prereq

1. **Clone the repository**:

    ```bash
    git clone https://github.com/Bui-Christopher/dotfiles.git
    cd dotfiles/nix
    ```

2. **Generate hardware-configuration.nix**

    <!-- TODO: Add explanation-->
    ```bash
    sudo nixos-generate-config
    mv /etc/nixos/hardware-configuration.nix ./hosts/toaster/hardware-configuration.nix
    git update-index --assume-unchanged hosts/toaster/hardware-configuration.nix
    ```


3. **Apply the Configuration**

   ```bash
   sudo nixos-rebuild switch --flake .#toaster
   ```

## Notes

### Symbolic Links
<!-- TODO: Explain Problem/Solution-->
```
cd ...
ln -s waybar/config.laptop ~/.config/waybar/config
ln -s backgrounds ~/.config/backgrounds
```

## TODO's
- Hyprland gestures
