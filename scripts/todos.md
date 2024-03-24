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

- Mount other internal drive (no boot)
- Sccache script
