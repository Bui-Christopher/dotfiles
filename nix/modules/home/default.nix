{ pkgs, inputs, ... }:

{
    imports = [ inputs.home-manager.nixosModules.default ];

    home-manager = {
        backupFileExtension = "backup";
        useGlobalPkgs = true;
        useUserPackages = true;
        sharedModules = [
            inputs.nixvim.homeManagerModules.nixvim
        ];
        extraSpecialArgs = {inherit inputs;};
        users.cookie = {
            home.username = "cookie";
            home.homeDirectory = "/home/cookie";
            home.stateVersion = "24.05";

            home.packages = with pkgs; [
                # Applications
                firefox
                chromium
                spotify

                # Fonts
                meslo-lgs-nf
                nerd-fonts.jetbrains-mono
                nerd-fonts.meslo-lg
                nerd-fonts.symbols-only

                # Productivity
                fd
                fzf
                ripgrep

                jq
                yq-go

                zoxide
                lsd
                tree

                # Misc
                cowsay

            ];
            fonts.fontconfig.enable = true;
            programs.home-manager.enable = true;
            programs.wezterm = {
                enable = true;
                package = inputs.wezterm.packages.${pkgs.system}.default;
            };

            nix = {
                # registry = {
                #     templates = {
                #         to = {
                #             owner = "NixOS";
                #             repo = "templates";
                #             type = "github";
                #         };
                #     };
                # };
                settings = {
                    experimental-features = [ "flakes" "nix-command" ];
                };
            };
            imports = [
                ./git.nix
                ./hyprland.nix
                ./nixvim.nix
                ./zsh.nix
            ];
        };
    };
}
