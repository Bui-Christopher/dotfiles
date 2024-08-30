{ config, pkgs, inputs, ... }:

{
    imports = [
        inputs.nixvim.homeManagerModules.nixvim
    ];

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
        fzf
        ripgrep
        jq
        yq-go

        # Misc
        btop
        file
        cowsay
        which
        tree
        gnupg
        zsh
        wezterm
    ];

    programs.git.enable = true;

    programs.nixvim = {
        enable = true;
        colorschemes.gruvbox.enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        globals = {
            mapleader = " ";
            maplocalleader = " ";
        };
        plugins = {
            bufferline = {
                enable = true;
                settings.options = {
                    always_show_bufferline = false;
                    show_buffer_close_icons = false;
                    diagnostics = "nvim_lsp";
                    indicator.style = "icon";
                    offsets = [
                        {
                            filetype = "NvimTree";
                            highlight = "Directory";
                            text = "File Explorer";
                            text_align = "center";
                            separator = true;
                        }
                    ];
                };     
            };
            comment.enable = true;
            # TODO: Crates
            # TODO: Diffview
            indent-blankline = {
                enable = true;
                settings = {
                    exclude = {
                        buftypes = [
                            "terminal"
                            "quickfix"
                        ];
                        filetypes = [
                            # Leaving because of legacy
                            "alpha"
                            "dashboard"
                            "neo-tree"
                            "Trouble"
                            "lazy"
                            "mason"
                            "notify"
                            "toggleterm"
                            "lazyterm"
                            ""
                            "checkhealth"
                            "help"
                            "lspinfo"
                            "packer"
                            "TelescopePrompt"
                            "TelescopeResults"
                            "yaml"
                        ];
                    };
                    indent = {
                        char = "│";
                    };
                    scope = {
                        show_end = false;
                        show_exact_scope = true;
                        show_start = false;
                    };
                };
            };
            nvim-autopairs.enable = true;
            #nvim-bufdel.enable = true;
        };

        opts = {
            clipboard = "unnamedplus";  # allows neovim to access the system clipboard
            conceallevel = 0;           # so that `` is visible in markdown files
            fileencoding = "utf-8";     # the encoding written to a file
            timeoutlen = 1000;          # time to wait for a mapped sequence to complete (in milliseconds)
            undofile = true;            # enable persistent undo
            updatetime = 300;           # faster completion (4000ms default)

            # Mouse
            mouse = "a";

            # Searching
            hlsearch = true;            # Highlight all matches on previous search pattern
            ignorecase = true;          # Ignore cases in search
            showmatch = true;           # Show matching braces [{()}]
            incsearch = true;           # Incremental Search

            # Display
            splitbelow = true;          # force all horizontal splits to go below current window
            splitright = true;          # force all vertical splits to go to the right of current window
            swapfile = false;           # creates a swapfile
            pumheight = 10;             # pop up menu height
            showmode = false;           # we don't need to see things like -- INSERT -- anymore
            termguicolors = true;       # set term gui colors (most terminals support this)
            cmdheight = 2;              # more space in the neovim command line for displaying messages

            # Indenting
            autoindent = true;          # Use identation of the previous line
            expandtab = true;           # convert tabs to spaces
            shiftwidth = 4;             # the number of spaces inserted for each indentation
            tabstop = 4;                # insert 2 spaces for a tab
            softtabstop = 4;
            smartindent = true;         # make indenting smarter again
            # TODO: Check
            # showtabline = 2;            # always show tabs

            # Number
            number = true;              # set numbered lines
            relativenumber = false;     # set relative numbered lines
            numberwidth = 2;            # set number column width to 2 {default 4}
            signcolumn = "yes";         # always show the sign column, otherwise it would shift the text each time

            wrap = false;               # display lines as one long line
            scrolloff = 8;              # decide when to vertically scroll
            sidescrolloff = 8;          # decide when to horizontally scroll

            # TODO: Check
            # Auto Completion
            # completeopt = { "menuone" "noselect" };
            # shortmess:append "c";
        };
    };

    programs.zsh = {
        initExtra = ''
            source ~/.p10k.zsh
            export GPG_TTY=$TTY
        '';
        enable = true;
        shellAliases = {
            ## NixOS
            nixswitch = "sudo nixos-rebuild switch";
            nixgc = "sudo nix-collect-garbage -d";

            cpr = "cp -R";	# Copy recursively, including hidden files
            rmr = "rm -rf";	# Delete recursively, including hidden files

            shutdown = "shutdown now";
            off = "systemctl poweroff";
            sleep = "systemctl suspend";
            bake = "systemctl suspend";

            # dsr = 'if [ "$(docker ps -aq)" ]; then docker stop $(docker ps -aq) && docker rm $(docker ps -aq) && docker volume rm $(docker volume ls -q); else echo "No running containers to stop."; fi'
            };

        history = {
            size = 10000;
            path = "$HOME/.zsh_history";
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


    programs.home-manager.enable = true;
}
