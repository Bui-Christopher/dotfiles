{ config, pkgs, inputs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../common/default.nix
        ../../home.nix
    ];

    # TODO: Read from system or param
    networking.hostName = "toaster";
}
