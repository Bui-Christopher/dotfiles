{ ... }:

{
    imports = [
        # Hardware Specific
        ./hardware-configuration.nix

        ../../modules/home/default.nix
        ../../modules/common.nix
        ../../modules/nvidia.nix
    ];

    networking.hostName = "toaster";
}
