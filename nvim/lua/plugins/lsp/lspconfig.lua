vim.g.rustaceanvim = {
    server = {
        default_settings = {
            ["rust-analyzer"] = {
                cargo = {
                    buildScripts = {
                        enable = true,
                    },
                },
                checkOnSave = {
                    command = "clippy",
                },
                rustfmt = {
                    extraArgs = { "+nightly" },
                },
            },
        },
    },
}

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "mrcjkb/rustaceanvim",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- Configure each LSP server
        lspconfig["pyright"].setup {}
        lspconfig["lua_ls"].setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    hint = {
                        enable = true
                    }
                }
            }
        })
        -- Do nothing, instead rely on rust-tools
        lspconfig["rust-analyzer"] = {}
    end,
}
