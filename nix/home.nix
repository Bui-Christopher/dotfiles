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
        # users.cookie = import ./home.nix.bak;
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
            programs.git = {
                enable = true;
                aliases = {
                    alias = "!git config -l | grep alias | cut -d = -f1 | cut -d. -f2";
                    amend = "commit --amend -S --no-edit";
                    last = "log -1 HEAD";
                    ol = "log --oneline -10";
                };
                extraConfig = {
                    user = {
                        name = "Chris Bui";
                        email = "christopherphongbui@gmail.com";
                        signingkey = "A5C2053635EB8AE9";
                    };
                    color.ui = "auto";
                    commit.gpgsign = true;
                    core = {
                        editor = "nvim";
                        pager = "less";
                    };
                    init.defaultBranch = "main";
                    pager.diff = true;
                };
            };

            imports = [
                ./nixvim.nix
                ./zsh.nix
            ];
        };
    };
}
