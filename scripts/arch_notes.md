# Arch Install

## TODOS
- Add packages
- Fix git config
- Add gui
    - i3/sway/xorg/wayland/hyperland
- Install Rust
- Add nitch code to setup.sh
- Docker
    - Use without sudo
            - usermod -a
            - gpasswd
## Internet
`iwctl`

`device list`

`station wlan0 scan`

`station wlan0 get-networks`

`station --passphrase passphrase connect SSID`

## Partition Disks
`fdisk -l`

`fdisk /dev/nvme0n1`

Make a boot drive
- +512M 
- EFI System

Make a mount drive
- Linux filesystem

`mkfs.fat -F 32 /dev/nvme0n1p1`

`mkfs.ext4 /dev/nvme0n1p2`


### Mount Drives
`mount /dev/nvme0n1p2 /mnt`

`mount --mkdir /dev/nvme0n1p1 /mnt/boot`

### Install Linux/Necessary Packages
`pacstrap -K /mnt base linux linux-firmware networkmanager kitty neovim`

`genfstab -U /mnt >> /mnt/etc/fstab`

## Personalize
`arch-chroot /mnt`

### Timezone/Clock
`ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime`

`hwclock --systohc`

Within: `nvim /etc/locale.conf`

Modify: `LANG=en_US.UTF-8`

Run: `locale-gen`

### Hostname
Create: `/etc/hostname`

Write: `oven`

### Password
Run: `passwd`

## Bootloader
`https://wiki.archlinux.org/title/GRUB`

`pacman -S grub efibootmgr`

`grub-install --target=x86_64-efi --efi-directory=/mnt/boot --bootloader-id=GRUB`

Within: `/etc/default/grub`

Modify: `GRUB_DISABLE_OS_PROBER=false`

Run: `grub-mkconfig -o /boot/grub/grub.cfg`

### Packages
`pacman -S blueberry chromium clang cmake discord dmenu feh gcc git gzip iproute2 nim polybar sunzip sudo vlc xsel zsh`

`pacman -S pipewire pulseaudio`

`systemctl enable NetworkManager.service`
`systemctl start NetworkManager.service`

`systemctl enable bluetooth.service`
`systemctl start bluetooth.service`

### Add User
`useradd -m cookie`
`passwd cookie`
`usermod -aG wheel cookie`

`visudo`
`cookie ALL=(ALL) ALL`


### Random notes
`pkill polybar`
