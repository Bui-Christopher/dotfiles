<h1 align="center">
    Dotfiles
 </h1>

<p align="center">
    Some basic configurations and setup scripts.
</p>
<p align="center">
<img alt="Github last commit (branch)" src="https://img.shields.io/github/last-commit/Bui-Christopher/dotfiles/main?color=2ea043&labelColor=202328&label=Last Update%3F&style=for-the-badge">
</p>

## :gear: Programs

| Program                                | Name                                                                                            |
| -------------------------------------- | ----------------------------------------------------------------------------------------------- |
| :penguin: **OS**                       | [ArchLinux](https://wiki.archlinux.org/)                                                        |

<!-- Operating System -->
<!-- Window Manager -->
<!-- Compositor -->
<!-- Bar -->
<!-- Notifications -->
<!-- Application Launcher -->
<!-- Shell -->
<!-- Terminal Emulator -->
<!-- Music -->
<!-- Editor -->
<!-- Fonts -->
<!-- Icons -->
<!-- Spotify/cava1 -->
<!-- System Monitor -->
<!-- Swaync -->
<!-- sddm -->

## Todo
- [ ] README.md
    - [ ] Programs List
    - [ ] GitHub Badges
- [ ] Themes
    - [ ] Colors
    - [ ] Fonts
- [ ] Arch
    - [ ] Install Notes
        - [ ] Rename to cheatsheet
        - [ ] Remove explicit names
            - [ ] drives (`nvme`)
            - [ ] hostname/user (`oven`/`cookie`)
            - [ ] Timezone (`America/Los_Angeles`)
            - [ ] `export EDITOR=nvim`
            - [ ] Is wheel necessary?
            - [ ] Mounting of Additional Drives/Internal Mounts
        - [ ] Add note that it implies grub
        - [ ] Labels when partitioning disks
    - [ ] Install Script
        - [ ] Add initial sudo check:
          ```bash
          if [[ $EUID -eq 0 ]]; then
              echo "This script should not be executed as root! Exiting......."
              exit 1
          fi
          ```
        - [ ] Clean up comments
        - [ ] Redo File Structure
          ```bash
          # ├── dotfiles
          # │   ├── .config
          # │   ├── scripts
          # │   └── README.md
          ```
        - [ ] Have it re-runnable
        - [ ] Remove hardcoded variables
            - [ ] username
            - [ ] script paths
        - [ ] lsd, kitty, i3, screenlayout
        - [ ] Packages
            - [ ] `noto-fonts-emoji`
            - [ ] `ttf-meslo-nerd-font-powerlevel10k`
            - [ ] `webcord`
            - [ ] `spotify`/`spicetify`
            - [ ] glow (Mark Down Reader)
        - [ ] Split Script
            - [ ] Packages
            - [ ] Rust/Cargo/Cargo Binaries
            - [ ] Desktop Environment - (Xorg/i3)/(wayland/hyprland)
        - [ ] Laptop
            - [ ] Displaylink
                - [ ] evdi-git
                - [ ] displaylink
- [ ] NixOS
- [ ] Packages
    - [ ] Bluetooth
        - [ ] [Settings](https://wiki.archlinux.org/title/bluetooth#Default_adapter_power_state)
            - [ ] AutoEnable
            - [ ] Discoverable on Startup
            - [ ] FastConnectable
    - [ ] i3
        - [ ] `nm-applet`: [Possible Fix](https://github.com/polybar/polybar/issues/1355)
        - [ ] Sync with Hyprland
    - [ ] Rust
        - [ ] [Sccache](https://wiki.archlinux.org/title/rust#sccache)
    - [ ] SDDM
        - [ ] Theme: [Chamber of Secrets](https://github.com/Carmoruda/sddm-hogwarts-themes)
        - [ ] [Dual Monitor](https://blog.victormendonca.com/2018/06/29/how-to-fix-sddm-on-multiple-screens/)
    - [ ] Spotify
        - [ ] [Spictify](https://github.com/spicetify/spicetify-cli)
    - [ ] Wezterm
        - [ ] [Custom Config](https://wezfurlong.org/wezterm/config/files.html)
    - [ ] zsh
        - [ ] Add pacman alias [Pacman Tricks](https://wiki.archlinux.org/title/Pacman/Tips_and_tricks)
