{ ... }:

{
    imports = [
        # Hardware Specific
        ./hardware-configuration.nix
        ../nvidia.nix

        ../../modules/home/default.nix
        ../../modules/system/default.nix
    ];

    networking.hostName = "toaster";
}
