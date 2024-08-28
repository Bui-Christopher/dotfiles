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
        lspconfig["bashls"].setup {}
        lspconfig["clangd"].setup {}
        lspconfig["lua_ls"].setup({
            settings = {
                Lua = {
                    format = {
                        enable = true,
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    hint = {
                        enable = true
                    }
                }
            }
        })
        lspconfig["pyright"].setup {}
        lspconfig["rust-analyzer"] = {}
        lspconfig["taplo"].setup {} -- toml
    end,
}
