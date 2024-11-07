{ pkgs, ... }:

{
    programs.zsh = {
        initExtra = ''
            source ~/.p10k.zsh
            source $HOME/.config/zsh/.zshrc
            export GPG_TTY=$TTY
        '';
        enable = true;
        shellAliases = {
            ## NixOS Specific
            nixbuild = "sudo nixos-rebuild build";
            nixswitch = "sudo nixos-rebuild switch";
            nixgc = "sudo nix-collect-garbage -d";
            };

        plugins = [
            {
            name = "zsh-autosuggestions";
            src = pkgs.fetchFromGitHub {
                owner = "zsh-users";
                repo = "zsh-autosuggestions";
                rev = "v0.7.0";
                sha256 = "1g3pij5qn2j7v7jjac2a63lxd97mcsgw6xq6k5p7835q9fjiid98";
                };
            }
            {
            name = "zsh-syntax-highlighting";
            src = pkgs.fetchFromGitHub {
                owner = "zsh-users";
                repo = "zsh-syntax-highlighting";
                rev = "0.8.0";
                # Hash and sha256 both work here
                hash = "sha256-iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
                };
            }
            {
                name = "powerlevel10k";
                src = pkgs.zsh-powerlevel10k;
                file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
            }
        ];
    };
}
