{ pkgs, inputs, ... }:

{
    imports = [ inputs.home-manager.nixosModules.default ];

    home-manager = {
        backupFileExtension = "backup";
        extraSpecialArgs = {inherit inputs;};
        useGlobalPkgs = true;
        useUserPackages = true;
        sharedModules = [
            inputs.nixvim.homeManagerModules.nixvim
        ];
        users.cookie = {
            home.username = "cookie";
            home.homeDirectory = "/home/cookie";
            home.stateVersion = "24.05";

            home.packages = with pkgs; [
                # Applications
                cozy
                qbittorrent
                spotify
                vesktop

                # Fonts
                meslo-lgs-nf
                nerd-fonts.jetbrains-mono
                nerd-fonts.meslo-lg
                nerd-fonts.symbols-only

                # Productivity
                ## Files
                fd
                fzf
                ripgrep

                ## Processors
                jq
                yq-go

                ## Directory Flow
                lsd
                tree
                zoxide

                # Misc
                cowsay
            ];
            fonts.fontconfig.enable = true;
            programs.home-manager.enable = true;
            programs.wezterm = {
                # TODO: Settings
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
                ./desktopEnvironment/default.nix
                ./firefox.nix
                ./git.nix
                ./nixvim.nix
                ./zsh.nix
            ];
        };
    };
}
