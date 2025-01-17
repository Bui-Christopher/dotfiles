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

| Program                                           | Name                                                                                            |
| ------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| :penguin: **OS**                                  | [Arch](https://wiki.archlinux.org/) & [Nix](https://nixos.org/)                                 |
| :art: **Compositor**                              | [Hyprland](https://github.com/hyprwm/Hyprland)                                                  |
| :bar_chart: **Bar**                               | [Waybar](https://github.com/Alexays/Waybar)                                                     |
| :bell: **Notifications**                          | [Dunst](https://github.com/dunst-project/dunst)                                                 |
| :mag: **Application Launcher**                    | [Rofi](https://github.com/davatorium/rofi)                                                      |
| :shell: **Shell**                                 | [Zsh](https://www.zsh.org/)                                                                     |
| :black_medium_square: **Terminal Emulator**       | [WezTerm](https://wezfurlong.org/wezterm/)                                                      |
| :musical_note: **Music Player**                   | [Spotify](https://www.spotify.com)                                                              |
| :pencil2: **Editor**                              | [Neovim](https://neovim.io/)                                                                    |
| :electric_plug: **sddm**                          | [sddm](https://github.com/sddm/sddm)                                                            |

## TODO
- [ ] Arch
    - [ ] Compare notes to [archinstall](https://github.com/archlinux/archinstall)
    - [ ] Install Script
        - [ ] Remove lines with SUDO
        - [ ] Spotify/Spicetify
        - [ ] Have it failable (re-runnable)
        - [ ] Use `$USER`
- [ ] NixOS
    - [ ] Applications
        - [ ] LibreOffice
        - [ ] VLC
        - [ ] Discord
        - [ ] Waybar
            - [ ] Audio Icons (pulseaudio)
            - [ ] GruvBox Colors
            - [ ] Bluetooth battery life
- [ ] Packages
    - [ ] Bluetooth
        - [ ] [Settings](https://wiki.archlinux.org/title/bluetooth#Default_adapter_power_state)
            - [ ] AutoEnable
            - [ ] Discoverable on Startup
            - [ ] FastConnectable
            - [ ] Disable Headset (fast A2DP)
              ```bash
              [General]
              Disable=Headset
              ```
            - [ ] Keychron battery life
              ```bash
              upower --dump | grep keyboard -A 7
              ```
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
