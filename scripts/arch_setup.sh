#!/bin/bash

# This script is used after installing arch linux
# It installs basic configurations

# Requirements to running script
# sudo
# useradd -m cookie ...

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
export config_dir="$HOME/.config"

# Note: "$(cd "$(dirname "$0")" && pwd)" cd to running script directory
export running_script_dir="$(cd "$(dirname "$0")" && pwd)"
export dotfiles_dir="$(cd "$running_script_dir/.." && pwd)"
export nitch_dir="${config_dir}/nitch"
export nitch_config="${config_dir}/scripts/nitch/drawing.nim"

# Folders and Permissions
mv "$dotfiles_dir/" "$config_dir"
mkdir -p "$HOME/Documents"
mkdir -p "$HOME/Downloads"

chown -R "$username:$username" "$config_dir"
chown -R "$username:$username" "$HOME/Documents"
chown -R "$username:$username" "$HOME/Downloads"

# Official Packages
sudo pacman -Syu
sudo pacman -S --noconfirm blueberry chromium clang cmake curl docker \
    docker-compose fakeroot feh gcc gzip htop iproute2 kitty less make nim openssh \
    openssl pavucontrol pkg-config pulseaudio pulseaudio-bluetooth polkit-kde-agent \
    python rustup tmux tree unzip vlc wezterm wget zip zsh

# AUR Helper
git clone https://aur.archlinux.org/yay.git
chown -R "$username:$username" "yay"
cd yay
sudo -u "$username" makepkg -sri --noconfirm
cd ..
rm -rf yay

# AUR Packages
yay -S --noconfirm noto-fonts-emoji ttf-meslo-nerd-font-powerlevel10k webcord

# Spotify
# spotify spicetify-cli
# sudo chmod a+wr /opt/spotify
# sudo chmod a+wr /opt/spotify/Apps -R

# Bluetooth
sudo systemctl enable bluetooth.service

# Docker
sudo systemctl enable docker
sudo usermod -aG docker "$username"

# Bluetooth
sudo systemctl enable bluetooth.service

# Rust
rustup default stable
rustup toolchain install nightly
rustup +nightly component add rust-src rust-analyzer-preview
rustup component add rustfmt clippy

# Cargo
export cargo_dir="$HOME/.cargo"
export cargo_env="$cargo_dir/env"
export cargo_config="$cargo_dir/config.toml"
mkdir -p "$cargo_dir"

# Cargo Binaries
touch "$cargo_env"
tmp='#!/bin/sh
case ":${PATH}:" in
    *:"$HOME/.cargo/bin":*)
        ;;
    *)
        export PATH="$HOME/.cargo/bin:$PATH"
        ;;
esac'
echo "$tmp" > "$cargo_env"
source "$cargo_env"

# Optimize for Linux: musl/gnu?
touch "$cargo_config"
tmp="[target.x86_64-unknown-linux-gnu]
rustflags = [\"-C\", \"target-cpu=native\"]"
echo "$tmp" > "$cargo_config"

# Rust Binaries
cargo install cargo-watch lsd ripgrep sccache zoxide

# Convenient Scripts
sudo ln -sf "$config_dir/scripts/autopull.sh" "/usr/local/bin/autopull"
sudo ln -sf "$config_dir/scripts/vers.sh" "/usr/local/bin/vers"
chmod +x $config_dir/scripts/autopull.sh
chmod +x $config_dir/scripts/vers.sh

# Git
cd "$config_dir"
git submodule update --init --recursive
ln -sf "$config_dir/git/.gitconfig" "$HOME/.gitconfig"

# Zsh
cp "$config_dir/zsh/.zshrc_home" "$HOME/.zshenv"
chsh -s /bin/zsh

# Nitch
cd "$nitch_dir"
cp $nitch_config $nitch_dir/src/funcs/
nimble build
chmod +x nitch
sudo mv "$nitch_dir/nitch" "/usr/local/bin/nitch"

# Display

# NVidia
# yay -S nvidia

# Xorg/i3
# yay -S xorg-server xorg-xinit xsel i3-wm xorg-xrandr \
#     arandr polybar rofi

# AMD
yay -S libva-mesa-driver mesa xf86-video-amdgpu vulkan-radeon

# Wayland/Hyprland
yay -S fuzzel hyprland hyprpaper qt5-wayland qt6-wayland pipewire wireplumber \
    dunst waybar hyprshot

# Login Page - sddm
yay -S qt5-graphicaleffects qt5-quickcontrols2 qt5-svg sddm
sudo systemctl enable sddm

cd $config_dir
git remote set-url origin git@github.com:Bui-Christopher/dotfiles.git

reboot
