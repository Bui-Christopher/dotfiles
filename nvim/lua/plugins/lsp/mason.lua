return {
    "williamboman/mason.nvim",
    event = "BufReadPre",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            ensure_installed = {
                "bashls",
                "lua_ls",
                "pyright",
                "rust_analyzer",
                "taplo"
            },
            automatic_installation = true,
        })
    end,
}
