local M = {
    "simrat39/rust-tools.nvim",
    event = "VeryLazy",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-lua/plenary.nvim",
    },
    opts = {
        tools = { -- rust-tools options

            -- how to execute terminal commands
            -- options right now: termopen / quickfix
            -- executor = require("rust-tools/executors").termopen,

            -- callback to execute once rust-analyzer is done initializing the workspace
            -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
            on_initialized = nil,

            -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
            reload_workspace_from_cargo_toml = true,

            -- These apply to the default RustSetInlayHints command
            inlay_hints = {
                -- automatically set inlay hints (type hints)
                -- default: true
                auto = true,

                -- Only show inlay hints for the current line
                only_current_line = false,

                -- whether to show parameter hints with the inlay hints or not
                -- default: true
                show_parameter_hints = true,

                -- prefix for parameter hints
                -- default: "<-"
                parameter_hints_prefix = "<- ",

                -- prefix for all the other hints (type, chaining)
                -- default: "=>"
                other_hints_prefix = "=> ",

                -- whether to align to the lenght of the longest line in the file
                max_len_align = false,

                -- padding from the left if max_len_align is true
                max_len_align_padding = 1,

                -- whether to align to the extreme right or not
                right_align = false,

                -- padding from the right if right_align is true
                right_align_padding = 7,

                -- The color of the hints
                highlight = "Comment",
            },

            -- options same as lsp hover / vim.lsp.util.open_floating_preview()
            hover_actions = {

                -- the border that is used for the hover window
                -- see vim.api.nvim_open_win()
                border = {
                    { "╭", "FloatBorder" },
                    { "─", "FloatBorder" },
                    { "╮", "FloatBorder" },
                    { "│", "FloatBorder" },
                    { "╯", "FloatBorder" },
                    { "─", "FloatBorder" },
                    { "╰", "FloatBorder" },
                    { "│", "FloatBorder" },
                },

                -- whether the hover action window gets automatically focused
                -- default: false
                auto_focus = false,
            },

            -- all the opts to send to nvim-lspconfig
            -- these override the defaults set by rust-tools.nvim
            -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
            server = {
                on_attach = function(client, bufnr)
                    require("plugins.lsp.lspconfig").common_on_attach(client, bufnr)
                end,
                on_init = require("plugins.lsp.lspconfig").common_on_init,
                -- capabilities = require("plugins.lsp").common_capabilities(),
                settings = {
                    ["rust-analyzer"] = {
                        imports = {
                            granularity = {
                                group = "module",
                            },
                            prefix = "self",
                        },
                        cargo = {
                            buildScripts = {
                                enable = true,
                            },
                        },
                        procMacro = {
                            enable = true,
                        },
                        checkOnSave = {
                            command = "clippy",
                        },
                        rustfmt = {
                            extraArgs = "+nightly",
                        },
                        -- diagnostics = { disabled = "rustc" }
                    },
                },
            },
            config = function(_, opts)
                require("rust-tools").setup(opts)
            end,
        },
    },
}
return M
