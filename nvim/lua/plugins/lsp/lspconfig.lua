return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "mrcjkb/rustaceanvim",
    },
    config = function()
        vim.lsp.setup = function(ls, config)
            if config then vim.lsp.config[ls] = config end
            vim.lsp.enable(ls)
        end
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- Configure each LSP server
        vim.lsp.config('bashls', {})
        vim.lsp.config('clangd', {})
        vim.lsp.config('lua_ls', {
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
        vim.lsp.config('pyright', {})
        vim.lsp.config('rust-analyzer', {})
        vim.lsp.config('taplo', {})
    end,
}
