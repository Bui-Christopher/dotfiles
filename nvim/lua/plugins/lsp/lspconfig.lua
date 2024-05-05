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
        lspconfig["taplo"].setup {} -- toml
        lspconfig["bashls"].setup {}
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
        lspconfig["rust-analyzer"] = {}
    end,
}
