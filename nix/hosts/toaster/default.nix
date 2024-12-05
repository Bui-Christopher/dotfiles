{ ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../common.nix

        # Customizations
        ../../modules/home/default.nix
        # ../../modules/gnome.nix
        ../../modules/hyprland.nix
        ../../modules/nvidia.nix
    ];

    networking.hostName = "toaster";
}
