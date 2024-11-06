{ config, pkgs, inputs, ... }:

{
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
        autoCmd = [
            # Check if the file needs to be reloaded
            {
                event = [
                    "FocusGained"
                    "TermClose"
                    "TermLeave"
                ];
                command = "checktime";
            }
            # Highlight on yank
            {
                event = "TextYankPost";
                pattern = [ "*" ];
                command = "silent! lua vim.highlight.on_yank()";
            }
            # Resize splits if windows get resized
            {
                event = "VimResized";
                callback.__raw = ''
                    function(event)
                        local current_tab = vim.fn.tabpagenr()
                        vim.cmd("tabdo wincmd =")
                        vim.cmd("tabnext " .. current_tab)
                    end
                '';
            }
            # Set txt as Markdown
            {
                event = [ "BufEnter" ];
                pattern = [ "*.txt" ];
                command = "set filetype=markdown";
            }
            # Set txt as Markdown
            {
                event = [ "FileType" ];
                pattern = [
                    "text"
                    "plaintex"
                    "typst"
                    "gitcommit"
                    "markdown"
                ];
                callback.__raw = ''
                    function()
                        vim.opt_local.wrap = true
                        vim.opt_local.spell = true
                    end
                '';
            }
            # Close some filetypes with <q>
            {
                event = "FileType";
                pattern = [
                    "PlenaryTestPopup"
                    "help"
                    "lspinfo"
                    "man"
                    "notify"
                    "qf"
                    "query"
                    "spectre_panel"
                    "startuptime"
                    "tsplayground"
                    "neotest-output"
                    "checkhealth"
                    "neotest-summary"
                    "neotest-output-panel"
                ];
                callback.__raw = ''
                    function(event)
                        vim.bo[event.buf].buflisted = false
                        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
                    end
                '';
            }
            # Go to the last line/column when opening a buffer
            {
                event = "BufReadPost";
                callback.__raw = ''
                    function(event)
                        local exclude = { "gitcommit" }
                            local buf = event.buf
                            if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
                                return
                            end
                            local mark = vim.api.nvim_buf_get_mark(buf, '"')
                            local lcount = vim.api.nvim_buf_line_count(buf)
                            if mark[1] > 0 and mark[1] <= lcount then
                                pcall(vim.api.nvim_win_set_cursor, 0, mark)
                            end
                    end
                '';
            }
            # Format on save
            {
                event = "BufWritePre";
                pattern = [ "*.rs" "*.cpp" "*.lua" ];
                callback.__raw = ''
                    function()
                        vim.lsp.buf.format({ timeout_ms = 200 })
                    end
                '';
            }
            {
                event = [ "LspAttach" ];
                pattern = [ "*.txt" ];
                callback.__raw = ''
                    function(args)
                        vim.keymap.set("n", "<space>f", function()
                            vim.lsp.buf.format { async = true }
                        end, args.buf)
                    end
                '';
            }

        ];
        keymaps = [
            # Better Window Navigation
            {
                mode = [ "n" ];
                key = "<C-h>";
                action = "<C-w>h";
                options = {
                    desc = "Go to Left Window";
                    noremap = true;
                    silent = true;
                };
            }
            {
                mode = [ "n" ];
                key = "<C-j>";
                action = "<C-w>j";
                options = {
                    desc = "Go to Bottom Window";
                    noremap = true;
                    silent = true;

                };
            }
            {
                mode = [ "n" ];
                key = "<C-k>";
                action = "<C-w>k";
                options = {
                    desc = "Go to Top Window";
                    noremap = true;
                    silent = true;
                };
            }
            {
                mode = [ "n" ];
                key = "<C-l>";
                action = "<C-w>l";
                options = {
                    desc = "Go to Right Window";
                    noremap = true;
                    silent = true;
                };
            }

            {
                mode = [ "n" ];
                key = "<leader><BS>";
                action = ":noh<return><esc>";
                options = {
                    desc = "Clear Search";
                    noremap = true;
                    silent = true;
                };
            }

            # Resize with Arrows
            {
                mode = [ "n" ];
                key = "<C-Up>";
                action = ":resize +2<CR>";
                options = {
                    desc = "Clear Search";
                    noremap = true;
                    silent = true;
                };
            }
            {
                mode = [ "n" ];
                key = "<C-Down>";
                action = ":resize -2<CR>";
                options = {
                    desc = "Clear Search";
                    noremap = true;
                    silent = true;
                };
            }
            {
                mode = [ "n" ];
                key = "<C-Left>";
                action = ":vertical resize -2<CR>";
                options = {
                    desc = "Clear Search";
                    noremap = true;
                    silent = true;
                };
            }
            {
                mode = [ "n" ];
                key = "<C-Right>";
                action = ":vertical resize +2<CR>";
                options = {
                    desc = "Clear Search";
                    noremap = true;
                    silent = true;
                };
            }

            # Navigate Buffers
            {
                mode = [ "n" ];
                key = "<S-l>";
                action = ":bnext<CR>";
                options = {
                    desc = "Clear Search";
                    noremap = true;
                    silent = true;
                };
            }
            {
                mode = [ "n" ];
                key = "<S-h>";
                action = ":bprevious<CR>";
                options = {
                    desc = "Clear Search";
                    noremap = true;
                    silent = true;
                };
            }

            # Open Nvim-Tree File Explorer
            {
                mode = [ "n" ];
                key = "<leader>e";
                action = ":NvimTreeToggle<cr>";
                options = {
                    desc = "Clear Search";
                    noremap = true;
                    silent = true;
                };
            }

            # Repeat "q" Macro
            {
                mode = [ "n" ];
                key = ",";
                action = "@q";
                options = {
                    desc = "Clear Search";
                    noremap = true;
                    silent = true;
                };
            }

            # Visual Mode
            # Stay in Indent Mode
            {
                mode = [ "v" ];
                key = "<";
                action = "<gv";
                options = {
                    desc = "Clear Search";
                    noremap = true;
                    silent = true;
                };
            }
            {
                mode = [ "v" ];
                key = ">";
                action = ">gv";
                options = {
                    desc = "Clear Search";
                    noremap = true;
                    silent = true;
                };
            }

            # Move Text Up/Down
            {
                mode = [ "v" ];
                key = "<A-j>";
                action = ":m .+1<CR>==";
                options = {
                    desc = "Clear Search";
                    noremap = true;
                    silent = true;
                };
            }
            {
                mode = [ "v" ];
                key = "<A-k>";
                action = ":m .-2<CR>==";
                options = {
                    desc = "Clear Search";
                    noremap = true;
                    silent = true;
                };
            }

            # Keep Most Recent Paste in Register
            {
                mode = [ "v" ];
                key = "p";
                action = "'_dP";
                options = {
                    desc = "Clear Search";
                    noremap = true;
                    silent = true;
                };
            }

            # Visual Block Mode
            # Move Text Up/Down
            {
                mode = [ "x" ];
                key = "J";
                action = ":move '>+1<CR>gv-gv";
                options = {
                    desc = "Clear Search";
                    noremap = true;
                    silent = true;
                };
            }
            {
                mode = [ "x" ];
                key = "K";
                action = ":move '<-2<CR>gv-gv";
                options = {
                    desc = "Clear Search";
                    noremap = true;
                    silent = true;
                };
            }
            {
                mode = [ "x" ];
                key = "<A-j>";
                action = ":move '>+1<CR>gv-gv";
                options = {
                    desc = "Clear Search";
                    noremap = true;
                    silent = true;
                };
            }
            {
                mode = [ "x" ];
                key = "<A-k>";
                action = ":move '<-2<CR>gv-gv";
                options = {
                    desc = "Clear Search";
                    noremap = true;
                    silent = true;
                };
            }
        ];
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
            cmp = {
                enable = true;
                settings = {
                    completion.completeopt = "menu,menuone,preview,noselect";
                    snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
                    mapping = {
                        __raw = ''
                            cmp.mapping.preset.insert({
                                ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                                ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                                ["<C-Space>"] = cmp.mapping.complete(),
                                ["<C-e>"] = cmp.mapping.abort(),
                                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                            })
                        '';
                    };
                    sources = [
                        {
                            name = "nvim_lsp";
                        }
                        {
                            name = "buffer";
                        }
                        {
                            name = "path";
                        }
                        {
                            name = "luasnip";
                        }
                        {
                            name = "crates";
                        }
                    ];
                };
            };
            cmp-buffer.enable = true;
            cmp_luasnip.enable = true;
            cmp-nvim-lsp.enable = true;
            cmp-path.enable = true;
            comment.enable = true;
            conform-nvim = {
                enable = true;
            };
            crates-nvim = {
                enable = true;
                extraOptions = {
                    popup = {
                        autofocus = true;
                        show_version_date = true;
                    };
                    # lsp = {
                    #     enabled = true;
                    #     completion = true;
                    #     hover = true;
                    # };
                    # completion = {
                    #     cmp = {
                    #         enabled = true;
                    #     };
                    # };
                };
            };
            # diffview.enable = true;
            friendly-snippets.enable = true;
            gitsigns = {
                enable = true;
                settings = {
                    current_line_blame = true;
                    current_line_blame_opts.delay = 0;
                    current_line_blame_formatter = "<author>, <author_time:%m-%d-%Y> - <summary>";
                    preview_config = {
                        col = 3;
                    };
                };
            };
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
                            "   "
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
            lsp = {
                enable = true;
                inlayHints = true;
                keymaps = {
                    silent = true;
                    diagnostic = {
                        "<leader>d" = {
                            action = "open_float";
                            desc = "Show Diagnostics";
                        };
                        "]d" = {
                            action = "goto_next";
                            desc = "Next Diagnostics";
                        };
                        "[d" = {
                            action = "goto_prev";
                            desc = "Prev Diagnostics";
                        };
                    };
                    lspBuf = {
                        gd = {
                            action = "definition";
                            desc = "Go to definition";
                        };
                        gD = {
                            action = "declaration";
                            desc = "Go to declaration";
                        };
                        gi = {
                            action = "implementation";
                            desc = "Go to implementation";
                        };
                        gr = {
                            action = "references";
                            desc = "Go to references";
                        };
                        K = {
                            action = "hover";
                            desc = "Hover";
                        };
                        "<C-k>" = {
                            action = "signature_help";
                            desc = "Show Signature";
                        };
                        "<leader>rn" = {
                            action = "rename";
                            desc = "Rename on symbol";
                        };
                        "<leader>ca" = {
                            action = "code_action";
                            desc = "Code Action";
                        };
                    };
                };
                servers = {
                    ansiblels.enable = true;
                    # arduino_language_server.enable = true;
                    bashls.enable = true;
                    clangd.enable = true;
                    # cmake.enable = true;
                    # csharp_ls.enable = true;
                    # cssls.enable = true;
                    # docker_compose_language_service.enable = true;
                    # dockerls.enable = true;
                    # html.enable = true;
                    # htmx.enable = true;
                    # jqls.enable = true;
                    lua_ls = {
                        enable = true;
                        settings = {
                            diagnostics.globals = [ "vim" ];
                            hint.enables = true;
                        };
                    };
                    # markdown_oxide.enable = true;
                    # nginx_language_server.enable = true;
                    pyright.enable = true;
                    # tailwindcss.enable = true;
                    taplo.enable = true;
                    # terraform_lsp.enable = true;
                    # terraformls.enable = true;
                    yamlls.enable = true;
                };
            };
            lspkind = {
                enable = true;
                cmp = {
                    enable = true;
                    maxWidth = 50;
                    ellipsisChar = "...";
                };
            };
            lualine.enable = true;
            luasnip = {
                enable = true;
                settings = {};
            };
            markdown-preview.enable = true;
            mini.enable= true;
            neotest = {
                enable = true;
                settings = {
                    output.open_on_run = true;
                    status.virtual_text = true;
                };

            };
            noice = {
                enable = true;
                settings = {
                    lsp = {
                        override = {
                            "vim.lsp.util.convert_input_to_markdown_lines" = true;
                            "vim.lsp.util.stylize_markdown" = true;
                            "cmp.entry.get_documentation" = true;
                        };
                    };
                    presets = {
                        bottom_search = true;
                        command_palette = true;
                        long_message_to_split = true;
                    };
                    # Popup is in the way with sed
                    views.confirm.backend = "split";
                };
            };
            notify = {
                enable = true;
                timeout = 3000;
            };
            nvim-autopairs.enable = true;
            # TODO: nvim-bufdel.enable = true;
            nvim-lightbulb.enable = true;
            nvim-tree = {
                enable = true;
                diagnostics.enable = true;
                disableNetrw = true;
                filters.dotfiles = true;
                git.ignore = true;
                openOnSetup = true;
                sortBy = "case_sensitive";
                renderer = {
                    groupEmpty = true;
                    highlightGit = true;
                    # highlightDiagnostics = true;
                    # indent_markers.enable = true;
                };
                # view.float = true;
            };
            nvim-ufo = {
                enable = true;
            };
            rustaceanvim = {
                enable = true;
                settings = {
                    rust-analyzer = {
                        cargo.features = "all";
                        check.command = "clippy";
                        procMacro = {
                            enable = true;
                            # ignored.leptos_macros = {
                            #     "component";
                            #     "server";
                            # };
                        };
                    };
                };
            };
            telescope = {
                enable = true;
                extensions = {
                    fzf-native.enable = true;
                    ui-select.enable = true;
                };
                keymaps = {
                    "<leader>fd" = {
                        action = "diagnostics";
                        options.desc = "Diagnostics";
                    };
                    "<leader>ff" = {
                        action = "find_files";
                        options.desc = "Find Plugin File";
                    };
                    "<leader>fg" = {
                        action = "live_grep";
                        options.desc = "Live Grep";
                    };
                    "<leader>fw" = {
                        action = "grep_string";
                        options.desc = "Grep String";
                    };
                };
            };
            todo-comments = {
                enable = true;
                keymaps = {
                    todoTelescope.key = "<leader>ft";
                };
            };
            treesitter = {
                enable = true;
                settings = {
                    indent.enable = true;
                    highlight.enable = true;
                };
            };
            treesitter-refactor = {
                enable = true;
                highlightCurrentScope.enable = true;
                highlightDefinitions.enable = true;
            };
            trim = {
                enable = true;
                settings.highlight = true;
            };
            vim-surround.enable = true;
            web-devicons.enable = true;
            which-key = {
                enable = true;
            };
        };
        # TODO: Find a better way to manage plugin hotkeys
        extraConfigLua = ''
            local opts = { silent = true }

            -- Buffer Delete
            -- vim.keymap.set("n", "<leader>bd", "<cmd>BufDelOthers<CR>", { desc = "Delete all other buffers" })

            -- Crates (Cargo.toml)
            -- Overview
            vim.keymap.set("n", "<leader>cd", function() require("crates").show_dependencies_popup(opts) end, { desc = "Show Dependencies" })
            vim.keymap.set("n", "<leader>cf", function() require("crates").show_features_popup(opts) end, { desc = "Show Features" })
            vim.keymap.set("n", "<leader>cv", function() require("crates").show_versions_popup(opts) end, { desc = "Show Versions" })
            -- Update
            vim.keymap.set("n", "<leader>cu", function() require("crates").update_crate(opts) end, { desc = "Update Crate" })
            vim.keymap.set("n", "<leader>ca", function() require("crates").update_all_crates(opts) end, { desc = "Update All Crates" })
            -- Upgrade
            vim.keymap.set("n", "<leader>cU", function() require("crates").upgrade_crate(opts) end, { desc = "Upgrade Crate" })
            vim.keymap.set("n", "<leader>cA", function() require("crates").upgrade_all_crates(opts) end, { desc = "Upgrade All Crates" })
            -- External Pages
            vim.keymap.set("n", "<leader>cC", function() require("crates").open_crates_io(opts) end, { desc = "Open crates.io" })
            vim.keymap.set("n", "<leader>cD", function() require("crates").open_documentation(opts) end, { desc = "Open Documentation" })
            vim.keymap.set("n", "<leader>cH", function() require("crates").open_homepage(opts) end, { desc = "Open Homepage" })
            vim.keymap.set("n", "<leader>cR", function() require("crates").open_repository(opts) end, { desc = "Open Repository" })

            -- Git Hunk Navigation
            vim.keymap.set({ "n", "v" }, "]g", function() require("gitsigns.actions").next_hunk({}) end, { desc = "Jump to next git hunk" })
            vim.keymap.set({ "n", "v" }, "[g", function() require("gitsigns.actions").prev_hunk({}) end, { desc = "Jump to prev git hunk" })

            -- Markdown Preview
            vim.keymap.set("n", "<leader>md", "<cmd>MarkdownPreview<CR>", { desc = "Markdown Preview" })

            -- Neotest
            vim.keymap.set("n", "<leader>t", "", { desc = "+test" })
            vim.keymap.set("n", "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Run File" })
            vim.keymap.set("n", "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, { desc = "Run All Test Files" })
            vim.keymap.set("n", "<leader>tr", function() require("neotest").run.run() end, { desc = "Run Nearest" })
            vim.keymap.set("n", "<leader>tl", function() require("neotest").run.run_last() end, { desc = "Run Last" })
            vim.keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Toggle Summary" })
            vim.keymap.set("n", "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, { desc = "Show Output" })
            vim.keymap.set("n", "<leader>tO", function() require("neotest").output_panel.toggle() end, { desc = "Toggle Output Panel" })
            vim.keymap.set("n", "<leader>tS", function() require("neotest").run.stop() end, { desc = "Stop" })
            vim.keymap.set("n", "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, { desc = "Toggle Watch" })

            -- Notify
            vim.keymap.set("n", "<leader><leader>", function() require("notify").dismiss({ silent = true, pending = true }) end, { desc = "Dismiss all notifications" })

            -- Todo-comments
            vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next comment keyword" })
            vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous comment keyword" })

            -- which-key
            vim.keymap.set("n", "<leader>?", function() require("which-key").show({ global = false }) end, { desc = "Show Keymaps" })
        '';
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

            # Number
            number = true;              # set numbered lines
            relativenumber = false;     # set relative numbered lines
            numberwidth = 2;            # set number column width to 2 {default 4}
            signcolumn = "yes";         # always show the sign column, otherwise it would shift the text each time

            wrap = false;               # display lines as one long line
            scrolloff = 8;              # decide when to vertically scroll
            sidescrolloff = 8;          # decide when to horizontally scroll
        };
    };
}
