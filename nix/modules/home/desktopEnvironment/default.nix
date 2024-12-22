{ pkgs, ... }:

{
    imports = [
        ./hyprland.nix
        ./hyprlock.nix
        ./hyprpaper.nix
    ];

    home.packages = with pkgs; [
        # Launcher
        rofi-wayland

        # Taskbar
        waybar

        # GUI Configuration
        blueberry
        networkmanagerapplet
        pavucontrol

        # Misc
        brightnessctl
        wl-clipboard
    ];

    programs.waybar = {
        enable = true;
    };
}
