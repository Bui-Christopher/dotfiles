{ inputs, pkgs, ... }:

{
    home.packages = with pkgs; [
        hyprpaper
    ];

    services.hyprpaper = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        settings = {
            ipc = "off";
            splash = false;

            preload = [
                "~/.config/backgrounds/yellow-moon.png"
            ];
            wallpaper = [
                "eDP-1,~/.config/backgrounds/yellow-moon.png"
            ];
        };
    };
}
