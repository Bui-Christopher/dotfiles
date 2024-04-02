# Arch Install
This is an example of a step-by-step process of installing Arch Linux.

## Arch Install Notes
### Internet
- `iwctl`

- `device list`

- `station wlan0 scan`

- `station wlan0 get-networks`

- `station wlan0 connect SSID`

### Partition Disks
- `fdisk -l`

Select Disk to Partition
- `fdisk /dev/nvme0n1`
    - `n`: Create new partition
    - `t`: Change partition type
    - `d`: Delete a partition

Create a boot drive
- `mkfs.fat -F 32 /dev/nvme0n1p1`
- +512M 
- EFI System
- fatlabel /dev/nvme0n1p1 BOOT

Create a mount drive
- `mkfs.ext4 /dev/nvme0n1p2 -L ARCH`
- Linux filesystem

### Mount Drives
- `mount /dev/nvme0n1p2 /mnt`

- `mount --mkdir /dev/nvme0n1p1 /mnt/boot`

### Install Linux and Packages

#### Linux
- `pacstrap -K /mnt base linux linux-firmware`

- `genfstab -U /mnt >> /mnt/etc/fstab`

#### Packages 
- `arch-chroot /mnt`

- `pacman -S --noconfirm base-devel efibootmgr git grub neovim networkmanager sudo`

### Preferences

##### Timezone/Clock
- `ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime`

- `hwclock --systohc`

#### Localization
- Modify:
    - `/etc/locale.gen`
    - `en_US.UTF-8`
- Run:
    - `locale-gen`

- Create:
    - `/etc/locale.conf`
    - `LANG=en_US.UTF-8`

#### Hostname
- Create
    - `/etc/hostname`
    - `oven`

#### Password
- `passwd`

#### Add User
- `useradd -m cookie`

- `passwd cookie`

##### SUDO Permissions
- `export EDITOR=nvim`

- `visudo`

- `cookie ALL=(ALL) ALL`

### Bootloader
- `grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB`

#### Multiple OS
- Modify:
    - `/etc/default/grub`
    - `GRUB_DISABLE_OS_PROBER=false`

- Run:
    - `grub-mkconfig -o /boot/grub/grub.cfg`

### Network Manager
- `systemctl enable NetworkManager.service`

### Mount Additional Drives
    blkid | grep sda1 >> /etc/fstab
    UUID=<UUID> /mnt/archive ext4 defaults 0 0

### Final Setup
- `exit`

- `reboot`

#### Internet
- `nmcli device wifi list`

- `nmcli device wifi connect SSID password PASSWORD`

#### Arch Setup Script
- `git clone https://github.com/Bui-Christopher/dotfiles.git`

- `./dotfiles/scripts/arch_setup.sh`

#### Additional Internal Mounts
- `ln -s /home/cookie/.config /mnt/archive/personal/dotfiles`
