#!/bin/bash

# This script is used after installing Arch Linux
# It installs basic configurations
# ./dotfiles/scripts/arch_setup.sh

set -e

export username="cookie"
export config_dir="$HOME/.config"

# Note: "$(cd "$(dirname "$0")" && pwd)" cd to running script directory
export running_script_dir="$(cd "$(dirname "$0")" && pwd)"
export dotfiles_dir="$(cd "$running_script_dir/.." && pwd)"
export nitch_dir="${config_dir}/nitch"
export nitch_config="${config_dir}/scripts/nitch/drawing.nim"

# Folders and Permissions
mv "$dotfiles_dir"/* "$config_dir"
mkdir -p "$HOME/Documents"
mkdir -p "$HOME/Downloads"

chown -R "$username:$username" "$config_dir" "$HOME/Documents" "$HOME/Downloads"

# Official Packages
sudo pacman -Syu
sudo pacman -S --noconfirm \
    blueberry chromium clang cmake curl docker docker-compose fakeroot feh \
    gcc gzip htop iproute2 jq less make nim npm openssh openssl pavucontrol \
    pkg-config polkit-kde-agent python rustup tmux tree unzip vlc wezterm \
    wget zip zsh

# AUR Helper
git clone https://aur.archlinux.org/yay.git
chown -R "$username:$username" "yay"
cd yay
sudo -u "$username" makepkg -sri --noconfirm
cd ..
rm -rf yay

# AUR Packages
yay -S --noconfirm \
    noto-fonts-emoji-blob ttf-meslo-nerd-font-powerlevel10k vesktop \
    lsd ripgrep sccache zoxide ttf-nerd-fonts-symbols

# Spotify
# spotify spicetify-cli
# sudo chmod a+wr /opt/spotify
# sudo chmod a+wr /opt/spotify/Apps -R

# Bluetooth
sudo systemctl enable bluetooth.service

# Docker
sudo systemctl enable docker
sudo usermod -aG docker "$username"

# Rust
rustup default stable
rustup install nightly
rustup +nightly component add rust-src rust-analyzer-preview
rustup component add rustfmt clippy

# Cargo
export cargo_dir="$HOME/.cargo"
export cargo_env="$cargo_dir/env"
export cargo_config="$cargo_dir/config.toml"
mkdir -p "$cargo_dir"

# Cargo Settings
echo '#!/bin/sh
case ":${PATH}:" in
    *:"$HOME/.cargo/bin":*)
        ;;
    *)
        export PATH="$HOME/.cargo/bin:$PATH"
        ;;
esac' > "$cargo_env"

echo '[target.x86_64-unknown-linux-gnu]
rustflags = ["-C", "target-cpu=native"]' > "$cargo_config"
# Rust Binaries
cargo install cargo-watch

# Convenient Scripts
sudo ln -sf "$config_dir/scripts/autopull.sh" "/usr/local/bin/autopull"
sudo ln -sf "$config_dir/scripts/vers.sh" "/usr/local/bin/vers"
chmod +x "$config_dir/scripts/autopull.sh"
chmod +x "$config_dir/scripts/vers.sh"

# Git
cd "$config_dir"
git submodule update --init --recursive
ln -sf "$config_dir/git/.gitconfig" "$HOME/.gitconfig"

# Zsh
cp "$config_dir/zsh/.zshrc_home" "$HOME/.zshenv"
chsh -s /bin/zsh

# Nitch
cd "$nitch_dir"
cp "$nitch_config" "$nitch_dir"/src/funcs/
nimble build
chmod +x nitch
sudo mv "$nitch_dir/nitch" "/usr/local/bin/nitch"

# Display

# AMD
yay -S --noconfirm \
    libva-mesa-driver mesa xf86-video-amdgpu vulkan-radeon

# Wayland/Hyprland
yay -S --noconfirm \
    fuzzel hyprland hyprpaper hyprpolkitagent qt5-wayland qt6-wayland \
    pipewire wireplumber dunst waybar hyprshot

# Login Page - sddm
yay -S --noconfirm \
    qt5-graphicaleffects qt5-quickcontrols2 qt5-svg sddm
sudo systemctl enable sddm

cd "$config_dir"
git remote set-url origin git@github.com:Bui-Christopher/dotfiles.git

reboot
