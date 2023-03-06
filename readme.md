# Arch Install

## TODOS
- Add packages
- Add git config
- Add gui
    - i3/sway/xorg/wayland/hyperland
- Update Spotify
- User
    - Cookie
    - Sudo
- Rust

## Internet
`iwctl`

`device list`

`station wlan0 scan`

`station wlan0 get-networks`

`station --passphrase passphrase connect SSID`

## Partition Disks
`fdisk -l`

`fdisk /dev/nvme0n1`

Make a mount drive
- Linux filesystem

Make a boot drive
- +512M 
- EFI System

`mkfs.ext4 /dev/nvme0n1p1`

`mkfs.fat -F 32 /dev/nvme0n1p2`

### Mount Drives
`mount /dev/nvme0n1p1 /mnt`

`mount --mkdir /dev/nvme0n1p2 /mnt/boot`

### Install Linux/Necessary Packages
`pacstrap -K /mnt base linux linux-firmware`

`genfstab -U /mnt >> /mnt/etc/fstab`

`pacman -S networkmanager kitty neovim`

## Personalize
`arch-chroot /mnt`

### Timezone/Clock
`ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime`

`hwclock --systohc`

Within: `/etc/locale.conf`

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

`mount /mnt/boot`

`grub-install --target=x86_64-efi --efi-directory=/mnt/boot --bootloader-id=GRUB`

Within: `/etc/default/grub`

Modify: `GRUB_DISABLE_OS_PROBER=false`

Run: `grub-mkconfig -o /boot/grub/grub.cfg`

### Packages
`pacman -S blueberry clang cmake discord dmenu gcc git gzip unzip iproute2 polybar vlc feh sudo`

`pacman -S pipewire pulseaudio`

## Spotify

`makepkg`

`pacman -U $PACKAGE_FILE`

`sudo chmod a+wr /opt/spotify`

`sudo chmod a+wr /opt/spotify/Apps -R`
