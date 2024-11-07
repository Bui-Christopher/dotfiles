{ ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../common/default.nix
        ../../modules/home/home.nix
        ../../modules/fenix.nix
    ];

    # TODO: Read from system or param
    networking.hostName = "toaster";
}
