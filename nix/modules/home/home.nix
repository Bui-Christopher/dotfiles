{ pkgs, inputs, ... }:

{
    imports = [
        inputs.home-manager.nixosModules.default
    ];

    home-manager = {
        backupFileExtension = "backup";
        useGlobalPkgs = true;
        useUserPackages = true;
        sharedModules = [ inputs.nixvim.homeManagerModules.nixvim ];
        extraSpecialArgs = {inherit inputs;};
        users.cookie = {
            home.username = "cookie";
            home.homeDirectory = "/home/cookie";
            home.stateVersion = "24.05";

            home.packages = with pkgs; [
                meslo-lgs-nf
                nerdfonts

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
            fonts.fontconfig.enable = true;
            programs.home-manager.enable = true;

            nix = {
                registry = {
                    templates = {
                        to = {
                            owner = "NixOS";
                            repo = "templates";
                            type = "github";
                        };
                    };
                };
                settings = {
                    experimental-features = [ "flakes" "nix-command" ];
                };
            };
            imports = [
                ./git.nix
                ./nixvim.nix
                ./zsh.nix
            ];
        };
    };
}
