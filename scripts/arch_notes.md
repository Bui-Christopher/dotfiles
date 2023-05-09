# Arch Install

## TODOS
- Add gui
    - i3/sway/xorg/wayland/hyperland
- Docker
    - Use without sudo
            - usermod -a
            - gpasswd
- `pacman -S pipewire pulseaudio`
- AUR
    - nerd font (Meslo)
    - spotify/spicetify

## Internet
`iwctl`

`device list`

`station wlan0 scan`

`station wlan0 get-networks`

`station wlan0 connect SSIDu

## Partition Disks
`fdisk -l`

`fdisk /dev/nvme0n1`

Create a boot drive
- `mkfs.fat -F 32 /dev/nvme0n1p1`
- +512M 
- EFI System

Create a mount drive
- `mkfs.ext4 /dev/nvme0n1p2`
- Linux filesystem

## Mount Drives
`mount /dev/nvme0n1p2 /mnt`

`mount --mkdir /dev/nvme0n1p1 /mnt/boot`

## Install Linux and Packages

### Linux
`pacstrap -K /mnt base linux linux-firmware`

`genfstab -U /mnt >> /mnt/etc/fstab`

### Necessary Packages 
`arch-chroot /mnt`

`pacman -S networkmanager git kitty neovim sudo grub efibootmgr`

`git clone https://github.com/Bui-Christopher/dotfiles.git`

### Preferences

#### Timezone/Clock
`ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime`

`hwclock --systohc`

#### Localization
Edit: `/etc/locale.gen`

Uncomment: `en_US.UTF-8`

Run: `locale-gen`

Create: `/etc/locale.conf`
- Add `LANG=en_US.UTF-8`

#### Hostname
Create: `/etc/hostname`

Write: `oven`

#### Password
Run: `passwd`

#### Add User
`useradd -m cookie`

`passwd cookie`

`usermod -aG wheel cookie`

##### SUDO Permissions
`export EDITOR=nvim`

`visudo`

`cookie ALL=(ALL) ALL`

## Bootloader
[Grub Wiki](https://wiki.archlinux.org/title/GRUB)

`pacman -S grub efibootmgr`

`grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB`

Within: `/etc/default/grub`

Modify: `GRUB_DISABLE_OS_PROBER=false`

Run: `grub-mkconfig -o /boot/grub/grub.cfg`

## Network Manager
systemctl enable NetworkManager.service
systemctl start NetworkManager.service
nmcli device wifi list
nmcli device wifi connect SSID password PASSWORD

### Random notes
`pkill polybar`
