{ config, pkgs, inputs, ... }:

{
    imports = [
        inputs.home-manager.nixosModules.default
    ];

    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        sharedModules = [ inputs.nixvim.homeManagerModules.nixvim ];
        extraSpecialArgs = {inherit inputs;};
        users.cookie = {
            home.username = "cookie";
            home.homeDirectory = "/home/cookie";
            home.stateVersion = "24.05";

            home.packages = with pkgs; [
                bash
                # Browsers
                firefox
                chromium

                # Files
                xz
                zip
                unzip

                # Utils
                fd
                fzf
                ripgrep
                jq
                yq-go
                zoxide

                # Misc
                btop
                file
                cowsay
                which
                tree
                gnupg
                zsh
                wezterm

                spotify
            ];
            programs.home-manager.enable = true;

            imports = [
                ./git.nix
                ./nixvim.nix
                ./zsh.nix
            ];
        };
    };
}
