{ ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../common.nix
        ../../modules/gnome.nix
        ../../modules/home/default.nix
        # ../../modules/hyprland.nix
        ../../modules/nvidia.nix
        # ../../modules/fenix.nix
    ];

    # TODO: Read from system or param
    networking.hostName = "toaster";
}
