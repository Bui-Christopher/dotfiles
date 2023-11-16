return {
    "simrat39/rust-tools.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-lua/plenary.nvim",
    },
    ft = "rust",
    opts = {
        server = {
            on_attach = require("plugins.lsp.lspconfig").on_attach,
            capabilities = require("plugins.lsp.lspconfig").capabilities,
            settings = {
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
        config = function(_, opts)
            require("rust-tools").setup(opts)
        end,
    },
}
