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

set -e

export username="cookie"
export home="/home/${username}"
export config="$home/.config"

# Note: "$(cd "$(dirname "$0")" && pwd)" cd to running script directory
export scripts_dir="$(cd "$(dirname "$0")" && pwd)"
export dotfiles_dir="$(cd "$scripts_dir/.." && pwd)"
export nitch_dir="${config}/nitch"
export nitch_config="${config}/scripts/nitch/drawing.nim"

# Folders and Permissions
mv "$dotfiles_dir/" "$config"
mkdir -p "$home/Documents"
mkdir -p "$home/Downloads"

chown -R "$username:$username" "$config"
chown -R "$username:$username" "$home/Documents"
chown -R "$username:$username" "$home/Downloads"

# Official Packages
sudo pacman -Syu
sudo pacman -S --noconfirm blueberry chromium clang cmake curl docker \
    docker-compose fakeroot feh gcc gzip htop iproute2 kitty make nim openssh openssl \
    pavucontrol pkg-config pulseaudio python rustup tmux unzip vlc wezterm wget zip zsh

# AUR Helper
git clone https://aur.archlinux.org/yay.git
chown -R "$username:$username" "yay"
cd yay
sudo -u "$username" makepkg -sri --noconfirm
cd ..
rm -rf yay

# TODO: Double check these packages
# AUR Packages
yay -S --noconfirm noto-fonts-emoji ttf-meslo-nerd-font-powerlevel10k webcord

# Spotify
# spotify spicetify-cli 
# sudo chmod a+wr /opt/spotify
# sudo chmod a+wr /opt/spotify/Apps -R

# Docker
sudo systemctl enable docker
sudo usermod -aG docker "$username"

# Rust
rustup default stable
rustup toolchain install nightly
rustup +nightly component add rust-src rust-analyzer-preview
rustup component add rustfmt clippy

# Cargo
export cargo_dir="$home/.cargo"
export cargo_env="$cargo_dir/env"
export cargo_config="$cargo_dir/config"
mkdir -p "$cargo_dir"

# Cargo Binaries Path
touch "$cargo_env"
# tmp=""
# echo "$tmp" > "$cargo_env"
source $home/.cargo/env

# Optimize for Linux: musl/gnu?
touch "$cargo_config"
tmp="[target.x86_64-unknown-linux-gnu]
rustflags = [\"-C\", \"target-cpu=native\"]"
echo "$tmp" > "$cargo_config"

# Rust Binaries
cargo install cargo-watch lsd ripgrep sccache zoxide

# Convenient Scripts
sudo ln -sf "$config/scripts/autopull.sh" "/usr/local/bin/autopull"
sudo ln -sf "$config/scripts/vers.sh" "/usr/local/bin/vers"
chmod +x $config/scripts/autopull.sh
chmod +x $config/scripts/vers.sh

# Git
cd "$config"
git submodule update --init --recursive
ln -sf "$config/git/.gitconfig" "$home/.gitconfig"

# Zsh
cp "$config/zsh/.zshrc_home" "$home/.zshrc"
chsh -s /bin/zsh

# Nitch
cd "$nitch_dir"
cp $nitch_config $nitch_dir/src/funcs/
nimble build
chmod +x nitch
sudo mv "$nitch_dir/nitch" "/usr/local/bin/nitch"

# Xorg/i3
# sudo pacman -S --noconfirm xorg-server xorg-xinit xsel i3-wm dmenu xorg-xrandr \
#     arandr polybar lightdm lightdm-gtk-greeter

# lightdm
# sudo systemctl enable lightdm

# Wayland/Hyprland 
yay -S libva-mesa-driver mesa xf86-video-amdgpu vulkan-radeon fuzzel \
    hyprland hyprpaper qt5-wayland qt6-wayland pipewire wireplumber polkit-kde-agent \
    dunst waybar hyprshot sddm

# sddm
sudo systemctl enable sddm

# TODO Have bluetooth.service start prior to Display Manager
# sudo systemctl enable bluetooth.service

cd $config
git remote set-url origin git@github.com:Bui-Christopher/dotfiles.git 

reboot
