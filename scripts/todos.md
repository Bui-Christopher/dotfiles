## TODO's/Other Note
- Bluetooth 
    - systemctl enable bluetooth.service
    - systemctl start bluetooth.service
    - Edit: `/etc/bluetooth/main.conf`
        ```
        [Policy]
        AutoEnable=true

        # Also this one
        FastConnectable = true
        ```
- Steam
    - Without flatpak, there are bugs. Use this to fix CSGO:
    - ```
      yay -S gperftools
      cd <path/to>/steamapps/common/Counter-Strike\ Global\ Offensive/bin/linux64
      mv libtcmalloc_minimal.so.0 libtcmalloc_minimal.so.0.orig
      cp /usr/lib/libtcmalloc_minimal_debug.so.4.5.9 libtcmalloc_minimal.so.0
      ```
- Pacman Tricks
    - https://wiki.archlinux.org/title/Pacman/Tips_and_tricks
    - https://wiki.archlinux.org/title/Pacman#Cleaning_the_package_cache

- Internal Drive
    - Auto mount script
    -
    ```
    sudo blkid
    sudo nvim /etc/fstab
    UUID=<UUID> /mnt/archive ext4 defaults 0 0
    ```

- Rust
    - bin $PATH
    - sccache
- sddm
    - Theme setup script
    - ScreenLayout 'xrandr'
    - Hyprland
        - https://bbs.archlinux.org/viewtopic.php?id=289612
        - /var/lib/sddm/.config/hypr/
        - /etc/sddm.conf.d/10-wayland.conf
- gpg
- ssh
- wezterm config
