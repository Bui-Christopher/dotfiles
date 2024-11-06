{ config, pkgs, inputs, ... }:

{
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
}
