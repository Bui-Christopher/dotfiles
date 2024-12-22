{ ... }:

{
    imports = [
        ./common.nix
        ./hyprland.nix # Declare hyprland before customizing within home-manager
    ];
}
