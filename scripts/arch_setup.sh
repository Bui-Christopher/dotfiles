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
sudo pacman -S --noconfirm blueberry chromium clang cmake curl docker \
    docker-compose fakeroot feh gcc gzip htop iproute2 kitty make nim \
    openssl pavucontrol pkg-config python rustup tmux unzip vlc wget zip zsh

## AUR
git clone https://aur.archlinux.org/yay.git
chown -R "$username:$username" "yay"
cd yay
sudo -u "$username" makepkg -sri --noconfirm
cd ..
rm -rf yay
yay -S --noconfirm noto-fonts-emoji ttf-meslo-nerd-font-powerlevel10k webcord
# spotify spicetify-cli 
# sudo chmod a+wr /opt/spotify
# sudo chmod a+wr /opt/spotify/Apps -R

## Docker
sudo systemctl enable docker
sudo usermod -aG docker "$username"

# Set up configs
cd "$config"
git submodule update --init --recursive
ln -sf "$config/git/.gitconfig" "$home/.gitconfig"
cp "$config/zsh/.zshrc_home" "$home/.zshrc"
chsh -s /bin/zsh

# Configure Rust
source $HOME/.cargo/env
rustup default stable
rustup toolchain install nightly
rustup +nightly component add rust-src rust-analyzer-preview
rustup component add rustfmt clippy
# Optimize to current building platform
config="[target.x86_64-unknown-linux-gnu]
rustflags = [\"-C\", \"target-cpu=native\"]"

# Check if the config file exists
if [ -f ~/.cargo/config ]; then
    # Append the configuration to the file
    echo "$config" >> ~/.cargo/config
    echo "Configuration appended to ~/.cargo/config"
else
    # Create the config file and append the configuration
    echo "$config" > ~/.cargo/config
    echo "Created ~/.cargo/config and appended configuration"
fi
## Install Rust Binaries
cargo install cargo-watch lsd ripgrep sccache zoxide

# User Binaries
ln -sf "$config/scripts/autopull.sh" "/usr/local/bin/autopull"
ln -sf "$config/scripts/versions.sh" "/usr/local/bin/vers"

## Nitch
cd "$nitch_dir"
cp $nitch_config $nitch_dir/src/funcs/
nimble build
chmod +x nitch
sudo mv "$nitch_dir/nitch" "/usr/local/bin/nitch"


# Xorg/i3
# sudo pacman -S --noconfirm xorg-server xorg-xinit xsel i3-wm dmenu xorg-xrandr \
#     arandr polybar lightdm lightdm-gtk-greeter
# sudo systemctl enable lightdm

# Wayland/Hyprland 
sudo yay -S libva-mesa-driver mesa xf86-video-amdgpu vulkan-radeon fuzzel \
    hyprland-git hyprpaper qt5-wayland qt6-wayland pipewire wireplumber polkit-kde-agent \
    dunst waybar-hyprland hyprshot sddm


# TODO Have bluetooth.service start prior to Display Manager
# sudo systemctl enable bluetooth.service

cd $config
git remote set-url origin git@github.com:Bui-Christopher/dotfiles.git 

reboot
