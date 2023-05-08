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
export dotfiles_dir="$scripts_dir/dotfiles"
export nitch_dir="${config}/nitch"
export nitch_config="${scripts_dir}/nitch/drawing.nim"

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
pacman -Syu
pacman -S -y blueberry chromium clang cmake curl discord docker docker-compose feh gcc gzip iproute2 nim unzip vlc wget zsh

## AUR
git clone https://aur.archlinux.org/yay.git
cd yay
sudo -u "$username" makepkg -sri --noconfirm
cd ..
rm -rf yay

# Set up configs
cd "$config"
git submodule update --init --recursive
ln -sf "$config/git/.gitconfig" "$home/.gitconfig"
mv "$config/zsh/.zshrc_home" "$home/.zshrc"
chsh -s /bin/zsh

systemctl enable docker

# Rust
curl -s https://sh.rustup.rs > rust.sh
sh rust.sh -y && rm rust.sh
rustup default stable
rustup toolchain install nightly
rustup +nightly component add rust-src rust-analyzer-preview
ln -s ${home}/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer \
 /usr/local/bin/rust-analyzer

# Nitch
cd "$nitch_dir"
cp $nitch_config $nitch_dir/src/funcs/
nimble build
chmod +x nitch
mv "$nitch_dir/nitch" "/usr/local/bin/nitch"

# xorg/i3
pacman -S -y xorg-server xorg-xinit xsel i3-wm dmenu polybar lightdm lightdm-gtk-greeter
systemctl enable bluetooth.service
systemctl enable lightdm
systemctl edit --full lightdm.service << EOF
[Unit]
After=bluetooth.service
EOF

