#!/bin/bash

# This script is used after installing arch linux
# It installs basic configurations

# Requirements to running script
# sudo
# useradd -m cookie ...

# 
# ├── dotfiles
# │   ├── git
# │   ├── scripts
# │   ├── zsh
# │   └── ...

# └── home
#     └── cookie
#         ├── Documents
#         ├── Downloads
#         ├── .config
#         ├── .gitconfig
#         ├── .zshrc
#         └── ...

export username="cookie"
export home="/home/${username}"
export config="$home/.config"

# Note to self:
# scripts_dir = change to parent dirctory of the running script && pwd
export scripts_dir="$(cd "$(dirname "$0")" && pwd)"
export dotfiles_dir="$(cd "$scripts_dir/.." && pwd)"
export nitch_dir="${config}/nitch"
export nitch_config="${config}/scripts/nitch/drawing.nim"

set -e

# Set up Folders
mv "$dotfiles_dir/" "$config"
mkdir -p "$home/Documents"
mkdir -p "$home/Downloads"

## Proper permissions for folders
chown -R "$username:$username" "$config"
chown -R "$username:$username" "$home/Documents"
chown -R "$username:$username" "$home/Downloads"

# Package Manager/Packages
sudo pacman -Syu
sudo pacman -S --noconfirm blueberry chromium clang cmake curl discord docker \
    docker-compose fakeroot feh gcc gzip htop iproute2 make nim openssl pavucontrol \
    pkg-config python tmux unzip vlc wget zip zsh

## AUR
git clone https://aur.archlinux.org/yay.git
chown -R "$username:$username" "yay"
cd yay
sudo -u "$username" makepkg -sri --noconfirm
cd ..
rm -rf yay

## Docker
sudo systemctl enable docker
# TODO: Add user to not require sudo

# Set up configs
cd "$config"
git submodule update --init --recursive
ln -sf "$config/git/.gitconfig" "$home/.gitconfig"
cp "$config/zsh/.zshrc_home" "$home/.zshrc"
chsh -s /bin/zsh


# Rust
curl -s https://sh.rustup.rs > rust.sh
sh rust.sh -y && rm rust.sh
source $HOME/.cargo/env
rustup default stable
rustup toolchain install nightly
rustup +nightly component add rust-src rust-analyzer-preview
rustup component add rustfmt clippy
cargo install cargo-watch
cargo install ripgrep

# Nitch
cd "$nitch_dir"
cp $nitch_config $nitch_dir/src/funcs/
nimble build
chmod +x nitch
sudo mv "$nitch_dir/nitch" "/usr/local/bin/nitch"

# xorg/i3
sudo pacman -S --noconfirm xorg-server xorg-xinit xsel i3-wm dmenu xorg-xrandr \
    arandr polybar lightdm lightdm-gtk-greeter
sudo systemctl enable bluetooth.service
sudo systemctl enable lightdm

# Have bluetooth.service start prior to lightdm.service
# systemctl edit --full lightdm.service << EOF
# [Unit]
# After=bluetooth.service
# EOF

cd $config
git remote set-url origin git@github.com:Bui-Christopher/dotfiles.git 

reboot
